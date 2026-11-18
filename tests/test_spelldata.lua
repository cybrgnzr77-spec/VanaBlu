-- Tests for audited spell/trait data, server trait math, and rendering every tab. Run with texlua <addon dir>.
local ADDON = arg[1]
package.path = ADDON .. '/?.lua;' .. package.path
local real_print = print
local pass, fail = 0, 0
local function check(name, got, want)
    if got == want then pass = pass + 1; real_print('PASS  ' .. name)
    else fail = fail + 1; real_print(('FAIL  %s  (got %s, want %s)'):format(name, tostring(got), tostring(want))) end
end

local spells = dofile(ADDON .. '/res/spellinfo.lua')
local traits = dofile(ADDON .. '/res/traits.lua')
local model = dofile(ADDON .. '/model.lua')

-- ------------------------------------------------------------ spellinfo
real_print('\n-- spellinfo corrections')
local n, aby, noscript = 0, 0, 0
for id, s in pairs(spells) do
    n = n + 1
    if s.Abyssea then aby = aby + 1 end
    if s.noscript then noscript = noscript + 1 end
end
check('178 spells', n, 178)
check('8 Abyssea proc spells', aby, 8)
check('49 spells flagged without cast script', noscript, 49)
check('Bad Breath not an Abyssea proc', spells[604].Abyssea, nil)
check('Cursed Sphere is a nuke', spells[544].Nuke, true)
check('Cursed Sphere has no poison', spells[544].effect.Poison, nil)
check('Sandspray blinds', spells[621].effect.Blind, true)
check('Exuviation cures', spells[645].effect.Cure, true)
check('Pollen has no element', spells[549].element, 15)
check('Pollen not physical', spells[549].physical, nil)
check('Seedspray physical', spells[650].physical, true)
check('Seedspray element earth', spells[650].element, 3)
check('Goblin Rush 2nd SC', spells[666].SCB, 'Impaction')
check('Amorphic Spikes single SC', spells[697].SCB, nil)
check('Seedspray cost 2', spells[650].cost, 2)
check('Head Butt level 12', spells[623].level, 12)

-- ------------------------------------------------------------ trait math (server rules)
real_print('\n-- trait evaluation')
local function eq(ids) local m = {} for _, i in ipairs(ids) do m[i] = true end return m end
local function ev(name, ids, bonus) return model.evaluate_trait(traits[name], eq(ids), bonus or 0) end
local e = ev('Attack Bonus', { 620, 594 })
check('Attack Bonus 2 spells -> I (10)', e.active_tier_val, 'I (10)')
e = ev('Attack Bonus', { 620, 594, 554, 540, 616, 675 })
check('Attack Bonus 6 pts -> III (35)', e.active_tier_val, 'III (35)')
check('Attack Bonus next tier at 8', e.next_threshold, 8)
e = ev('Attack Bonus', { 620, 594, 554, 540, 616, 675 }, 1)
check('Attack Bonus 6 pts + JP gift -> IV (48)', e.active_tier_val, 'IV (48)')
check('boost flagged', e.boosted, true)
e = ev('Zanshin', { 665, 669 }, 1)
check('Zanshin only tier I even with gift', e.active_tier_val, 'I (15)')
check('Zanshin gift does not boost', e.boosted, false)
e = ev('Double/Triple Attack', { 656, 659 })
check('2 pts -> Double Attack', e.active_tier_val, 'Double Attack (7%)')
e = ev('Double/Triple Attack', { 656, 659 }, 1)
check('2 pts + gift -> Triple Attack', e.active_tier_val, 'Triple Attack (5%)')
e = ev('Gilfinder/TH', { 680, 683 })
check('2 pts -> Gilfinder', e.active_tier_val, 'Gilfinder')
e = ev('Gilfinder/TH', { 680, 683, 697 })
check('3 pts -> Treasure Hunter', e.active_tier_val, 'Treasure Hunter')
e = ev('Gilfinder/TH', { 680, 683 }, 1)
check('2 pts + gift -> Treasure Hunter', e.active_tier_val, 'Treasure Hunter')
e = ev('Fast Cast', { 604, 654 })
check('Fast Cast 2 pts -> tier 0 (5)', e.active_tier_val, '0 (5)')
e = ev('Fast Cast', { 604, 654 }, 1)
check('Fast Cast tier 0 + gift -> I (10)', e.active_tier_val, 'I (10)')
e = ev('Auto Refresh', { 612, 615 })
check('Auto Refresh 8 pts active', e.is_active, true)
e = ev('Auto Refresh', { 612, 537 })
check('Auto Refresh 5 pts inactive', e.is_active, false)
e = ev('Resist Gravity', { 574, 648 })
check('Resist Gravity 2 pts -> I', e.active_tier_val, 'I (10)')
check('Resist Gravity: no tier reachable with points', e.next_threshold, nil)
e = ev('Resist Gravity', { 574, 648 }, 1)
check('Resist Gravity + gift -> JP tier II', e.active_tier_val, 'II (15)')
e = ev('Max MP Boost', { 517, 534, 563, 668, 694 })
check('Max MP Boost caps at II (+20)', e.active_tier_val, 'II (20)')
e = ev('Beast Killer', { 603, 597, 650, 595 })
check('Beast Killer 4 pts -> II', e.active_tier_val, 'II (10)')
check('retail trait flagged', ev('Tenacity', {}).retail, true)
check('server trait not flagged', ev('Attack Bonus', {}).retail, false)

-- every trait member is a real spell with a valid point value, every tier sorted
local bad = 0
for name, t in pairs(traits) do
    for _, sp in ipairs(t.spells) do if not spells[sp.id] or sp.points < 1 then bad = bad + 1 end end
    for i = 2, #t.tiers do if t.tiers[i].points < t.tiers[i - 1].points then bad = bad + 1 end end
end
check('trait data consistent', bad, 0)

-- ------------------------------------------------------------ JP gift in limits
real_print('\n-- Job Point gift')
check('99 main, 100 JP -> +1', model.get_limits(99, true, 5, 20, 100).gifts, 1)
check('99 main, 2100 JP -> still +1', model.get_limits(99, true, 5, 20, 2100).gifts, 1)
check('99 main, 99 JP -> 0', model.get_limits(99, true, 5, 20, 99).gifts, 0)
check('98 main -> 0', model.get_limits(98, true, 5, 0, 500).gifts, 0)
check('sub BLU -> 0', model.get_limits(49, false, 0, 0, 500).gifts, 0)

-- ------------------------------------------------------------ render every tab
real_print('\n-- render every tab')
local logs, texts = {}, {}
local zone_id = 116
local player = {}
function player:GetMainJob() return 16 end
function player:GetSubJob() return 1 end
function player:GetMainJobLevel() return 99 end
function player:GetSubJobLevel() return 49 end
function player:GetAssimilationPoints() return 5 end
function player:GetJobPointsSpent() return 500 end
function player:HasSpell(id) return true end
function player:GetCombatSkill() return { GetSkill = function() return 424 end } end
AshitaCore = {
    GetInstallPath = function() return '/tmp/vbspd' end,
    GetResourceManager = function() return { GetString = function() return nil end, GetSpellById = function() return nil end } end,
    GetMemoryManager = function() return {
        GetPlayer = function() return player end,
        GetParty = function() return { GetMemberZone = function() return zone_id end, GetMemberTargetIndex = function() return 1 end } end,
        GetEntity = function() return { GetLocalPositionX = function() return 0 end, GetLocalPositionY = function() return 0 end } end,
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
package.preload['settings'] = function() return { load = function() return {} end, save = function() end } end
local imgui = setmetatable({}, { __index = function(_, k)
    if k == 'Begin' or k == 'CollapsingHeader' or k == 'IsItemHovered' then return function() return true end end
    if k == 'Button' or k == 'Checkbox' then return function() return false end end
    if k == 'Text' or k == 'TextDisabled' or k == 'BulletText' or k == 'SetTooltip' then return function(t) texts[#texts + 1] = t end end
    if k == 'TextColored' then return function(c, t) texts[#texts + 1] = t end end
    if k == 'ProgressBar' then return function(f, s, o) texts[#texts + 1] = o end end
    return function() end
end })
package.preload['imgui'] = function() return imgui end
print = function(...) local t = {} for i = 1, select('#', ...) do t[#t + 1] = tostring((select(i, ...))) end logs[#logs + 1] = table.concat(t, ' ') end
local vb = dofile(ADDON .. '/vanablu.lua')
vb.gui.is_open[1] = true
local function seen(pat) for _, t in ipairs(texts) do if type(t) == 'string' and t:find(pat, 1, true) then return t end end end
for _, tab in ipairs({ 'Traits', 'Utility', 'Damage', 'Procs', 'All Spells', 'Spell Tracker', 'Saved Sets', 'Help' }) do
    vb.gui.active_tab = tab; logs = {}; texts = {}
    callbacks['d3d_present']()
    local errs = 0
    for _, l in ipairs(logs) do if l:find('VanaBlu Error', 1, true) then errs = errs + 1; real_print('   ' .. l) end end
    check('tab renders without errors: ' .. tab, errs, 0)
    if tab == 'Traits' then
        check('JP tier marker shown', seen('JP: V (60)') ~= nil, true)
        check('retail trait warning shown', seen('not in the public server code') ~= nil, true)
    elseif tab == 'All Spells' then
        check('no-element tag shown', seen('[None]') ~= nil, true)
        check('no-script tooltip shown', seen('no cast script in the public server code') ~= nil, true)
    elseif tab == 'Help' then
        check('help mentions JP gift', seen('+1 tier on every active trait') ~= nil, true)
    end
end
check('window renders', vb.gui and true, true)

print = real_print
print(('\n%d passed, %d failed'):format(pass, fail))
os.exit(fail == 0 and 0 or 1)
