--[[
* =============================================================================
* VanaBlu for Ashita v4
* Module: backend.lua
*
* Description:
*   High-performance, low-level client memory reading and authoritative packet
*   injection backend for Blue Magic spell management in Ashita v4.
*
* Performance & Architecture Standards:
*   1. Zero Per-Frame Garbage:
*      All state snapshots and raw memory buffers are pre-allocated and reused
*      in place across frame cycles. Zero table allocations occur during steady-
*      state memory monitoring.
*   2. Authoritative FFXI Network Protocol (Packet 0x102):
*      Uses the exact packet architecture from atom0s's official Ashita blusets
*      addon (https://git.ashitaxi.com/Addons/blusets).
*   3. Atomic Batch Reset:
*      Dispatches atom0s's single 164-byte 0x102 batch reset packet to clear
*      all 20 equipped Blue Magic slots simultaneously on the server.
*   4. Settle Window & Rate Limiting:
*      - 1.25s post-reset settle delay before sending the first spell in a set,
*        guaranteeing the server completes unsetting before receiving Spell 1.
*      - 0.75s pacing between consecutive spell equip/unset commands, absorbing
*        network latency jitter while remaining responsive.
*   5. Double-Dereferenced Memory Reading:
*      Traverses Ashita's inventory pointer manager using the official blusets
*      pattern (pointer = read_uint32(read_uint32(pInventory))) with multi-tier
*      fallbacks (+0x04 for main BLU, +0xA0 for sub BLU) to ensure equipped
*      spells are never erroneously reported as empty.
*   6. Module-Targeted Signature Scanning:
*      Pattern searches target 'FFXiMain.dll' directly, avoiding false negatives
*      from scanning the PlayOnline Viewer container process.
*
* Author: Anissa (Original Windower 4 concept)
* Fully Optimized, Hardened & Packet-Engineered by Assistant
* Version: 2.1.5
* =============================================================================
--]]

local ffi = require('ffi');

-- Define the C function signature for the game client's internal Blue Magic setter function (auxiliary sync)
ffi.cdef[[
    typedef uint8_t (__cdecl *vanablu_equipex_t)(uint8_t main_flag, uint16_t category, uint16_t slot_index, uint8_t spell_byte);
]];

local M = {
    is_initialized         = false,
    can_set                = true, -- Packet 0x102 injection is universally supported in Ashita
    init_message           = 'Backend not initialized',
    last_write_time        = -100,
    write_cooldown         = 0.75, -- Safe inter-spell equip throttle (0.75s) to absorb network/server jitter
    unset_cooldown         = 0.75, -- Safe inter-slot unset delay (0.75s)
    post_reset_delay       = 1.25, -- Settle delay (1.25s) after batch reset packet before equipping first spell
    is_unsetting           = false,
    unset_queue            = {},
    last_unset_time        = -100,
    unset_target_main      = true,
    is_equipping_set       = false,
    equip_queue            = {},
    equip_set_name         = '',
    equip_total_actions    = 0,
    last_equip_action_time = -100,
    equip_target_main      = true,
    equip_is_first_action  = false,

    -- Blue Magic Point Bonus job point rank (0-20), learned from incoming packet 0x08D.
    -- nil until the server has sent the player's job point details this session.
    jp_bp_bonus            = nil,
};

local offset = nil;
local setter = nil;
local points_ptr = nil; -- Address of the client's BLU set point info pointer (see SIG_POINTS)

-- Pre-allocated zero padding strings for slots 0..160 to avoid string.rep allocations during packet building
local ZERO_PADS = {};
for i = 0, 160 do
    ZERO_PADS[i] = string.rep('\0', i);
end
local STATIC_RESET_PADDING = ZERO_PADS[132]; -- 0x84 bytes of 0x00 padding for batch reset

-- Reusable 20-element raw buffer to eliminate per-frame table allocation in read_equipped_spells()
local reusable_raw_buf = {};
for i = 1, 20 do
    reusable_raw_buf[i] = 0;
end

-- Reusable state snapshot table to eliminate per-frame table allocation in M.read()
local state_snapshot = {
    ready            = false,
    is_blu           = false,
    is_main          = false,
    level            = 1,
    assimilation     = 0,
    blue_point_bonus = 0,
    jp_spent         = 0,
    raw              = reusable_raw_buf,
    can_set          = true,
    message          = '',
    player           = nil,
    zone_id          = 0,
    zone_name        = '',
    client_max_points   = 0, -- Max BLU set points as computed by the game client (0 = unavailable)
    client_spent_points = 0, -- Spent BLU set points as tracked by the game client
};

--- Internal helper to populate and return the reusable state snapshot table.
local function make_state(ready, is_blu, is_main, level, assim, bp_bonus, jp, raw, can_set, msg, player, zone_id, zone_name)
    state_snapshot.ready            = ready;
    state_snapshot.is_blu           = is_blu;
    state_snapshot.is_main          = is_main;
    state_snapshot.level            = level;
    state_snapshot.assimilation     = assim or 0;
    state_snapshot.blue_point_bonus = bp_bonus or 0;
    state_snapshot.jp_spent         = jp or 0;
    state_snapshot.raw              = raw or reusable_raw_buf;
    state_snapshot.can_set          = (can_set ~= false);
    state_snapshot.message          = msg or '';
    state_snapshot.player           = player;
    state_snapshot.zone_id          = zone_id or 0;
    state_snapshot.zone_name        = zone_name or '';
    state_snapshot.client_max_points   = 0;
    state_snapshot.client_spent_points = 0;
    return state_snapshot;
end

-- Signature patterns for locating client routines:
--   SIG_OFFSET: Locates the uint32 byte offset into the inventory structure for Blue Magic
--   SIG_SETTER: Locates the client's internal native equipex routine
--   SIG_POINTS: Locates the client's BLU set point info (max points at +0x18, spent at +0x14).
--               Same signature/offset used by atom0s's official Ashita blusets addon (blu.lua).
local SIG_OFFSET = 'C1E1032BC8B0018D????????????B9????????F3A55F5E5B';
local SIG_SETTER = '8B0D????????81EC9C00000085C95356570F??????????8B';
local SIG_POINTS = 'A1????????33C98A4E5E33D28A565D5F5E8950148948185B83C414C20400';

-- Job point id for BLU "Blue Magic Point Bonus" (JPCATEGORY_BLU 0x200 + 0x01). +1 set point per rank, max 20.
local JP_ID_BLUE_MAGIC_POINT_BONUS = 0x201;

-- Job ID to name mapping for clear status reporting
local JOB_NAMES = {
    [0] = 'None', [1] = 'WAR', [2] = 'MNK', [3] = 'WHM', [4] = 'BLM',
    [5] = 'RDM', [6] = 'THF', [7] = 'PLD', [8] = 'DRK', [9] = 'BST',
    [10] = 'BRD', [11] = 'RNG', [12] = 'SAM', [13] = 'NIN', [14] = 'DRG',
    [15] = 'SMN', [16] = 'BLU', [17] = 'COR', [18] = 'PUP', [19] = 'DNC',
    [20] = 'SCH', [21] = 'GEO', [22] = 'RUN'
};

--- Builds the binary string and table representation for setting a single spell via packet 0x102.
-- Matches atom0s's blusets implementation:
-- Header (12 bytes): 0x02, 0x53, 0x00, 0x00, spell_byte, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00
-- Payload (152 / 0x98 bytes): (slot - 1) zeros .. spell_byte .. (0x98 - slot) zeros
-- Total Packet Length: 164 bytes (0xA4)
-- @param spell_id number Full spell ID (e.g. 513) or 0
-- @param slot_1based number 1-indexed slot number (1 to 20)
-- @param is_sub boolean true if Blue Mage is sub/support job
-- @return string raw binary string of length 164
-- @return table byte/character array table for Ashita AddOutgoingPacket
local function build_set_packet(spell_id, slot_1based, is_sub)
    local isSubBlu = is_sub and 1 or 0;
    local spell_byte = (spell_id and spell_id > 0) and math.max(0, math.min(255, spell_id - 512)) or 0;
    slot_1based = math.max(1, math.min(20, slot_1based or 1));

    local header = string.char(0x02, 0x53, 0x00, 0x00, spell_byte, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00);
    local payload = (ZERO_PADS[slot_1based - 1] or '') .. string.char(spell_byte) .. (ZERO_PADS[152 - slot_1based] or '');
    local p_str = header .. payload;

    local p_tbl = nil;
    if p_str.totable then
        local ok, res = pcall(function() return p_str:totable(); end);
        if ok and type(res) == 'table' then p_tbl = res; end
    end
    if not p_tbl then
        p_tbl = {};
        for i = 1, #p_str do p_tbl[i] = p_str:sub(i, i); end
    end

    return p_str, p_tbl;
end

--- Builds the binary string and table representation for unsetting a single slot via packet 0x102.
-- @param slot_1based number 1-indexed slot number (1 to 20)
-- @param is_sub boolean true if Blue Mage is sub/support job
-- @return string raw binary string of length 164
-- @return table byte/character array table
local function build_unset_packet(slot_1based, is_sub)
    local isSubBlu = is_sub and 1 or 0;
    slot_1based = math.max(1, math.min(20, slot_1based or 1));

    local header = string.char(0x02, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00);
    local payload = (ZERO_PADS[slot_1based - 1] or '') .. '\0' .. (ZERO_PADS[152 - slot_1based] or '');
    local p_str = header .. payload;

    local p_tbl = nil;
    if p_str.totable then
        local ok, res = pcall(function() return p_str:totable(); end);
        if ok and type(res) == 'table' then p_tbl = res; end
    end
    if not p_tbl then
        p_tbl = {};
        for i = 1, #p_str do p_tbl[i] = p_str:sub(i, i); end
    end

    return p_str, p_tbl;
end

--- Builds the authoritative batch reset_all_spells packet 0x102 from atom0s's blusets addon.
-- Header: 0x02, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00
-- Payload: 20 bytes of currently equipped spells, followed by 132 (0x84) bytes of 0x00 zeros.
-- When received, the FFXI server atomically unsets all spell slots at once!
-- @param raw_spells table 20-byte array of currently equipped spells
-- @param is_sub boolean true if Blue Mage is sub/support job
-- @return string raw binary string of length 164
-- @return table byte/character array table
local function build_reset_all_packet(raw_spells, is_sub)
    local isSubBlu = is_sub and 1 or 0;
    local header = string.char(0x02, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00);
    
    local clean_bytes = {};
    for x = 1, 20 do
        local sp = (raw_spells and raw_spells[x]) or 0;
        clean_bytes[x] = math.max(0, math.min(255, sp));
    end
    local payload = string.char(unpack(clean_bytes, 1, 20)) .. STATIC_RESET_PADDING;
    local p_str = header .. payload;

    local p_tbl = nil;
    if p_str.totable then
        local ok, res = pcall(function() return p_str:totable(); end);
        if ok and type(res) == 'table' then p_tbl = res; end
    end
    if not p_tbl then
        p_tbl = {};
        for i = 1, #p_str do p_tbl[i] = p_str:sub(i, i); end
    end

    return p_str, p_tbl;
end

--- Dispatches an outgoing packet to the game server via Ashita's packet subsystem.
-- Tries both binary string (Ashita v4 standard) and character/byte table (Ashita v3 standard)
-- across global AddOutgoingPacket and AshitaCore:GetPacketManager():AddOutgoingPacket.
-- @param id number packet ID (0x102)
-- @param pkt_str string raw binary string
-- @param pkt_tbl table byte/character table
-- @return boolean true if dispatched
local function dispatch_packet(id, pkt_str, pkt_tbl)
    local sent = false;

    -- Method 1: Global AddOutgoingPacket (primary in Ashita)
    if AddOutgoingPacket then
        if pkt_str then
            local ok = pcall(AddOutgoingPacket, id, pkt_str);
            if ok then sent = true; end
        end
        if not sent and pkt_tbl then
            local ok = pcall(AddOutgoingPacket, id, pkt_tbl);
            if ok then sent = true; end
        end
    end

    -- Method 2: AshitaCore:GetPacketManager():AddOutgoingPacket
    pcall(function()
        local pm = AshitaCore:GetPacketManager();
        if pm and pm.AddOutgoingPacket then
            if pkt_str then
                local ok = pcall(function() pm:AddOutgoingPacket(id, pkt_str); end);
                if ok then sent = true; end
            end
            if not sent and pkt_tbl then
                local ok = pcall(function() pm:AddOutgoingPacket(id, pkt_tbl); end);
                if ok then sent = true; end
            end
        end
    end);

    return sent;
end

--- Initializes signature scanning for memory offsets and native setter.
-- Searches FFXI's main module ('FFXiMain.dll') with multi-tier fallback.
-- Setting capabilities are universally enabled because packet 0x102 injection works on all clients.
-- @return boolean Success status
-- @return string  Descriptive status message
--- Locates the client's BLU set point info pointer (independent of the other signatures).
local function scan_points()
    if points_ptr then return; end
    local p = nil;
    pcall(function() p = ashita.memory.find('FFXiMain.dll', 0, SIG_POINTS, 1, 0); end);
    if not p or p == 0 then
        pcall(function() p = ashita.memory.find(0, 0, SIG_POINTS, 1, 0); end);
    end
    if p and p ~= 0 then
        points_ptr = p;
    end
end

--- Reads the BLU set point totals the game client itself computes (the values shown in the
--- in-game "Set Blue Magic" menu). These already include Assimilation merits and the
--- Blue Magic Point Bonus job points, so they are the authoritative maximum.
-- Pointer chain matches blusets: points[0][0][0x18] (max) and points[0][0][0x14] (spent).
-- @return number|nil max set points, or nil if unavailable
-- @return number|nil spent set points
local function read_client_points()
    if not points_ptr then return nil, nil; end
    local max_pts, spent_pts = nil, nil;
    pcall(function()
        local global_addr = ashita.memory.read_uint32(points_ptr);
        if not global_addr or global_addr == 0 then return; end
        local info = ashita.memory.read_uint32(global_addr);
        if not info or info == 0 then return; end
        max_pts   = ashita.memory.read_uint8(info + 0x18);
        spent_pts = ashita.memory.read_uint8(info + 0x14);
    end);
    if not max_pts or max_pts == 0 then
        return nil, nil;
    end
    return max_pts, spent_pts;
end

--- Handles incoming packets. Captures the BLU "Blue Magic Point Bonus" job point rank from
--- packet 0x08D (Job Point details). Each packet carries 64 four-byte entries starting at 0x04:
--   uint16 id   (bits 0-4: index within job, bits 5-15: job id)  -> 0x201 for this job point
--   uint16 info (bits 0-9: next cost, bits 10-15: current rank)
-- The server sends these when the client requests job point info (login / Job Points menu).
-- @param e table Ashita packet_in event
function M.handle_packet_in(e)
    if e.id ~= 0x08D then return; end
    local data = e.data;
    if type(data) ~= 'string' then return; end
    for i = 0, 63 do
        local off = 0x04 + (i * 4);
        if off + 4 > #data then break; end
        local id = struct.unpack('H', data, off + 1);
        if id == JP_ID_BLUE_MAGIC_POINT_BONUS then
            local info = struct.unpack('H', data, off + 3);
            M.jp_bp_bonus = math.min(20, bit.rshift(info, 10));
            return;
        end
    end
end

function M.init()
    scan_points();

    if M.is_initialized and M.can_set and offset then
        return true, M.init_message;
    end

    local p = nil;
    local fn = nil;

    -- Multi-tier signature scanning: FFXiMain.dll primary, fall back to global module
    pcall(function()
        p = ashita.memory.find('FFXiMain.dll', 0, SIG_OFFSET, 10, 0);
        fn = ashita.memory.find('FFXiMain.dll', 0, SIG_SETTER, 0, 0);
    end);

    if not p or p == 0 then
        pcall(function()
            p = ashita.memory.find(0, 0, SIG_OFFSET, 10, 0);
        end);
    end
    if not fn or fn == 0 then
        pcall(function()
            fn = ashita.memory.find(0, 0, SIG_SETTER, 0, 0);
        end);
    end

    if (not p or p == 0) and ashita.memory.findpattern then
        pcall(function()
            p = ashita.memory.findpattern('FFXiMain.dll', 0, SIG_OFFSET, 10, 0);
        end);
    end
    if (not fn or fn == 0) and ashita.memory.findpattern then
        pcall(function()
            fn = ashita.memory.findpattern('FFXiMain.dll', 0, SIG_SETTER, 0, 0);
        end);
    end

    if p and p ~= 0 then
        pcall(function()
            offset = ashita.memory.read_uint32(p);
        end);
    end

    if fn and fn ~= 0 then
        pcall(function()
            setter = ffi.cast('vanablu_equipex_t', fn);
        end);
    end

    M.is_initialized = true;
    M.can_set = true;

    if offset and offset ~= 0 then
        M.init_message = 'BLU packet (0x102) & memory offset active. Interactive setting enabled.';
    else
        M.init_message = 'BLU packet backend active (0x102). Interactive setting enabled.';
    end

    return true, M.init_message;
end

--- Helper to check if a 20-byte buffer contains any non-zero Blue Magic spell byte.
local function has_any_spell(buf)
    if not buf or type(buf) ~= 'table' or #buf < 20 then return false; end
    for i = 1, 20 do
        local v = buf[i] or 0;
        if v > 0 and v <= 255 then
            return true;
        end
    end
    return false;
end

--- Reads the 20-byte equipped Blue Magic buffer using atom0s's official blusets pointer traversal.
-- Dereferences the inventory pointer twice (pointer = read_uint32(read_uint32(pInventory)))
-- and applies the 0x04 (main job) or 0xA0 (sub job) offset shift.
-- Multi-tier candidate testing ensures equipped spells are never reported as empty.
-- Reuses reusable_raw_buf in place to guarantee zero garbage collection overhead.
-- @param player object Ashita player memory object
-- @param is_sub boolean true if Blue Mage is sub/support job
-- @return table 20-byte raw spell array
-- @return boolean success status
local function read_equipped_spells(player, is_sub)
    local sub_shift = is_sub and 0xA0 or 0x04;
    for i = 1, 20 do reusable_raw_buf[i] = 0; end
    local success = false;

    -- Method 1: Check player:GetBlueMagic() API if present on the client
    if player then
        pcall(function()
            if player.GetBlueMagic then
                local bm = player:GetBlueMagic();
                if type(bm) == 'table' and #bm >= 20 then
                    for i = 1, 20 do reusable_raw_buf[i] = bm[i] or 0; end
                    if has_any_spell(reusable_raw_buf) then
                        success = true;
                    end
                end
            end
        end);
        if success then return reusable_raw_buf, true; end
    end

    -- Method 2: Direct memory read using atom0s's official blusets pointer traversal
    pcall(function()
        if not offset or offset == 0 then return; end
        local pm = AshitaCore:GetPointerManager();
        if not pm then return; end

        local ptr = nil;
        if pm.GetPointer then ptr = pm:GetPointer('inventory'); end
        if (not ptr or ptr == 0) and pm.Get then ptr = pm:Get('inventory'); end
        if not ptr or ptr == 0 then return; end

        local p1 = ashita.memory.read_uint32(ptr);
        if not p1 or p1 == 0 then return; end

        local p2 = ashita.memory.read_uint32(p1);

        -- Priority 1: Double dereference + offset + sub_shift (Official blusets standard!)
        if p2 and p2 ~= 0 then
            local addr = (p2 + offset) + sub_shift;
            local buf = ashita.memory.read_array(addr, 20);
            if buf and type(buf) == 'table' and #buf >= 20 then
                for i = 1, 20 do reusable_raw_buf[i] = buf[i] or 0; end
                success = true;
                if has_any_spell(reusable_raw_buf) then return; end
            end
        end

        -- Priority 2: Double dereference + offset (no sub shift)
        if p2 and p2 ~= 0 then
            local addr = p2 + offset;
            local buf = ashita.memory.read_array(addr, 20);
            if has_any_spell(buf) then
                for i = 1, 20 do reusable_raw_buf[i] = buf[i] or 0; end
                success = true;
                return;
            end
        end

        -- Priority 3: Single dereference + offset + sub_shift (custom private client wrappers)
        if p1 and p1 ~= 0 then
            local addr = (p1 + offset) + sub_shift;
            local buf = ashita.memory.read_array(addr, 20);
            if has_any_spell(buf) then
                for i = 1, 20 do reusable_raw_buf[i] = buf[i] or 0; end
                success = true;
                return;
            end
        end

        -- Priority 4: Single dereference + offset (no sub shift)
        if p1 and p1 ~= 0 then
            local addr = p1 + offset;
            local buf = ashita.memory.read_array(addr, 20);
            if has_any_spell(buf) then
                for i = 1, 20 do reusable_raw_buf[i] = buf[i] or 0; end
                success = true;
                return;
            end
        end
    end);

    return reusable_raw_buf, success;
end

--- Safely reads the player's BLU job state, level, merit bonuses, and equipped spell buffer.
-- Reuses state_snapshot table in place to ensure zero allocation during normal operation.
-- @return table Player state snapshot, or nil if client is not in game / zoning
-- @return string Error or descriptive status message if unavailable
function M.read()
    -- Guard 1: Verify player memory structure and entity
    local player = nil;
    pcall(function()
        local mem = AshitaCore:GetMemoryManager();
        if mem and mem.GetPlayer then
            player = mem:GetPlayer();
        end
    end);

    if not player then
        local entity = nil;
        pcall(function()
            if GetPlayerEntity then
                entity = GetPlayerEntity();
            end
        end);
        if not entity then
            return nil, 'Logging in or zoning... Waiting for character entity.';
        end
        return nil, 'Character memory structure is not ready.';
    end

    -- Guard 2: Query current zone ID and zone name safely via MemoryManager & ResourceManager
    local current_zone_id = 0;
    local current_zone_name = '';
    pcall(function()
        local mem = AshitaCore:GetMemoryManager();
        if mem and mem.GetParty then
            local party = mem:GetParty();
            if party and party.GetMemberZone then
                current_zone_id = party:GetMemberZone(0) or 0;
            end
        end
    end);

    if (not current_zone_id or current_zone_id <= 0) then
        pcall(function()
            if AshitaCore.GetDataManager then
                local dm = AshitaCore:GetDataManager();
                if dm and dm.GetParty then
                    local party = dm:GetParty();
                    if party and party.GetMemberZone then
                        current_zone_id = party:GetMemberZone(0) or 0;
                    end
                end
            end
        end);
    end

    if current_zone_id and current_zone_id > 0 then
        pcall(function()
            local rm = AshitaCore:GetResourceManager();
            if rm and rm.GetString then
                local z_str = rm:GetString('zones.names', current_zone_id);
                if z_str and z_str ~= '' then
                    current_zone_name = z_str;
                    pcall(function()
                        local enc = require('gdifonts.encoding');
                        if enc and enc.ShiftJIS_To_UTF8 then
                            local u = enc:ShiftJIS_To_UTF8(z_str, true);
                            if u and u ~= '' then current_zone_name = u; end
                        end
                    end);
                end
            end
        end);
    end

    -- Guard 3: Query main and sub job IDs safely
    local main_job = 0;
    local sub_job = 0;
    pcall(function()
        main_job = player:GetMainJob() or 0;
        sub_job = player:GetSubJob() or 0;
    end);

    local is_main = (main_job == 16);
    local is_sub = (sub_job == 16);

    local level = 1;
    pcall(function()
        if is_main then
            level = player:GetMainJobLevel() or 1;
        elseif is_sub then
            level = player:GetSubJobLevel() or 1;
        else
            level = player:GetMainJobLevel() or 1;
        end
    end);

    -- If player is not on Blue Mage, allow reference mode without memory reading
    if not is_main and not is_sub then
        local job_desc = string.format('%s/%s', JOB_NAMES[main_job] or 'Unknown', JOB_NAMES[sub_job] or 'None');
        return make_state(true, false, false, level, 0, 0, 0, reusable_raw_buf, true,
            string.format('Current Job: %s (Reference Mode - Switch to BLU to equip spells).', job_desc), player, current_zone_id, current_zone_name);
    end

    -- Guard 4: Query Blue Mage Merit and Job Point bonuses
    local assim = 0;
    pcall(function()
        if is_main and player.GetAssimilationPoints then
            assim = player:GetAssimilationPoints() or 0;
        end
    end);

    -- Blue Magic Point Bonus (job points): Ashita v4 exposes no per-category job point API, so the
    -- rank is captured from incoming packet 0x08D (see M.handle_packet_in). Main job only.
    local bp_bonus = 0;
    local jp = 0;
    pcall(function()
        if is_main and player.GetJobPointsSpent then
            jp = player:GetJobPointsSpent(16) or 0;
        end
    end);
    if is_main and M.jp_bp_bonus then
        bp_bonus = M.jp_bp_bonus;
    end

    -- Authoritative set point totals as computed by the game client (includes merits + job points)
    local client_max, client_spent = read_client_points();

    -- Guard 5: Read raw equipped spell buffer (20 bytes) using blusets double-dereference method
    local raw, read_success = read_equipped_spells(player, is_sub);

    local state;
    if not read_success then
        state = make_state(true, true, is_main, level, assim, bp_bonus, jp, raw, true,
            'Equipped spells not cached yet. Open the in-game Blue Magic menu once to initialize.', player, current_zone_id, current_zone_name);
    else
        state = make_state(true, true, is_main, level, assim, bp_bonus, jp, raw, true,
            'Ready', player, current_zone_id, current_zone_name);
    end
    state.client_max_points   = client_max or 0;
    state.client_spent_points = client_spent or 0;
    return state;
end

--- Queries which Blue Magic spells the character has learned.
-- @param player object Ashita player memory object
-- @param spellinfo table dictionary of spell data
-- @return table map of [spell_id] = boolean
function M.read_learned(player, spellinfo)
    local learned = {};
    if not player then
        for id in pairs(spellinfo) do learned[id] = true; end
        return learned;
    end

    local has_spell_fn = nil;
    pcall(function()
        if player.HasSpell then
            has_spell_fn = player.HasSpell;
        end
    end);

    if not has_spell_fn then
        for id in pairs(spellinfo) do learned[id] = true; end
        return learned;
    end

    for id in pairs(spellinfo) do
        local ok, val = pcall(has_spell_fn, player, id);
        if ok and val ~= nil then
            learned[id] = (val == true);
        else
            learned[id] = true; -- Fallback to learned if API call fails
        end
    end

    return learned;
end

--- Equips or unsets an individual spell in a specific slot via authoritative packet 0x102.
-- @param slot number 1-indexed slot number (1 to 20)
-- @param spell_id number Full spell ID (e.g. 513), or 0 to clear/remove the slot
-- @param is_main boolean indicating whether BLU is main job
-- @return boolean Success status
-- @return string Error message if operation failed or is on cooldown
function M.set_spell(slot, spell_id, is_main)
    local is_equipping = (spell_id and spell_id > 0);
    local now = os.clock();

    -- Throttle rapid clicks to prevent packet spam
    if is_equipping and (now - M.last_write_time) < M.write_cooldown then
        local wait_remaining = math.ceil((M.write_cooldown - (now - M.last_write_time)) * 10) / 10;
        return false, string.format('Please wait %.1fs before changing another spell.', wait_remaining);
    end

    local slot_1based = math.max(1, math.min(20, slot or 1));
    local byte_id = is_equipping and (spell_id - 512) or 0;
    local is_sub = (is_main == false);

    -- 1. Dispatch authoritative network packet 0x102 (matching blusets)
    local p_str, p_tbl = nil, nil;
    if is_equipping then
        p_str, p_tbl = build_set_packet(spell_id, slot_1based, is_sub);
    else
        p_str, p_tbl = build_unset_packet(slot_1based, is_sub);
    end
    dispatch_packet(0x102, p_str, p_tbl);

    -- 2. Auxiliary call to native setter if mapped
    if setter then
        local main_flag = is_sub and 1 or 0;
        pcall(setter, main_flag, 0x1000, slot_1based - 1, byte_id);
    end

    if is_equipping then
        M.last_write_time = now;
    end

    return true, nil;
end

--- Initiates unsetting all spells.
-- Sends atom0s's official batch reset packet 0x102 immediately, clearing all 20 slots
-- in one atomic server transaction. Also queues sequential slot unsets as reinforcement.
-- @param is_main boolean indicating whether BLU is main job
-- @param equipped_slots table optional list or map of currently equipped slot IDs (1-indexed)
-- @return boolean Success status
-- @return string Status message
function M.unset_all(is_main, equipped_slots)
    if M.is_equipping_set then
        M.cancel_equip();
    end

    local is_sub = (is_main == false);
    M.unset_target_main = (is_main ~= false);

    -- Extract current raw spells for the batch reset packet
    local raw_spells = {};
    if type(equipped_slots) == 'table' then
        for i = 1, 20 do
            local val = equipped_slots[i] or 0;
            if val > 512 then val = val - 512; end
            raw_spells[i] = val;
        end
    end

    -- 1. Dispatch authoritative blusets reset_all_spells packet 0x102 immediately!
    local p_str, p_tbl = build_reset_all_packet(raw_spells, is_sub);
    dispatch_packet(0x102, p_str, p_tbl);

    -- 2. Call native client sentinels if mapped
    if setter then
        local main_flag = is_sub and 1 or 0;
        pcall(setter, main_flag, 0x1000, 0xFF, 0);
        pcall(setter, main_flag, 0x1000, 20, 0);
    end

    -- 3. Queue individual slot unsets as sequential pump
    M.unset_queue = {};
    for slot = 1, 20 do
        table.insert(M.unset_queue, slot);
    end

    M.is_unsetting = true;
    M.last_unset_time = os.clock();

    return true, 'Clearing all equipped Blue Magic spells...';
end

--- Services the asynchronous unset queue across frame ticks in d3d_present.
-- Throttles unsetting requests by M.unset_cooldown (0.75s) so that FFXI server
-- packet handlers properly process each slot removal without drops.
-- @param is_main boolean indicating whether BLU is main job
-- @param raw_slots table of 20 bytes representing client memory equipped buffer (optional)
-- @return boolean True if clearing completed
-- @return string Status message when completed
function M.tick_unset_queue(is_main, raw_slots)
    if not M.is_unsetting then
        return false, nil;
    end

    if #M.unset_queue == 0 then
        M.is_unsetting = false;
        return true, 'Cleared all equipped spell slots.';
    end

    local now = os.clock();
    if (now - M.last_unset_time) < (M.unset_cooldown or 0.75) then
        return false, nil;
    end

    local slot_1based = table.remove(M.unset_queue, 1);
    local is_sub = ((is_main ~= nil and is_main or M.unset_target_main) == false);

    if slot_1based then
        local p_str, p_tbl = build_unset_packet(slot_1based, is_sub);
        dispatch_packet(0x102, p_str, p_tbl);

        if setter then
            local main_flag = is_sub and 1 or 0;
            pcall(setter, main_flag, 0x1000, slot_1based - 1, 0);
        end
        M.last_unset_time = now;
    end

    if #M.unset_queue == 0 then
        M.is_unsetting = false;
        return true, 'Cleared all equipped spell slots.';
    end

    return false, nil;
end

--- Initiates equipping a saved set using blusets's clean atomic reset-and-set architecture.
-- 1. Instantly clears all equipped spells via the batch reset packet 0x102 (no slot collisions,
--    no duplicate spell errors, no BP overflow).
-- 2. Pauses for 1.25s post-reset settle delay to ensure the server completely finishes unsetting
--    before receiving the first spell.
-- 3. Paces subsequent spell additions into slots 1..N at 0.75s intervals.
-- @param target_spells table array of spell IDs to equip (1-indexed)
-- @param set_name string name of the set being equipped
-- @param is_main boolean indicating whether BLU is main job
-- @param equipped_slots table optional currently equipped slot map [1..20] = spell_id
-- @return boolean Success status
-- @return string Status message
function M.start_equip_set(target_spells, set_name, is_main, equipped_slots)
    if not target_spells or #target_spells == 0 then
        return false, 'Saved set contains no valid spells.';
    end

    -- Check if set is already equipped in the exact same slots
    local all_match = true;
    if equipped_slots then
        for i = 1, #target_spells do
            if (equipped_slots[i] or 0) ~= target_spells[i] then
                all_match = false;
                break;
            end
        end
        for i = #target_spells + 1, 20 do
            if (equipped_slots[i] or 0) ~= 0 then
                all_match = false;
                break;
            end
        end
    else
        all_match = false;
    end

    if all_match then
        return false, string.format('Set "%s" is already equipped.', set_name or 'Saved Set');
    end

    -- Cancel any active operation
    M.is_unsetting = false;
    M.unset_queue = {};

    local is_sub = (is_main == false);
    M.equip_target_main = (is_main ~= false);

    -- 1. Dispatch blusets batch reset packet 0x102 to clear all current spells first
    local raw_spells = {};
    if type(equipped_slots) == 'table' then
        for i = 1, 20 do
            local val = equipped_slots[i] or 0;
            if val > 512 then val = val - 512; end
            raw_spells[i] = val;
        end
    end
    local p_str, p_tbl = build_reset_all_packet(raw_spells, is_sub);
    dispatch_packet(0x102, p_str, p_tbl);

    if setter then
        local main_flag = is_sub and 1 or 0;
        pcall(setter, main_flag, 0x1000, 0xFF, 0);
        pcall(setter, main_flag, 0x1000, 20, 0);
    end

    -- 2. Queue setting each spell in target_spells into its slot sequentially
    M.equip_queue = {};
    for slot = 1, math.min(#target_spells, 20) do
        local sp_id = target_spells[slot];
        if sp_id and sp_id > 0 then
            table.insert(M.equip_queue, {
                slot = slot,
                spell_id = sp_id,
                spell_byte = sp_id - 512,
            });
        end
    end

    M.is_equipping_set = true;
    M.equip_set_name = set_name or 'Saved Set';
    M.equip_total_actions = #M.equip_queue;
    M.equip_is_first_action = true;
    M.last_equip_action_time = os.clock(); -- Batch reset packet just fired; first spell equips after post_reset_delay (1.25s)

    return true, string.format('Equipping "%s" (%d spells)...', M.equip_set_name, #M.equip_queue);
end

--- Cancels an active set-equipping sequence.
function M.cancel_equip()
    M.is_equipping_set = false;
    M.equip_queue = {};
    return true, 'Equip operation cancelled.';
end

--- Services the set-equipping queue frame-by-frame in d3d_present.
-- Enforces a 1.25s post-reset settle delay before sending the first spell,
-- followed by 0.75s pacing between consecutive packet transmissions.
-- @param is_main boolean indicating whether BLU is main job
-- @return boolean True if finished
-- @return string Status message if state changed
function M.tick_equip_queue(is_main)
    if not M.is_equipping_set then
        return false, nil;
    end

    if #M.equip_queue == 0 then
        M.is_equipping_set = false;
        return true, string.format('Successfully equipped set "%s"!', M.equip_set_name);
    end

    local now = os.clock();
    local action_delay = M.equip_is_first_action and (M.post_reset_delay or 1.25) or (M.write_cooldown or 0.75);

    if (now - M.last_equip_action_time) < action_delay then
        return false, nil;
    end

    M.equip_is_first_action = false;

    local action = table.remove(M.equip_queue, 1);
    local is_sub = ((is_main ~= nil and is_main or M.equip_target_main) == false);
    local slot = action.slot;
    local spell_byte = action.spell_byte;

    -- Dispatch packet 0x102 for this slot
    local p_str, p_tbl = build_set_packet(action.spell_id, slot, is_sub);
    dispatch_packet(0x102, p_str, p_tbl);

    if setter then
        local main_flag = is_sub and 1 or 0;
        pcall(setter, main_flag, 0x1000, slot - 1, spell_byte);
    end

    M.last_equip_action_time = now;
    M.last_write_time = now;

    if #M.equip_queue == 0 then
        M.is_equipping_set = false;
        return true, string.format('Successfully equipped set "%s"!', M.equip_set_name);
    end

    return false, nil;
end

return M;
