-- Tests for saved set storage/migration (setstore.lua + vanablu.lua wiring). Run with texlua.
local ADDON_SRC = arg[1]
local ROOT = '/tmp/vbtest'

-- ------------------------------------------------------------ path translation (Windows -> Linux)
local function tr(p) return (p:gsub('\\', '/'):gsub('//+', '/')) end
local real_open, real_rename, real_remove, real_loadfile = io.open, os.rename, os.remove, loadfile
io.open = function(p, m) return real_open(tr(p), m) end
os.rename = function(a, b) return real_rename(tr(a), tr(b)) end
os.remove = function(p) return real_remove(tr(p)) end
loadfile = function(p, ...) return real_loadfile(tr(p), ...) end
local function mkdirs(p)
    local acc = ''
    for part in tr(p):gmatch('[^/]+') do acc = acc .. '/' .. part; lfs.mkdir(acc) end
    return true
end
local function fexists(p) return lfs.attributes((tr(p):gsub('/$', ''))) ~= nil end
local function read_all(p) local f = real_open(tr(p), 'r'); if not f then return nil end local s = f:read('a'); f:close(); return s end
local function write_all(p, s) mkdirs(tr(p):match('(.*)/')); local f = assert(real_open(tr(p), 'w')); f:write(s); f:close() end

local INSTALL = ROOT .. '/ashita'
local ADDON_DIR = INSTALL .. '\\addons\\vanablu\\'
local CONF_DIR = INSTALL .. '\\config\\addons\\vanablu\\'
local DB = CONF_DIR .. 'saved_sets.lua'
local LEGACY = ADDON_DIR .. 'saved_sets.lua'

local logs = {}
ashita = {
    fs = { exists = fexists, create_directory = mkdirs },
    events = { register = function() end },
    memory = { find = function() return 0 end, read_uint32 = function() return 0 end, read_uint8 = function() return 0 end,
               read_array = function(a, n) local t = {} for i = 1, n do t[i] = 0 end return t end },
}
local real_print = print
print = function(...) local t = {} for i = 1, select('#', ...) do t[#t + 1] = tostring((select(i, ...))) end logs[#logs + 1] = table.concat(t, ' ') end

local pass, fail = 0, 0
local function check(name, got, want)
    if got == want then pass = pass + 1; real_print('PASS  ' .. name)
    else fail = fail + 1; real_print(('FAIL  %s  (got %s, want %s)'):format(name, tostring(got), tostring(want))) end
end
local function reset()
    os.execute('rm -rf ' .. ROOT)
    mkdirs(tr(ADDON_DIR)); mkdirs(INSTALL .. '/config/addons')
    logs = {}
end
local function nsets(t) local n = 0 for _ in pairs(t) do n = n + 1 end return n end
local function legacy_file(sets_src) write_all(LEGACY, '-- VanaBlu Saved Sets Database\nreturn {\n' .. sets_src .. '};\n') end
local function logged(pat) for _, l in ipairs(logs) do if l:find(pat, 1, true) then return true end end return false end

package.path = ADDON_SRC .. '/?.lua;' .. package.path
local function fresh_store()
    package.loaded['setstore'] = nil
    local s = require('setstore')
    s.init({ addon_name = 'vanablu', install_path = INSTALL, addon_dir = ADDON_DIR })
    return s
end

-- ============================================================ setstore unit tests
real_print('\n-- fresh install (no old data)')
reset()
local store = fresh_store()
local sets = store.load()
check('db created in config folder', fexists(DB), true)
check('no sets', nsets(sets), 0)
check('no migration message', logged('Moved'), false)
check('db path', tr(store.db_path), tr(DB))

real_print('\n-- upgrade from v1.0 with sets in addon folder')
reset()
legacy_file([[
    ["Melee"] = { name = "Melee", spells = { 513, 519, 594, }, },
    ["Nuke \"Big\""] = { name = "Nuke \"Big\"", spells = { 719, 720, }, },
]])
store = fresh_store()
sets = store.load()
check('2 sets migrated', store.migrated_count, 2)
check('Melee spells kept', #sets['Melee'].spells, 3)
check('quoted name kept', sets['Nuke "Big"'] ~= nil, true)
check('db written', fexists(DB), true)
check('old file renamed', fexists(LEGACY), false)
check('old file kept as .migrated', fexists(LEGACY .. '.migrated'), true)
check('migration logged', logged('Moved 2 saved sets'), true)

real_print('\n-- next load reads the config db only')
store = fresh_store()
sets = store.load()
check('2 sets loaded', nsets(sets), 2)
check('no re-migration', store.migrated_count, 0)

real_print('\n-- user extracts a release that still ships an empty saved_sets.lua')
legacy_file('')
store = fresh_store()
sets = store.load()
check('db sets survive', nsets(sets), 2)
check('empty legacy file retired', fexists(LEGACY), false)

real_print('\n-- save / delete round trip')
sets['Melee'] = nil
sets['Tank'] = { name = 'Tank', spells = { 547, 632, 685 } }
check('save ok', (store.save(sets)), true)
check('no temp file left', fexists(DB .. '.tmp'), false)
store = fresh_store()
sets = store.load()
check('deleted set stays deleted', sets['Melee'], nil)
check('new set saved', sets['Tank'] and #sets['Tank'].spells, 3)
check('quoted set intact', sets['Nuke "Big"'] and sets['Nuke "Big"'].spells[2], 720)

real_print('\n-- interrupted save recovery')
local good = read_all(DB)
os.remove(DB); write_all(DB .. '.tmp', good)
store = fresh_store()
sets = store.load()
check('recovered from temp file', nsets(sets), 2)
check('db restored', fexists(DB), true)

real_print('\n-- unreadable db is kept, not overwritten')
write_all(DB, 'return { this is not lua')
store = fresh_store()
sets = store.load()
local found_bad = false
for f in lfs.dir(tr(CONF_DIR)) do if f:find('saved_sets.lua.unreadable-', 1, true) then found_bad = true end end
check('bad db preserved', found_bad, true)
check('fresh db created', fexists(DB), true)
check('error reported', store.last_error ~= nil, true)

real_print('\n-- database cannot execute code')
reset()
write_all(DB, 'os.execute("touch ' .. ROOT .. '/pwned"); return {}')
store = fresh_store()
store.load()
check('code in db did not run', fexists(ROOT .. '/pwned'), false)

real_print('\n-- bad spell ids filtered')
reset()
legacy_file('["X"] = { name = "X", spells = { 513, 99, "abc", 2000, 700.5, 728, }, },')
store = fresh_store()
sets = store.load()
check('only valid blue magic ids', #sets['X'].spells, 2)

real_print('\n-- merge_missing keeps existing sets')
local target = { A = { name = 'A', spells = { 513 } } }
local added = store.merge_missing(target, { A = { name = 'A', spells = { 600 } }, B = { name = 'B', spells = { 601 } } })
check('one added', added, 1)
check('existing A unchanged', target.A.spells[1], 513)

-- ============================================================ vanablu.lua integration (settings copies)
real_print('\n-- vanablu.lua: migrate addon-folder file + per-character settings copy')
reset()
legacy_file('["A"] = { name = "A", spells = { 513, }, },')

-- fake Ashita settings library
local fake = { saves = 0, callbacks = {} }
local char_settings = { saved_sets = { A = { name = 'A', spells = { 999 } }, B = { name = 'B', spells = { 521 } } } }
fake.load = function(defaults) return char_settings end
fake.save = function() fake.saves = fake.saves + 1; return true end
fake.register = function(sa, ea, cb) fake.callbacks[ea] = cb; return true end
package.preload['settings'] = function() return fake end
package.preload['common'] = function() return true end
package.preload['ffi'] = function() return { cdef = function() end, cast = function(_, v) return v end } end
package.preload['imgui'] = function() return {} end
bit = { rshift = function(a, n) return a >> n end }
struct = { unpack = function(f, d, p) return string.unpack('<I2', d, p) end }
AshitaCore = {
    GetInstallPath = function() return INSTALL end,
    GetMemoryManager = function() return {} end,
    GetPointerManager = function() return { Get = function() return 0 end } end,
    GetResourceManager = function() return {} end,
}
addon = { name = 'vanablu', path = ADDON_DIR }
package.loaded['setstore'] = nil
for _, m in ipairs({ 'backend', 'model', 'res.spellinfo', 'res.traits', 'res.hunting' }) do package.loaded[m] = nil end
local vb = dofile(ADDON_SRC .. '/vanablu.lua')
local g = vb.gui.saved_sets
check('A migrated from addon-folder file (file wins)', g.A and g.A.spells[1], 513)
check('B recovered from character settings', g.B and g.B.spells[1], 521)
check('settings copy cleared', char_settings.saved_sets, nil)
check('settings saved after clearing', fake.saves >= 1, true)
check('recovery logged', logged('Recovered 1 saved set'), true)
check('total_bp computed for recovered set', g.B.total_bp, 4)
local s2 = fresh_store(); local disk = s2.load()
check('db on disk has A and B', disk.A ~= nil and disk.B ~= nil, true)

real_print('\n-- login to another character with an old settings copy')
local cb = fake.callbacks['vanablu_settings_update']
check('settings callback registered', type(cb), 'function')
local other = { saved_sets = { C = { name = 'C', spells = { 547 } }, A = { name = 'A', spells = { 700 } } } }
cb(other)
check('C recovered', g.C ~= nil, true)
check('A not overwritten', g.A.spells[1], 513)
check('other character copy cleared', other.saved_sets, nil)
disk = fresh_store().load()
check('C persisted', disk.C ~= nil, true)

real_print('\n-- deleted set does not come back from settings')
g.B = nil
package.loaded['setstore'].save(g)
cb({}) -- character reload with no stale copy
disk = fresh_store().load()
check('B stays deleted', disk.B, nil)

real_print(('\n%d passed, %d failed'):format(pass, fail))
os.exit(fail == 0 and 0 or 1)
