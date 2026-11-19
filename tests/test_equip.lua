--[[
  test_equip.lua - saved-set loading: pacing, server confirmation, retries and the "Set:" label.
  Runs under texlua (Lua 5.3) with Ashita v4, ImGui, the game client and the server simulated.

  Usage: texlua tests/test_equip.lua <addon_dir>

  The simulated server follows LandSandBoat's 0x102 handler (0x102_extended_job.cpp, blueutils.cpp):
    - set packet: only the first non-zero Spells[] entry is used; the slot's old spell is removed, then the
      spell is added if it isn't set elsewhere, fits in the set points, and is learned
    - unset packet (SpellId 0): clears each listed slot, aborting at the first listed slot that is empty
    - after each handled packet it sends 0x044 with the full spell list (delivered to the addon's packet_in)
  It can drop packets (like a PACKET_RATE_LIMITS entry) and refuse spells (not enough set points).
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

-- ------------------------------------------------------------------ fake clock
local now = 1000.0
os.clock = function() return now end

-- ------------------------------------------------------------------ simulated server
local server = {
    spells = {},            -- [1..20] spell bytes
    refuse = {},            -- [spell byte] = true: never accept (e.g. not enough set points)
    drop_next = 0,          -- drop the next N handled 0x102 packets entirely (no 0x044)
    drop_nth = {},          -- [n] = true: drop the n-th 0x102 received
    received = 0,
    send_044 = true,
    log = {},               -- { t, kind, slot, byte }
}
for i = 1, 20 do server.spells[i] = 0 end
local packet_in_cb -- set after the addon registers it

local function send_044()
    if not server.send_044 or not packet_in_cb then return end
    local b = { 0x44, 0x50, 0, 0, 0x10, 0, 0, 0 }
    for i = 1, 20 do b[#b + 1] = server.spells[i] end
    for _ = 1, 132 do b[#b + 1] = 0 end
    local chars = {}
    for i, v in ipairs(b) do chars[i] = string.char(v) end
    packet_in_cb({ id = 0x044, data = table.concat(chars) })
end

local function server_handle(bytes)
    server.received = server.received + 1
    if server.drop_nth[server.received] then return end
    if server.drop_next > 0 then server.drop_next = server.drop_next - 1; return end
    local spell_id = bytes[5]
    if spell_id == 0 then
        for i = 1, 20 do
            local v = bytes[12 + i]
            if v > 0 then
                if server.spells[i] == 0 then send_044(); return end -- abort, like LSB
                server.spells[i] = 0
                server.log[#server.log + 1] = { t = now, kind = 'unset', slot = i }
            end
        end
    else
        local slot
        for i = 1, 20 do if bytes[12 + i] > 0 then slot = i; break end end
        if slot then
            local v = bytes[12 + slot]
            server.spells[slot] = 0
            local already = false
            for i = 1, 20 do if server.spells[i] == v then already = true end end
            if not already and not server.refuse[v] then
                server.spells[slot] = v
            end
            server.log[#server.log + 1] = { t = now, kind = 'set', slot = slot, byte = v }
        end
    end
    send_044()
end

-- ------------------------------------------------------------------ Ashita / client stubs
local INV_PTR, P1, BASE, OFFSET = 0x1000, 0x2000, 0x10000, 0x200
local mem32 = { [INV_PTR] = P1, [P1] = BASE }
local function bytes_at(addr, n)                 -- client memory mirrors the server's list
    local t = {}
    for i = 1, n do
        local a = addr + i - 1
        local v = 0
        if a == BASE + OFFSET then v = 0x10 end
        if a >= BASE + OFFSET + 0x04 and a < BASE + OFFSET + 0x18 then v = server.spells[a - (BASE + OFFSET + 0x04) + 1] end
        t[i] = v
    end
    return t
end
local setter_calls = {}
local player = {}
function player:GetMainJob() return 16 end
function player:GetSubJob() return 1 end
function player:GetMainJobLevel() return 99 end
function player:GetSubJobLevel() return 49 end
function player:GetAssimilationPoints() return 5 end
function player:GetJobPointsSpent() return 500 end
function player:HasSpell() return true end
local skill = { GetSkill = function() return 424 end }
function player:GetCombatSkill() return skill end
local party = { GetMemberZone = function() return 116 end, GetMemberTargetIndex = function() return 1 end }
local entity = { GetLocalPositionX = function() return 0 end, GetLocalPositionY = function() return 0 end }
local memmgr = { GetPlayer = function() return player end, GetParty = function() return party end, GetEntity = function() return entity end }
AshitaCore = {
    GetInstallPath = function() return '/tmp/vbequip' end,
    GetResourceManager = function() return { GetString = function() return 'Zone' end, GetSpellById = function() end } end,
    GetMemoryManager = function() return memmgr end,
    GetPointerManager = function() return { Get = function(_, n) return n == 'inventory' and INV_PTR or 0 end } end,
    GetPacketManager = function() return { AddOutgoingPacket = function(_, id, bytes) if id == 0x102 then server_handle(bytes) end end } end,
}
local callbacks = {}
ashita = {
    events = { register = function(ev, name, fn) callbacks[ev] = fn end },
    fs = { exists = function() return false end, create_directory = function() return true end },
    memory = {
        find = function(mod, size, pattern) if pattern:sub(1, 4) == 'C1E1' then return 0x500 end if pattern:sub(1, 4) == '8B0D' then return 0x600 end return 0 end,
        read_uint32 = function(a) if a == 0x500 then return OFFSET end return mem32[a] or 0 end,
        read_uint8 = function() return 0 end,
        read_array = function(a, n) return bytes_at(a, n) end,
    },
}
addon = { name = 'vanablu', path = ADDON .. '/' }
bit = { rshift = function(a, n) return a >> n end }
struct = { unpack = function(f, d, p) return string.unpack('<I2', d, p) end }
package.preload['common'] = function() return true end
package.loaded['ffi'] = { cdef = function() end,
    cast = function() return function(...) setter_calls[#setter_calls + 1] = { ... } return 1 end end }
package.preload['settings'] = function() return { load = function() return {} end, save = function() end } end

local texts = {}
local imgui = setmetatable({}, { __index = function(_, k)
    if k == 'Begin' then return function() return true end end
    if k == 'Text' then return function(t) texts[#texts + 1] = t end end
    if k == 'TextColored' then return function(c, t) texts[#texts + 1] = t end end
    if k == 'IsItemHovered' or k == 'Button' or k == 'Checkbox' or k == 'CollapsingHeader' then return function() return false end end
    return function() end
end })
package.preload['imgui'] = function() return imgui end
local chat = {}
print = function(s) chat[#chat + 1] = tostring(s) end

local vb = dofile(ADDON .. '/vanablu.lua')
local backend = require('backend')
local present = callbacks['d3d_present']
packet_in_cb = callbacks['packet_in']
vb.gui.is_open[1] = true
present() -- initializes the backend and reads the player

-- ------------------------------------------------------------------ helpers
local SET = { 513, 517, 519, 521, 524 }           -- 5 learnable spells (any ids in spellinfo work)
local function bytes_of(ids) local t = {} for i, id in ipairs(ids) do t[i] = id - 512 end return t end

local function reset_server(spell_ids)
    for i = 1, 20 do server.spells[i] = 0 end
    for i, id in ipairs(spell_ids or {}) do server.spells[i] = id - 512 end
    server.refuse, server.drop_next, server.drop_nth, server.received, server.log = {}, 0, {}, 0, {}
    server.send_044 = true
    setter_calls = {}
end

local function equipped_slots()
    local t = {}
    for i = 1, 20 do t[i] = server.spells[i] > 0 and server.spells[i] + 512 or nil end
    return t
end

--- Runs frames (10 ms apart) until the load finishes; returns finished, msg, is_err, failed and the
--- list of intermediate messages.
local function run_load(max_seconds)
    local interim = {}
    local t_end = now + (max_seconds or 60)
    while now < t_end do
        now = now + 0.01
        local finished, msg, is_err, failed = backend.tick_equip_queue(true)
        if finished then return finished, msg, is_err, failed, interim end
        if msg then interim[#interim + 1] = msg end
    end
    return false, 'timeout', true, nil, interim
end

local function server_matches(ids)
    for i = 1, 20 do
        local want = ids[i] and (ids[i] - 512) or 0
        if server.spells[i] ~= want then return false end
    end
    return true
end

-- ------------------------------------------------------------------ 1. happy path and pacing
real_print('\n-- normal load')
reset_server({ 600 })          -- some other spell equipped beforehand
local t0 = now
local ok, msg = backend.start_equip_set(SET, 'Tank', true, equipped_slots())
check('start ok', ok, true)
local finished, fmsg, is_err, failed = run_load()
check('finished', finished, true)
check('not an error', is_err, false)
check('server holds the set', server_matches(SET), true)
check('message says all confirmed', fmsg and fmsg:find('all 5 spells confirmed', 1, true) ~= nil, true)
local sets = {}
for _, e in ipairs(server.log) do if e.kind == 'set' then sets[#sets + 1] = e end end
check('one set packet per spell', #sets, 5)
check('first spell >= 1.5s after the clear packet', sets[1] and (sets[1].t - t0) >= 1.5 - 1e-9, true)
local min_gap = math.huge
for i = 2, #sets do min_gap = math.min(min_gap, sets[i].t - sets[i - 1].t) end
check('spells >= 1.0s apart', min_gap >= 1.0 - 1e-9, true)
local bad_setter = false
for _, c in ipairs(setter_calls) do if c[3] == 0xFF or c[3] == 20 then bad_setter = true end end
check('no out-of-range client setter calls (0xFF / 20)', bad_setter, false)

-- ------------------------------------------------------------------ 2. one packet dropped -> retried
real_print('\n-- server drops one set packet')
reset_server({})
server.drop_nth[3] = true -- clear packet is #1, so this drops the 2nd spell
backend.start_equip_set(SET, 'Tank', true, equipped_slots())
local f2, m2, e2, fl2, interim2 = run_load()
check('finished', f2, true)
check('recovered: server holds the set', server_matches(SET), true)
check('not an error', e2, false)
check('message mentions the retry', m2 and m2:find('1 spell needed a retry', 1, true) ~= nil, true)
check('retry announced while running', interim2[1] and interim2[1]:find('retrying (1/2)', 1, true) ~= nil, true)

-- ------------------------------------------------------------------ 3. a spell the server refuses
real_print('\n-- server refuses one spell (e.g. not enough set points)')
reset_server({})
server.refuse[519 - 512] = true
backend.start_equip_set(SET, 'Tank', true, equipped_slots())
local f3, m3, e3, fl3 = run_load()
check('finished', f3, true)
check('reported as an error', e3, true)
check('failed list has one spell', fl3 and #fl3, 1)
check('failed spell is 519', fl3 and fl3[1], 519)
check('used both retries', backend.equip_retries, 2)
check('other spells still set', server.spells[1] == 1 and server.spells[2] == 5 and server.spells[4] == 9, true)

-- ------------------------------------------------------------------ 4. clear-all aborted (stale client list)
real_print('\n-- clear-all packet aborted, leaving an old spell')
reset_server({})
-- Client's (stale) list: slot 1 = 600, slot 6 = 519. Server: slot 1 already empty, slot 6 = 519.
-- The clear packet aborts at slot 1, so 519 stays in slot 6 and blocks setting it into slot 3.
server.spells[6] = 519 - 512
local stale = { [1] = 600, [6] = 519 }
backend.start_equip_set(SET, 'Tank', true, stale)
local f4, m4, e4 = run_load()
check('recovered: server holds the set (slot 6 cleared, 519 in slot 3)', server_matches(SET), true)
check('not an error', e4, false)

-- ------------------------------------------------------------------ 5. no 0x044 from the server
real_print('\n-- no 0x044 replies (memory fallback)')
reset_server({})
server.send_044 = false
backend.server_spells.main = nil
backend.start_equip_set(SET, 'Tank', true, equipped_slots())
local f5, m5, e5 = run_load()
check('confirmed from client memory', f5 and not e5 and server_matches(SET), true)
server.send_044 = true

-- ------------------------------------------------------------------ 6. "Set:" label
real_print('\n-- sidebar "Set:" label')
local function label()
    texts = {}
    vb.gui.active_tab = 'Traits'
    present()
    for _, t in ipairs(texts) do
        if type(t) == 'string' and t:sub(1, 5) == 'Set: ' then return t end
    end
end
-- the label is drawn just above "Slots:"
local function label_above_slots()
    for i, t in ipairs(texts) do
        if type(t) == 'string' and t:sub(1, 6) == 'Slots:' then return texts[i - 1] end
    end
end
vb.gui.saved_sets = {
    Tank  = { name = 'Tank', spells = { 513, 517, 519, 521, 524 } },
    Nuke  = { name = 'Nuke', spells = { 524, 521 } },
}
vb.gui.sets_version = vb.gui.sets_version + 1
reset_server({})
check('empty set -> none', label(), 'Set: none')
reset_server({ 521, 524 })   -- Nuke, in a different order
check('saved set matched in any slot order', label(), 'Set: Nuke')
check('label is directly above "Slots:"', label_above_slots(), 'Set: Nuke')
reset_server({ 521 })
check('partial match -> none', label(), 'Set: none')

-- load through the real UI path state: start + run frames via present()
reset_server({})
backend.start_equip_set({ 513, 517, 519, 521, 524 }, 'Tank', true, equipped_slots())
check('while loading', label(), 'Set: Tank (loading...)')
for _ = 1, 1200 do now = now + 0.01; present() end
check('load finished', backend.is_equipping_set, false)
check('after load -> Tank', label(), 'Set: Tank')
-- duplicate saved set with the same spells: the one just loaded wins
vb.gui.saved_sets['A Copy'] = { name = 'A Copy', spells = { 513, 517, 519, 521, 524 } }
vb.gui.sets_version = vb.gui.sets_version + 1
check('loaded set preferred over an identical saved set', label(), 'Set: Tank')
-- manual change after loading
server.spells[5] = 0
check('spell removed after loading -> none', label(), 'Set: none')

-- ------------------------------------------------------------------ 7. failure reporting in the window / chat
real_print('\n-- failure report names the spells')
reset_server({})
server.refuse[519 - 512] = true
vb.gui.is_open[1] = false
chat = {}
backend.start_equip_set(SET, 'Tank', true, equipped_slots())
for _ = 1, 3000 do now = now + 0.01; present() end
local last = chat[#chat] or ''
check('result echoed to chat when the window is closed', last:find('[VanaBlu] Set "Tank" is incomplete', 1, true) ~= nil, true)
local sp = require('res.spellinfo')[519]
check('failed spell named', sp and last:find(sp.name, 1, true) ~= nil, true)
vb.gui.is_open[1] = true

print = real_print
print(('\n%d passed, %d failed'):format(pass, fail))
os.exit(fail == 0 and 0 or 1)
