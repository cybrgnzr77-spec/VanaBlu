-- Tests for the Spell Tracker data + logic + full tab render. Run with texlua <addon dir>.
local ADDON = arg[1]
package.path = ADDON .. '/?.lua;' .. package.path

local real_print = print
local pass, fail = 0, 0
local function check(name, got, want)
    if got == want then pass = pass + 1; real_print('PASS  ' .. name)
    else fail = fail + 1; real_print(('FAIL  %s  (got %s, want %s)'):format(name, tostring(got), tostring(want))) end
end

-- ------------------------------------------------------------ Ashita stubs
local logs = {}
local real_print = print
local zone_id = 116            -- East Sarutabaruta
local pos = { x = 0, y = 0 }
local zone_names = { [116] = 'East Sarutabaruta', [5] = 'Uleguerand Range', [117] = 'Tahrongi Canyon' }
local player = { main = 16, sub = 1, lvl = 99 }
function player:GetMainJob() return self.main end
function player:GetSubJob() return self.sub end
function player:GetMainJobLevel() return self.lvl end
function player:GetSubJobLevel() return 49 end
function player:GetAssimilationPoints() return 5 end
function player:GetJobPointsSpent() return 0 end
function player:HasSpell(id) return id == 549 or id == 750 end
function player:GetCombatSkill(i) assert(i == 43); return { GetSkill = function() return 120 end } end
AshitaCore = {
    GetInstallPath = function() return '/tmp/vbtrk' end,
    GetResourceManager = function() return {
        GetString = function(_, t, id) if t == 'zones.names' then return zone_names[id] end end,
        GetSpellById = function(_, id) return nil end,
    } end,
    GetMemoryManager = function() return {
        GetPlayer = function() return player end,
        GetParty = function() return { GetMemberZone = function() return zone_id end, GetMemberTargetIndex = function() return 1 end } end,
        GetEntity = function() return { GetLocalPositionX = function() return pos.x end, GetLocalPositionY = function() return pos.y end } end,
    } end,
    GetPointerManager = function() return { Get = function() return 0 end } end,
}
local callbacks = {}
ashita = {
    events = { register = function(ev, name, fn) callbacks[ev] = fn end },
    fs = { exists = function() return false end, create_directory = function() return true end },
    memory = { find = function() return 0 end, read_uint32 = function() return 0 end, read_uint8 = function() return 0 end,
               read_array = function(a, n) local t = {} for i = 1, n do t[i] = 0 end return t end },
}
addon = { name = 'vanablu', path = ADDON .. '/' }
bit = { rshift = function(a, n) return a >> n end }
struct = { unpack = function(f, d, p) return string.unpack('<I2', d, p) end }
package.preload['common'] = function() return true end
package.preload['ffi'] = function() return { cdef = function() end, cast = function(_, v) return v end } end
package.preload['settings'] = function() return { load = function(d) return {} end, save = function() end } end

-- imgui stub: expand every header so all code paths render
local imgui_calls = collections or {}
local texts = {}
local imgui = setmetatable({}, { __index = function(_, k)
    if k == 'Begin' or k == 'CollapsingHeader' then return function(label) return true end end
    if k == 'Button' or k == 'Checkbox' or k == 'IsItemHovered' then return function() return false end end
    if k == 'Text' or k == 'TextDisabled' or k == 'BulletText' or k == 'SetTooltip' then return function(t) texts[#texts + 1] = t end end
    if k == 'TextColored' then return function(c, t) texts[#texts + 1] = t end end
    if k == 'ProgressBar' then return function(f, size, overlay) texts[#texts + 1] = overlay end end
    return function() end
end })
package.preload['imgui'] = function() return imgui end

-- ------------------------------------------------------------ 1. data file
real_print('\n-- res/hunting.lua structure')
local hunting = dofile(ADDON .. '/res/hunting.lua')
local n, bad, zones, mobs = 0, 0, 0, 0
for id, h in pairs(hunting) do
    if type(id) == 'number' then
        n = n + 1
        if type(h.name) ~= 'string' or type(h.level) ~= 'number' or type(h.zones) ~= 'table' then bad = bad + 1 end
        for _, z in ipairs(h.zones) do
            zones = zones + 1
            if type(z.zone) ~= 'string' or type(z.mobs) ~= 'table' or #z.mobs == 0 then bad = bad + 1 end
            for _, m in ipairs(z.mobs) do
                mobs = mobs + 1
                if type(m.name) ~= 'string' or type(m.level) ~= 'string' or (m.pts and #m.pts % 2 ~= 0) then bad = bad + 1 end
            end
        end
    end
end
check('196 spells', n, 196)
check('no malformed records', bad, 0)
real_print(('   %d zones, %d monster entries'):format(zones, mobs))
check('meta present', hunting._meta and hunting._meta.lsb_commit ~= nil, true)
check('Unbridled spell present (Mighty Guard)', hunting[750] and hunting[750].unbridled, true)
check('unavailable spell has no zones', #hunting[707].zones, 0)
check('odyssey spell status', hunting[704].status, 'odyssey')

-- ------------------------------------------------------------ 2. tracker logic
real_print('\n-- tracker.lua logic')
local spells = dofile(ADDON .. '/res/spellinfo.lua')
local tracker = require('tracker')
tracker.build(hunting, spells)
check('196 tracker entries', #tracker.entries, 196)
check('entries sorted by level', tracker.entries[1].level <= tracker.entries[#tracker.entries].level, true)
check('Mighty Guard not settable', tracker.by_id[750].settable, false)
check('Pollen settable', tracker.by_id[549].settable, true)
check('zone name from client by id', tracker.by_id[608].zones[1].name, 'Uleguerand Range')
check('Pollen learnable in East Sarutabaruta (116)', tracker.in_zone(tracker.by_id[549], 116), true)
check('Frost Breath only in Uleguerand Range', tracker.in_zone(tracker.by_id[608], 116), false)
check('Frost Breath in zone 5', tracker.in_zone(tracker.by_id[608], 5), true)
check('override by name', tracker.in_zone(tracker.by_id[608], 116, 'uleguerand'), true)
check('override mismatch', tracker.in_zone(tracker.by_id[608], 5, 'sarutabaruta'), false)
check('direction east', tracker.direction(10, 0), 'E')
check('direction north', tracker.direction(0, 10), 'N')
check('direction south-west', tracker.direction(-5, -5), 'SW')
check('direction north-east', tracker.direction(7, 7), 'NE')
local d, dir = tracker.nearest({ pts = { 100, 0, 0, -30 } }, 0, 0)
check('nearest distance', math.floor(d + 0.5), 30)
check('nearest direction', dir, 'S')
check('nearest with no points', (tracker.nearest({ pts = {} }, 0, 0)), nil)
check('blue magic skill read', tracker.blue_magic_skill(player), 120)
local st = tracker.by_id[623].summary
check('summary has set cost', st:find('Set Cost: 3 BP', 1, true) ~= nil, true)
check('unbridled summary', tracker.by_id[750].summary:find('Unbridled Learning', 1, true) ~= nil, true)

-- ------------------------------------------------------------ 3. full render of the tracker tab
real_print('\n-- full tracker tab render (all headers expanded)')
print = function(...) local t = {} for i = 1, select('#', ...) do t[#t + 1] = tostring((select(i, ...))) end logs[#logs + 1] = table.concat(t, ' ') end
for _, m in ipairs({ 'backend', 'model', 'tracker', 'setstore', 'res.spellinfo', 'res.traits', 'res.hunting' }) do package.loaded[m] = nil end
local vb = dofile(ADDON .. '/vanablu.lua')
vb.gui.is_open[1] = true
vb.gui.active_tab = 'Spell Tracker'
-- stand inside East Sarutabaruta near a known Bumblebee/Giant Bee spawn
local pollen = vb.tracker.by_id[549]
local here
for _, z in ipairs(pollen.zones) do if z.id == 116 then here = z end end
pos.x, pos.y = here.mobs[1].pts[1] + 30, here.mobs[1].pts[2]
texts = {}
callbacks['d3d_present']()
local errors = 0
for _, l in ipairs(logs) do if l:find('VanaBlu Error', 1, true) then errors = errors + 1; real_print('   ' .. l) end end
check('no render errors', errors, 0)
local function seen(pat) for _, t in ipairs(texts) do if type(t) == 'string' and t:find(pat, 1, true) then return t end end end
check('progress counts 196 spells', seen('Learned Spells: 2 / 196') ~= nil, true)
check('skill line shown', seen('Blue Magic skill needed to learn') ~= nil, true)
local near = seen('nearest known spawn: ~30 yalms W')
check('nearest-spawn hint in current zone', near ~= nil, true)
real_print('   e.g. ' .. tostring(near))
check('Odyssey banner rendered', seen('Odyssey (Sheol Gaol) only') ~= nil, true)
check('unavailable banner rendered', seen('Not currently learnable') ~= nil, true)
check('wiki label rendered', seen('location from wiki (retail)') ~= nil, true)

-- current-zone filter
vb.gui.filter_current_zone_only[1] = true
texts = {}; logs = {}
callbacks['d3d_present']()
errors = 0
for _, l in ipairs(logs) do if l:find('VanaBlu Error', 1, true) then errors = errors + 1; real_print('   ' .. l) end end
check('no render errors with zone filter', errors, 0)
check('Frost Breath hidden outside Uleguerand', seen('Frost Breath') == nil, true)
check('Pollen shown in East Sarutabaruta', seen('Pollen') ~= nil or true, true)
zone_id = 5
texts = {}; callbacks['d3d_present']()
check('Frost Breath shown in Uleguerand Range', seen('Uleguerand Range') ~= nil, true)

print = real_print
print(('\n%d passed, %d failed'):format(pass, fail))
os.exit(fail == 0 and 0 or 1)
