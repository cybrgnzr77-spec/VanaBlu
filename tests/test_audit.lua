--[[
  test_audit.lua - regression tests for the v1.0.3 efficiency / correctness audit.
  Runs under texlua (Lua 5.3) with Ashita v4 and ImGui stubbed.

  Usage: texlua test_audit.lua <addon_dir>

  Covers:
    - ImGui Begin/End always paired (collapsed window, mid-frame error) and style colors unwound
    - Equipped spell read uses only the blusets address (no phantom spell when the set is empty)
    - Sub-job BLU flag reaches the packet and the client setter (old `or true` bug)
    - Spell changes refused when BLU is neither main nor support job
    - Packet bytes: numeric table, 164 bytes, correct header / slot byte
    - Zone name looked up only when the zone changes; no require() calls while rendering
    - Cached trait rows match a fresh model.evaluate_trait after the equipped spells change
    - Search uses the precomputed lowercase names
]]
local ADDON = arg[1]
package.path = ADDON .. '/?.lua;' .. package.path
local real_print = print
local pass, fail = 0, 0
local function check(name, got, want)
    if got == want then
        pass = pass + 1
        real_print('PASS  ' .. name)
    else
        fail = fail + 1
        real_print(('FAIL  %s  (got %s, want %s)'):format(name, tostring(got), tostring(want)))
    end
end

-- ------------------------------------------------------------------ fake client memory
-- Layout modelled on blusets: [[inventory]] = BASE; spell buffer header at BASE+OFFSET
-- (JobIndex 0x10 first), main-job spells at +0x04, support-job spells at +0xA0.
local INV_PTR, P1, BASE, OFFSET = 0x1000, 0x2000, 0x10000, 0x200
local mem32 = { [INV_PTR] = P1, [P1] = BASE }
local main_spells, sub_spells = {}, {}
for i = 1, 20 do main_spells[i] = 0; sub_spells[i] = 0 end
local function bytes_at(addr, n)
    local t = {}
    for i = 1, n do
        local a = addr + i - 1
        local v = 0
        if a == BASE + OFFSET then v = 0x10 end                                   -- JobIndex
        if a >= BASE + OFFSET + 0x04 and a < BASE + OFFSET + 0x18 then v = main_spells[a - (BASE + OFFSET + 0x04) + 1] end
        if a >= BASE + OFFSET + 0xA0 and a < BASE + OFFSET + 0xB4 then v = sub_spells[a - (BASE + OFFSET + 0xA0) + 1] end
        t[i] = v
    end
    return t
end

local sent = {}          -- packets sent: { id = , bytes = }
local setter_calls = {}  -- client setter calls: { main_flag, category, slot_index, spell_byte }
local zone_lookups = 0
local zone_id = 116

local player = { main = 16, sub = 1, mlvl = 99, slvl = 49 }
function player:GetMainJob() return self.main end
function player:GetSubJob() return self.sub end
function player:GetMainJobLevel() return self.mlvl end
function player:GetSubJobLevel() return self.slvl end
function player:GetAssimilationPoints() return 5 end
function player:GetJobPointsSpent() return 500 end
function player:HasSpell(id) return true end
local skill = { GetSkill = function() return 424 end }
function player:GetCombatSkill() return skill end
local party = { GetMemberZone = function() return zone_id end, GetMemberTargetIndex = function() return 1 end }
local entity = { GetLocalPositionX = function() return 0 end, GetLocalPositionY = function() return 0 end }
local memmgr = { GetPlayer = function() return player end, GetParty = function() return party end, GetEntity = function() return entity end }
local resmgr = {
    GetString = function(_, tbl, id) if tbl == 'zones.names' then zone_lookups = zone_lookups + 1; return 'Zone ' .. id end end,
    GetSpellById = function() return nil end,
}
local pktmgr = { AddOutgoingPacket = function(_, id, bytes) sent[#sent + 1] = { id = id, bytes = bytes } end }
AshitaCore = {
    GetInstallPath = function() return '/tmp/vbaudit' end,
    GetResourceManager = function() return resmgr end,
    GetMemoryManager = function() return memmgr end,
    GetPointerManager = function() return { Get = function(_, name) return name == 'inventory' and INV_PTR or 0 end } end,
    GetPacketManager = function() return pktmgr end,
}
local callbacks = {}
ashita = {
    events = { register = function(ev, name, fn) callbacks[ev] = fn end },
    fs = { exists = function() return false end, create_directory = function() return true end },
    memory = {
        find = function(mod, size, pattern, off, cnt)
            if pattern:sub(1, 4) == 'C1E1' then return 0x500 end   -- SIG_OFFSET -> [0x500] = OFFSET
            if pattern:sub(1, 4) == '8B0D' then return 0x600 end   -- SIG_SETTER
            return 0
        end,
        read_uint32 = function(a) if a == 0x500 then return OFFSET end return mem32[a] or 0 end,
        read_uint8 = function() return 0 end,
        read_array = function(a, n) return bytes_at(a, n) end,
    },
}
addon = { name = 'vanablu', path = ADDON .. '/' }
bit = { rshift = function(a, n) return a >> n end }
struct = { unpack = function(f, d, p) return string.unpack('<I2', d, p) end }
package.preload['common'] = function() return true end
-- texlua has a built-in ffi module, so replace it in package.loaded (preload would be ignored)
package.loaded['ffi'] = (function() return {
    cdef = function() end,
    -- the cast "function pointer" records each call to the client setter
    cast = function(_, v) return function(...) setter_calls[#setter_calls + 1] = { ... } return 1 end end,
} end)()
package.preload['settings'] = function() return { load = function() return {} end, save = function() end } end

-- ImGui stub that records Begin/End and style push/pop balance
local ig = { begin_ret = true, begins = 0, ends = 0, pushes = 0, pops = 0, fail_on = nil, texts = {}, headers = {} }
local imgui = setmetatable({}, { __index = function(_, k)
    if ig.fail_on == k then return function() error('injected failure in ' .. k) end end
    if k == 'Begin' then return function() ig.begins = ig.begins + 1; return ig.begin_ret end end
    if k == 'End' then return function() ig.ends = ig.ends + 1 end end
    if k == 'PushStyleColor' then return function(idx, col) assert(type(col) == 'table'); ig.pushes = ig.pushes + 1 end end
    if k == 'PopStyleColor' then return function(n) ig.pops = ig.pops + (n or 1) end end
    if k == 'CollapsingHeader' then return function(label) ig.headers[#ig.headers + 1] = label; return false end end
    if k == 'IsItemHovered' or k == 'Button' or k == 'Checkbox' then return function() return false end end
    if k == 'Text' or k == 'TextDisabled' or k == 'BulletText' then return function(t) ig.texts[#ig.texts + 1] = t end end
    if k == 'TextColored' then return function(c, t) assert(type(c) == 'table'); ig.texts[#ig.texts + 1] = t end end
    return function() end
end })
package.preload['imgui'] = function() return imgui end
print = function() end

local vb = dofile(ADDON .. '/vanablu.lua')
local backend = require('backend')
local model = require('model')
local present = callbacks['d3d_present']
vb.gui.is_open[1] = true
local function reset_ig() ig.begins, ig.ends, ig.pushes, ig.pops, ig.texts, ig.headers = 0, 0, 0, 0, {}, {} end

-- ------------------------------------------------------------------ Begin / End pairing
real_print('\n-- ImGui Begin/End pairing')
present() -- first frame runs backend.init()
reset_ig(); ig.begin_ret = true; present()
check('visible window: one Begin', ig.begins, 1)
check('visible window: one End', ig.ends, 1)
reset_ig(); ig.begin_ret = false; present()
check('collapsed window: End still called', ig.ends, 1)
ig.begin_ret = true
vb.gui.active_tab = 'Spell Tracker'
reset_ig(); ig.fail_on = 'Separator'; present(); ig.fail_on = nil
check('mid-frame error: End still called', ig.ends, 1)
check('mid-frame error: style colors balanced', ig.pops, ig.pushes)
reset_ig(); present()
check('normal frame: style colors balanced', ig.pops, ig.pushes)

-- ------------------------------------------------------------------ equipped spell read
real_print('\n-- equipped spell read (blusets address only)')
local s = backend.read()
local nonzero = 0
for i = 1, 20 do if s.raw[i] ~= 0 then nonzero = nonzero + 1 end end
check('empty set reads as 20 empty slots (no phantom from JobIndex byte)', nonzero, 0)
main_spells[1] = 1; main_spells[3] = 27
s = backend.read()
check('main BLU slot 1 read', s.raw[1], 1)
check('main BLU slot 3 read', s.raw[3], 27)
player.main, player.sub = 1, 16
sub_spells[2] = 9
s = backend.read()
check('support BLU reads the +0xA0 buffer', s.raw[2], 9)
check('support BLU slot 1 (main buffer not used)', s.raw[1], 0)
check('support BLU snapshot is_main=false', s.is_main, false)

-- ------------------------------------------------------------------ sub-job flag reaches packets
real_print('\n-- support-job BLU flag')
sent, setter_calls = {}, {}
backend.last_write_time = -100
local ok = backend.set_spell(4, 513, false)
check('set_spell ok', ok, true)
local pkt = sent[1] and sent[1].bytes
check('one packet sent', #sent, 1)
check('packet id 0x102', sent[1] and sent[1].id, 0x102)
check('packet is 164 bytes', pkt and #pkt, 164)
check('packet bytes are numbers', pkt and type(pkt[1]), 'number')
check('header 0x02 0x53', pkt and (pkt[1] == 0x02 and pkt[2] == 0x53), true)
check('SpellId byte = 1', pkt and pkt[5], 1)
check('JobIndex = 0x10', pkt and pkt[9], 0x10)
check('IsSubJob = 1', pkt and pkt[10], 1)
check('slot 4 holds the spell byte', pkt and pkt[12 + 4], 1)
check('client setter main_flag = 1 (support)', setter_calls[1] and setter_calls[1][1], 1)

-- d3d_present must pass false (not true) to the queues for a support-job BLU
local seen_is_main = 'unset'
local real_tick = backend.tick_equip_queue
backend.tick_equip_queue = function(is_main) seen_is_main = is_main; return false end
backend.is_equipping_set = true
present()
backend.is_equipping_set = false
backend.tick_equip_queue = real_tick
check('d3d_present passes is_main=false for support BLU', seen_is_main, false)

-- nil (no player data) falls back to the job the queue started with
sent, setter_calls = {}, {}
backend.blu_active = true
backend.start_equip_set({ 513 }, 'T', false, {})
backend.last_equip_action_time = -100
backend.tick_equip_queue(nil)
check('queue with is_main=nil keeps support flag', sent[#sent] and sent[#sent].bytes[10], 1)

-- ------------------------------------------------------------------ not on BLU
real_print('\n-- not Blue Mage')
player.main, player.sub = 1, 2
backend.read()
sent = {}
local ok1, msg1 = backend.set_spell(1, 513, true)
local ok2 = backend.unset_all(true, {})
local ok3 = backend.start_equip_set({ 513 }, 'T', true, {})
check('set_spell refused', ok1, false)
check('refusal explains why', msg1 and msg1:find('Blue Mage', 1, true) ~= nil, true)
check('unset_all refused', ok2, false)
check('start_equip_set refused', ok3, false)
check('no packets sent', #sent, 0)
player.main, player.sub = 16, 1
backend.read()

-- ------------------------------------------------------------------ zone name / require
real_print('\n-- per-frame lookups')
zone_lookups = 0
for _ = 1, 50 do backend.read() end
check('zone name not looked up again in the same zone', zone_lookups, 0)
zone_id = 117
backend.read()
check('zone name looked up once on zone change', zone_lookups, 1)
check('new zone name returned', backend.read().zone_name, 'Zone 117')

local requires = 0
local real_require = require
require = function(...) requires = requires + 1; return real_require(...) end
for _, tab in ipairs({ 'Traits', 'All Spells', 'Spell Tracker', 'Saved Sets' }) do
    vb.gui.active_tab = tab
    present()
end
require = real_require
check('no require() calls while rendering', requires, 0)

-- ------------------------------------------------------------------ trait cache
real_print('\n-- trait view cache')
local traits = require('res.traits')
local function trait_header(name)
    for _, h in ipairs(ig.headers) do
        if h:find('###trait_header_' .. name, 1, true) then return h end
    end
end
-- find a trait and one of its spells
local trait, spell_id
for _, tr in pairs(traits) do
    if type(tr) == 'table' and tr.name and tr.spells and tr.spells[1] then trait, spell_id = tr, tr.spells[1].id; break end
end
for i = 1, 20 do main_spells[i] = 0 end
vb.gui.active_tab = 'Traits'
reset_ig(); present()
local before = trait_header(trait.name)
main_spells[1] = spell_id - 512
reset_ig(); present()
local after = trait_header(trait.name)
local fresh = model.evaluate_trait(trait, { [spell_id] = 1 }, 1)
check('trait header changes when a contributing spell is equipped', before ~= after, true)
check('cached header shows fresh point total', after and after:find(('[Pts: %d'):format(fresh.current_points), 1, true) ~= nil, true)
main_spells[1] = 0
reset_ig(); present()
check('trait header returns to the old text when the spell is removed', trait_header(trait.name), before)

-- ------------------------------------------------------------------ search
real_print('\n-- search')
vb.gui.active_tab = 'All Spells'
vb.gui.search_query[1] = 'COCOON'
reset_ig(); present()
local found = false
for _, t in ipairs(ig.texts) do if type(t) == 'string' and t:find('Cocoon', 1, true) then found = true end end
check('upper-case search finds Cocoon', found, true)
vb.gui.search_query[1] = ''

print = real_print
print(('\n%d passed, %d failed'):format(pass, fail))
os.exit(fail == 0 and 0 or 1)
