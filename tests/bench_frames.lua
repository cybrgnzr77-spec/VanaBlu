--[[
  bench_frames.lua - measures per-frame memory allocation and CPU time of VanaBlu's d3d_present.

  Usage: texlua bench_frames.lua <addon_dir> [frames]

  All Ashita / ImGui stubs return pre-allocated objects and cached functions, so the
  allocation figures reflect the addon's own code, not the stubs. The garbage collector is
  stopped while measuring; "KB/frame" is the memory allocated by one rendered frame.
]]
local ADDON = arg[1]
local FRAMES = tonumber(arg[2]) or 300
package.path = ADDON .. '/?.lua;' .. package.path
local real_print = print

-- ------------------------------------------------------------- stubs (allocation free)
local zone_id = 116
local player = {}
function player:GetMainJob() return 16 end
function player:GetSubJob() return 1 end
function player:GetMainJobLevel() return 99 end
function player:GetSubJobLevel() return 49 end
function player:GetAssimilationPoints() return 5 end
function player:GetJobPointsSpent() return 500 end
function player:HasSpell(id) return true end
local skill = { GetSkill = function() return 424 end }
function player:GetCombatSkill() return skill end
local party = { GetMemberZone = function() return zone_id end, GetMemberTargetIndex = function() return 1 end }
local entity = { GetLocalPositionX = function() return 0 end, GetLocalPositionY = function() return 0 end }
local memmgr = { GetPlayer = function() return player end, GetParty = function() return party end, GetEntity = function() return entity end }
local resmgr = { GetString = function() return 'East Sarutabaruta' end, GetSpellById = function() return nil end }
local ptrmgr = { Get = function() return 0 end }
AshitaCore = {
    GetInstallPath = function() return '/tmp/vbbench' end,
    GetResourceManager = function() return resmgr end,
    GetMemoryManager = function() return memmgr end,
    GetPointerManager = function() return ptrmgr end,
}
local callbacks = {}
local zeros = {}
for i = 1, 160 do zeros[i] = 0 end
ashita = {
    events = { register = function(ev, name, fn) callbacks[ev] = fn end },
    fs = { exists = function() return false end, create_directory = function() return true end },
    memory = { find = function() return 0 end, read_uint32 = function() return 0 end, read_uint8 = function() return 0 end,
               read_array = function(a, n) return zeros end },
}
addon = { name = 'vanablu', path = ADDON .. '/' }
bit = { rshift = function(a, n) return a >> n end }
struct = { unpack = function(f, d, p) return string.unpack('<I2', d, p) end }
package.preload['common'] = function() return true end
package.preload['ffi'] = function() return { cdef = function() end, cast = function(_, v) return v end } end
package.preload['settings'] = function() return { load = function() return {} end, save = function() end } end

local HEADERS_OPEN = true
local fns = {}
local function ret_true() return true end
local function ret_false() return false end
local function noop() end
local imgui = setmetatable({}, { __index = function(t, k)
    local f
    if k == 'Begin' then f = ret_true
    elseif k == 'CollapsingHeader' then f = function() return HEADERS_OPEN end
    elseif k == 'Button' or k == 'Checkbox' then f = ret_false
    else f = noop end
    rawset(t, k, f)
    return f
end })
package.preload['imgui'] = function() return imgui end
print = function() end

local vb = dofile(ADDON .. '/vanablu.lua')
vb.gui.is_open[1] = true
local present = callbacks['d3d_present']

local function measure(tab, open)
    HEADERS_OPEN = open
    vb.gui.active_tab = tab
    for _ = 1, 20 do present() end          -- warm caches
    collectgarbage('collect')
    collectgarbage('stop')
    local m0 = collectgarbage('count')
    local t0 = os.clock()
    for _ = 1, FRAMES do present() end
    local t1 = os.clock()
    local m1 = collectgarbage('count')
    collectgarbage('restart')
    return (m1 - m0) / FRAMES, (t1 - t0) * 1000 / FRAMES
end

real_print(string.format('%-14s %-9s %10s %10s', 'tab', 'headers', 'KB/frame', 'ms/frame'))
for _, tab in ipairs({ 'Traits', 'Utility', 'Damage', 'Procs', 'All Spells', 'Spell Tracker', 'Saved Sets', 'Help' }) do
    for _, open in ipairs({ false, true }) do
        local kb, ms = measure(tab, open)
        real_print(string.format('%-14s %-9s %10.2f %10.3f', tab, open and 'open' or 'closed', kb, ms))
    end
end
