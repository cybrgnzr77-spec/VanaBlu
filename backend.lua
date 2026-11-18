--[[
* =============================================================================
* VanaBlu for Ashita v4
* Module: backend.lua
*
* Description:
*   Game client access for VanaBlu: reads the player's Blue Mage state and
*   equipped spells from client memory, and changes spells by sending Blue
*   Magic set packets (0x102) to the server.
*
* How it works:
*   - Memory: the signatures, pointer chain and offsets are the ones used by
*     atom0s's blusets addon that ships with Ashita v4 (addons/blusets/blu.lua).
*     The equipped spell buffer is inventory -> [0] -> +offset, then +0x04 (BLU
*     main) or +0xA0 (BLU support).
*   - Changing spells: each change sends a 0x102 packet built like blusets'
*     "fast" mode and, when its signature is found, also calls the client's own
*     setter function (blusets' "safe" mode).
*   - Pacing: single spell changes are throttled to one every 0.75s; set loads
*     wait 1.25s after the clear packet, then send one spell every 0.75s.
*   - read() reuses one state table and one 20-byte buffer, so polling it every
*     frame does not allocate tables.
*
* Original bluGuide (Windower 4) by Anissa of Cerberus.
* =============================================================================
--]]

local ffi = require('ffi');
local unpack = unpack or table.unpack; -- LuaJIT global / Lua 5.2+ (tests)

-- Define the C function signature for the game client's internal Blue Magic setter function (auxiliary sync)
ffi.cdef[[
    typedef uint8_t (__cdecl *vanablu_equipex_t)(uint8_t main_flag, uint16_t category, uint16_t slot_index, uint8_t spell_byte);
]];

local M = {
    is_initialized         = false,
    can_set                = true, -- Spell changes are always attempted (packets need no signature)
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

    -- true while Blue Mage is the main or support job (updated by read()). Spell changes are refused
    -- otherwise, since the server ignores Blue Magic packets from other jobs.
    blu_active             = false,

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

-- Packet 0x102 layout (164 bytes), as read by LandSandBoat (0x102_extended_job.cpp):
--   0x00  header 0x02 0x53 0x00 0x00 (id/size/sync, filled in by the client)
--   0x04  SpellId     uint8   spell to set (spell id - 512), or 0 when unsetting
--   0x08  JobIndex    uint8   0x10 (BLU)
--   0x09  IsSubJob    uint8   1 if BLU is the support job (LandSandBoat does not check this)
--   0x0C  Spells[20]  uint8   setting: the spell byte in the target slot
--                             unsetting: the current spell byte in each slot to clear
--   0x20  padding up to 164 bytes

--- Converts a packet string into the byte table Ashita v4's AddOutgoingPacket expects.
local function to_bytes(p_str)
    return { p_str:byte(1, -1) };
end

--- Builds a packet that sets one spell in one slot (same layout as blusets' fast set).
-- @param spell_id number full spell id (e.g. 513)
-- @param slot_1based number slot 1..20
-- @param is_sub boolean true if BLU is the support job
-- @return table 164 packet bytes
local function build_set_packet(spell_id, slot_1based, is_sub)
    local isSubBlu = is_sub and 1 or 0;
    local spell_byte = (spell_id and spell_id > 0) and math.max(0, math.min(255, spell_id - 512)) or 0;
    slot_1based = math.max(1, math.min(20, slot_1based or 1));

    local header = string.char(0x02, 0x53, 0x00, 0x00, spell_byte, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00);
    local payload = (ZERO_PADS[slot_1based - 1] or '') .. string.char(spell_byte) .. (ZERO_PADS[152 - slot_1based] or '');
    return to_bytes(header .. payload);
end

--- Builds a packet for unsetting one slot.
-- Note: Spells[] is left all zero, so LandSandBoat finds no slot to clear and ignores this packet.
-- The removal itself is done by the client setter call that set_spell()/tick_unset_queue() make
-- right after sending it. (blusets' fast unset instead puts the slot's current spell byte here.)
-- @param slot_1based number slot 1..20
-- @param is_sub boolean true if BLU is the support job
-- @return table 164 packet bytes
local function build_unset_packet(slot_1based, is_sub)
    local isSubBlu = is_sub and 1 or 0;
    slot_1based = math.max(1, math.min(20, slot_1based or 1));

    local header = string.char(0x02, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00);
    local payload = (ZERO_PADS[slot_1based - 1] or '') .. '\0' .. (ZERO_PADS[152 - slot_1based] or '');
    return to_bytes(header .. payload);
end

--- Builds a packet that clears every listed slot at once (same layout as blusets' fast reset).
-- Spells[] carries the currently equipped spell bytes; the server unsets each one in a single
-- packet. It aborts at the first listed slot that is already empty, so the bytes must be current.
-- @param raw_spells table 20 current spell bytes (0 = empty)
-- @param is_sub boolean true if BLU is the support job
-- @return table 164 packet bytes
local function build_reset_all_packet(raw_spells, is_sub)
    local isSubBlu = is_sub and 1 or 0;
    local header = string.char(0x02, 0x53, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x10, isSubBlu, 0x00, 0x00);

    local clean_bytes = {};
    for x = 1, 20 do
        local sp = (raw_spells and raw_spells[x]) or 0;
        clean_bytes[x] = math.max(0, math.min(255, sp));
    end
    local payload = string.char(unpack(clean_bytes, 1, 20)) .. STATIC_RESET_PADDING;
    return to_bytes(header .. payload);
end

--- Sends an outgoing packet through Ashita v4's packet manager.
-- @param id number packet id (0x102)
-- @param bytes table packet bytes
-- @return boolean true if the packet was queued
local function dispatch_packet(id, bytes)
    local ok = pcall(function()
        AshitaCore:GetPacketManager():AddOutgoingPacket(id, bytes);
    end);
    return ok;
end

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
    local global_addr = ashita.memory.read_uint32(points_ptr);
    if not global_addr or global_addr == 0 then return nil, nil; end
    local info = ashita.memory.read_uint32(global_addr);
    if not info or info == 0 then return nil, nil; end
    local max_pts = ashita.memory.read_uint8(info + 0x18);
    if not max_pts or max_pts == 0 then
        return nil, nil;
    end
    return max_pts, ashita.memory.read_uint8(info + 0x14);
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

--- Finds the client addresses VanaBlu needs: the spell buffer offset, the client's spell setter
-- function and the set point info. Searches FFXiMain.dll first, then the whole process.
-- Spell changes stay enabled even if the setter is not found, because packets need no signature;
-- without the buffer offset the equipped spells simply read as empty.
-- @return boolean always true
-- @return string status message
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

--- Reads the 20 equipped spell bytes into reusable_raw_buf (the same read as blusets' get_spells()).
-- Address: [[inventory pointer]] + offset, then +0x04 (BLU main) or +0xA0 (BLU support).
-- @param is_sub boolean true if BLU is the support job
-- @return table the 20 spell bytes (0 = empty slot); reused on every call
-- @return boolean false if the buffer could not be read (offset not found or pointer not ready)
local function read_equipped_spells(is_sub)
    for i = 1, 20 do reusable_raw_buf[i] = 0; end
    if not offset or offset == 0 then
        return reusable_raw_buf, false;
    end

    local ptr = AshitaCore:GetPointerManager():Get('inventory');
    if not ptr or ptr == 0 then return reusable_raw_buf, false; end
    local p1 = ashita.memory.read_uint32(ptr);
    if not p1 or p1 == 0 then return reusable_raw_buf, false; end
    local p2 = ashita.memory.read_uint32(p1);
    if not p2 or p2 == 0 then return reusable_raw_buf, false; end

    local buf = ashita.memory.read_array(p2 + offset + (is_sub and 0xA0 or 0x04), 20);
    if type(buf) ~= 'table' then return reusable_raw_buf, false; end
    for i = 1, 20 do reusable_raw_buf[i] = buf[i] or 0; end
    return reusable_raw_buf, true;
end

-- Zone name cache: the name is looked up only when the zone id changes.
local cached_zone_id, cached_zone_name = 0, '';

--- Returns the English zone name for a zone id ('' if unknown). A found name is cached until the
-- zone changes; if the lookup finds nothing it is retried on the next call.
local function zone_name_for(zone_id)
    if zone_id ~= cached_zone_id then
        local name = '';
        if zone_id > 0 then
            name = AshitaCore:GetResourceManager():GetString('zones.names', zone_id);
            if type(name) ~= 'string' then name = ''; end
        end
        cached_zone_name = name;
        if name ~= '' or zone_id == 0 then
            cached_zone_id = zone_id;
        end
    end
    return cached_zone_name;
end

--- Reads the player's Blue Mage state and equipped spells. Called every frame while the window is
-- open, so it allocates no tables: the returned table (and its .raw buffer) is reused.
-- Callers should wrap it in pcall; it may raise if the client is mid-zone.
-- @return table|nil player state snapshot, or nil if the player is not loaded (logging in/zoning)
-- @return string|nil status message when the snapshot is nil
function M.read()
    local mem = AshitaCore:GetMemoryManager();
    local player = mem:GetPlayer();
    if not player then
        return nil, 'Logging in or zoning... Waiting for character data.';
    end

    local current_zone_id = mem:GetParty():GetMemberZone(0) or 0;
    local current_zone_name = zone_name_for(current_zone_id);

    local main_job = player:GetMainJob() or 0;
    local sub_job = player:GetSubJob() or 0;
    local is_main = (main_job == 16);
    local is_sub = (sub_job == 16) and not is_main;
    M.blu_active = is_main or is_sub;

    local level;
    if is_sub then
        level = player:GetSubJobLevel() or 1;
    else
        level = player:GetMainJobLevel() or 1;
    end

    -- Not on Blue Mage: reference mode (browse only, no memory reads)
    if not M.blu_active then
        local job_desc = string.format('%s/%s', JOB_NAMES[main_job] or 'Unknown', JOB_NAMES[sub_job] or 'None');
        return make_state(true, false, false, level, 0, 0, 0, reusable_raw_buf, true,
            string.format('Current Job: %s (Reference Mode - Switch to BLU to equip spells).', job_desc), player, current_zone_id, current_zone_name);
    end

    -- Merits and job points only apply to main-job BLU
    local assim, jp, bp_bonus = 0, 0, 0;
    if is_main then
        assim = player:GetAssimilationPoints() or 0;
        jp = player:GetJobPointsSpent(16) or 0;
        -- Ashita v4 has no per-job-point API, so the Blue Magic Point Bonus rank comes from
        -- incoming packet 0x08D (see M.handle_packet_in).
        bp_bonus = M.jp_bp_bonus or 0;
    end

    -- Set point totals computed by the game client itself (include merits and job points)
    local client_max, client_spent = read_client_points();

    local raw, read_success = read_equipped_spells(is_sub);

    local state = make_state(true, true, is_main, level, assim, bp_bonus, jp, raw, true,
        read_success and 'Ready' or 'Equipped spells not cached yet. Open the in-game Blue Magic menu once to initialize.',
        player, current_zone_id, current_zone_name);
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

--- Error returned by the spell-changing functions when Blue Mage is not the main or support job.
local NOT_BLU_MSG = 'Switch to Blue Mage (main or support job) to change spells.';

--- Equips or unsets one spell in one slot.
-- Sends a 0x102 packet and, when the client setter was found, also calls it (see build_unset_packet
-- for why both are needed when unsetting). Equipping is throttled to one change per write_cooldown.
-- @param slot number 1-indexed slot number (1 to 20)
-- @param spell_id number Full spell ID (e.g. 513), or 0 to clear/remove the slot
-- @param is_main boolean true if BLU is the main job, false if it is the support job
-- @return boolean Success status
-- @return string Error message if operation failed or is on cooldown
function M.set_spell(slot, spell_id, is_main)
    if not M.blu_active then
        return false, NOT_BLU_MSG;
    end
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

    -- 1. Send the 0x102 packet
    if is_equipping then
        dispatch_packet(0x102, build_set_packet(spell_id, slot_1based, is_sub));
    else
        dispatch_packet(0x102, build_unset_packet(slot_1based, is_sub));
    end

    -- 2. Also call the client's own setter, if found
    if setter then
        local main_flag = is_sub and 1 or 0;
        pcall(setter, main_flag, 0x1000, slot_1based - 1, byte_id);
    end

    if is_equipping then
        M.last_write_time = now;
    end

    return true, nil;
end

--- Starts unsetting all spells.
-- Sends one clear-all packet listing the equipped spells (build_reset_all_packet), then queues a
-- per-slot unset for all 20 slots, which tick_unset_queue() sends one every unset_cooldown seconds.
-- @param is_main boolean true if BLU is the main job, false if support, nil if unknown (treated as main)
-- @param equipped_slots table optional list or map of currently equipped slot IDs (1-indexed)
-- @return boolean Success status
-- @return string Status message
function M.unset_all(is_main, equipped_slots)
    if not M.blu_active then
        return false, NOT_BLU_MSG;
    end
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

    -- 1. Clear-all packet
    dispatch_packet(0x102, build_reset_all_packet(raw_spells, is_sub));

    -- 2. Client setter calls with slot indexes 0xFF and 20 (outside the 0-19 slot range)
    if setter then
        local main_flag = is_sub and 1 or 0;
        pcall(setter, main_flag, 0x1000, 0xFF, 0);
        pcall(setter, main_flag, 0x1000, 20, 0);
    end

    -- 3. Queue a per-slot unset for every slot (sent by tick_unset_queue)
    M.unset_queue = {};
    for slot = 1, 20 do
        table.insert(M.unset_queue, slot);
    end

    M.is_unsetting = true;
    M.last_unset_time = os.clock();

    return true, 'Clearing all equipped Blue Magic spells...';
end

--- Services the unset queue; called every frame from d3d_present.
-- Sends at most one slot unset every unset_cooldown (0.75s) seconds.
-- @param is_main boolean|nil BLU main (true) / support (false); nil keeps the job unset_all() started with
-- @param raw_slots table current equipped spell bytes (currently unused)
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
    if is_main == nil then is_main = M.unset_target_main; end
    local is_sub = (is_main == false);

    if slot_1based then
        dispatch_packet(0x102, build_unset_packet(slot_1based, is_sub));

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

--- Starts equipping a saved set.
-- 1. Sends one clear-all packet listing the equipped spells, so set spells can't collide with
--    spells already in other slots or exceed the set point limit while loading.
-- 2. Waits post_reset_delay (1.25s) for the server to process it before the first spell.
-- 3. Queues one set per spell into slots 1..N; tick_equip_queue() sends one every write_cooldown (0.75s).
-- Returns false without doing anything if the set is already equipped in the same slots.
-- @param target_spells table array of spell IDs to equip (1-indexed)
-- @param set_name string name of the set being equipped
-- @param is_main boolean indicating whether BLU is main job
-- @param equipped_slots table optional currently equipped slot map [1..20] = spell_id
-- @return boolean Success status
-- @return string Status message
function M.start_equip_set(target_spells, set_name, is_main, equipped_slots)
    if not M.blu_active then
        return false, NOT_BLU_MSG;
    end
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

    -- 1. Clear-all packet (plus the same client setter calls as unset_all)
    local raw_spells = {};
    if type(equipped_slots) == 'table' then
        for i = 1, 20 do
            local val = equipped_slots[i] or 0;
            if val > 512 then val = val - 512; end
            raw_spells[i] = val;
        end
    end
    dispatch_packet(0x102, build_reset_all_packet(raw_spells, is_sub));

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

--- Services the set-equipping queue; called every frame from d3d_present.
-- Waits post_reset_delay (1.25s) before the first spell, then write_cooldown (0.75s) between spells.
-- @param is_main boolean|nil BLU main (true) / support (false); nil keeps the job start_equip_set() started with
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
    if is_main == nil then is_main = M.equip_target_main; end
    local is_sub = (is_main == false);
    local slot = action.slot;
    local spell_byte = action.spell_byte;

    -- Set packet for this slot, plus the client setter call
    dispatch_packet(0x102, build_set_packet(action.spell_id, slot, is_sub));

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
