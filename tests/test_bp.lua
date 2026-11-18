-- Test harness for VanaBlu BP-limit fix. Runs under texlua (Lua 5.3) with Ashita APIs stubbed.
local ADDON = arg[1]
package.path = ADDON .. '/?.lua;' .. package.path

-- ---------------------------------------------------------------- stubs
package.preload['ffi'] = function() return { cdef = function() end, cast = function(_, v) return v end } end
bit = { rshift = function(a, n) return a >> n end }
struct = { unpack = function(fmt, data, pos) assert(fmt == 'H'); return string.unpack('<I2', data, pos) end }

local mem = {}           -- fake address space: addr -> value
local find_result = 0    -- what ashita.memory.find returns for SIG_POINTS
ashita = { memory = {
    find = function(mod, size, pattern, off, cnt)
        if pattern:sub(1, 2) == 'A1' then return find_result end
        return 0
    end,
    read_uint32 = function(a) return mem[a] or 0 end,
    read_uint8  = function(a) return mem[a] or 0 end,
    read_array  = function(a, n) local t = {} for i = 1, n do t[i] = 0 end return t end,
} }

local player = {
    main = 16, sub = 1, mlvl = 99, slvl = 49, assim = 5, jpspent = 2100,
}
function player:GetMainJob() return self.main end
function player:GetSubJob() return self.sub end
function player:GetMainJobLevel() return self.mlvl end
function player:GetSubJobLevel() return self.slvl end
function player:GetAssimilationPoints() return self.assim end
function player:GetJobPointsSpent(j) return self.jpspent end
AshitaCore = {
    GetMemoryManager = function() return {
        GetPlayer = function() return player end,
        GetParty = function() return { GetMemberZone = function() return 0 end } end,
    } end,
    GetPointerManager = function() return { Get = function() return 0 end } end,
    GetResourceManager = function() return {} end,
}

-- ---------------------------------------------------------------- helpers
local pass, fail = 0, 0
local function check(name, got, want)
    if got == want then pass = pass + 1; print('PASS  ' .. name)
    else fail = fail + 1; print(string.format('FAIL  %s  (got %s, want %s)', name, tostring(got), tostring(want))) end
end

-- Build a 0x08D packet: 4-byte header + 64 entries of {uint16 id, uint16 (level<<10 | next)}
local function jp_packet(entries)
    local parts = { string.pack('<I2I2', 0x08D, 0) }
    for i = 1, 64 do
        local e = entries[i]
        if e then parts[#parts + 1] = string.pack('<I2I2', e.id, (e.level << 10) | (e.next or 0))
        else parts[#parts + 1] = string.pack('<I2I2', 0, 0) end
    end
    return table.concat(parts)
end

local model = require('model')
local backend = require('backend')

-- ---------------------------------------------------------------- model.get_limits
print('\n-- model.get_limits')
check('Lv99 + 5 merits + 20 JP = 80',          model.get_limits(99, true, 5, 20, 2100).points, 80)
check('Lv99 + 5 merits, JP unknown = 60',      model.get_limits(99, true, 5, 0, 2100).points, 60)
check('client max overrides calculation',      model.get_limits(99, true, 5, 0, 2100, 80).points, 80)
check('client max 0 falls back to calc',       model.get_limits(99, true, 5, 20, 2100, 0).points, 80)
check('points_source client',                  model.get_limits(99, true, 5, 0, 0, 80).points_source, 'client')
check('points_source calculated',              model.get_limits(99, true, 5, 20, 0, nil).points_source, 'calculated')
check('bonus_points at 80 = 25',               model.get_limits(99, true, 5, 20, 2100).bonus_points, 25)
check('JP bonus ignored below 99',             model.get_limits(98, true, 5, 20, 0).points, 60)
check('merits ignored below 75',               model.get_limits(74, true, 5, 0, 0).points, 45)
check('Lv75 + 5 merits = 50',                  model.get_limits(75, true, 5, 0, 0).points, 50)
check('JP bonus clamped to 20',                model.get_limits(99, true, 5, 99, 0).points, 80)
check('Lv1 base = 10',                         model.get_limits(1, true, 0, 0, 0).points, 10)
check('sub BLU Lv49 = 30',                     model.get_limits(49, false, 0, 0, 0).points, 30)

-- ---------------------------------------------------------------- packet 0x08D parsing
print('\n-- backend.handle_packet_in (0x08D)')
check('jp_bp_bonus nil before any packet', backend.jp_bp_bonus, nil)
backend.handle_packet_in({ id = 0x08D, data = jp_packet({
    { id = 0x020, level = 20 },             -- WAR job point (must be ignored)
    { id = 0x200, level = 15 },             -- BLU Azure Lore (must be ignored)
}) })
check('packet without BP bonus entry leaves nil', backend.jp_bp_bonus, nil)
backend.handle_packet_in({ id = 0x08D, data = jp_packet({
    { id = 0x200, level = 15 },
    { id = 0x201, level = 20, next = 0 },   -- BLU Blue Magic Point Bonus rank 20
    { id = 0x202, level = 7 },
}) })
check('rank 20 captured from 0x08D', backend.jp_bp_bonus, 20)
backend.handle_packet_in({ id = 0x0AA, data = jp_packet({ { id = 0x201, level = 3 } }) })
check('other packet ids ignored', backend.jp_bp_bonus, 20)
backend.handle_packet_in({ id = 0x08D, data = jp_packet({ { id = 0x201, level = 12, next = 900 } }) })
check('rank updates (single-entry update packet, next bits ignored)', backend.jp_bp_bonus, 12)
backend.handle_packet_in({ id = 0x08D, data = 'short' })
check('truncated packet does not crash/change', backend.jp_bp_bonus, 12)
backend.jp_bp_bonus = 20

-- ---------------------------------------------------------------- backend.read: JP fallback path
print('\n-- backend.read (client memory unavailable -> JP packet fallback)')
backend.init()
local s = backend.read()
check('snapshot carries JP bonus 20', s.blue_point_bonus, 20)
check('client_max_points 0 when signature missing', s.client_max_points, 0)
check('end-to-end limit = 80', model.get_limits(s.level, s.is_main, s.assimilation, s.blue_point_bonus, s.jp_spent, s.client_max_points).points, 80)

-- ---------------------------------------------------------------- backend.read: client memory path
print('\n-- backend.read (client memory available)')
backend.jp_bp_bonus = nil   -- packet never seen, e.g. addon loaded mid-session
find_result = 0x1000        -- SIG_POINTS found; operand at 0x1000 -> global 0x2000 -> info struct 0x3000
mem[0x1000] = 0x2000; mem[0x2000] = 0x3000; mem[0x3000 + 0x18] = 80; mem[0x3000 + 0x14] = 34
backend.is_initialized = false
backend.init()
s = backend.read()
check('client max read = 80', s.client_max_points, 80)
check('client spent read = 34', s.client_spent_points, 34)
check('end-to-end limit = 80 without JP packet', model.get_limits(s.level, s.is_main, s.assimilation, s.blue_point_bonus, s.jp_spent, s.client_max_points).points, 80)
mem[0x3000 + 0x18] = 0
s = backend.read()
check('client max 0 (not populated) -> treated as unavailable', s.client_max_points, 0)

-- ---------------------------------------------------------------- sub job BLU ignores JP bonus
print('\n-- sub BLU')
player.main, player.sub = 5, 16
backend.jp_bp_bonus = 20
s = backend.read()
check('sub BLU snapshot has no JP bonus', s.blue_point_bonus, 0)
check('sub BLU Lv49 limit = 30', model.get_limits(s.level, s.is_main, s.assimilation, s.blue_point_bonus, s.jp_spent, s.client_max_points).points, 30)

print(string.format('\n%d passed, %d failed', pass, fail))
os.exit(fail == 0 and 0 or 1)
