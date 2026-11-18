--[[
* =============================================================================
* VanaBlu for Ashita v4
* Module: setstore.lua
*
* Description:
*   Saved spell set database.
*
*   The database lives in the addon's Ashita config folder, which addon updates
*   never touch:
*
*       <Ashita>\config\addons\vanablu\saved_sets.lua
*
*   Older releases kept the database in the addon folder itself
*   (<Ashita>\addons\vanablu\saved_sets.lua) and also mirrored it into the
*   per-character settings file. Because every release shipped an empty
*   saved_sets.lua, updating the addon wiped everyone's sets. On first load of
*   this version, any sets found in those old locations are migrated into the
*   config folder database, and the old addon-folder file is renamed to
*   saved_sets.lua.migrated so it is never read again.
*
*   The database is plain Lua data (a table of { name, spells }). It is loaded
*   in an empty environment so it cannot execute code.
* =============================================================================
--]]

local M = {
    db_path        = nil,   -- Full path of the live database file
    config_dir     = nil,   -- <Ashita>\config\addons\<addon>\
    legacy_path    = nil,   -- <Ashita>\addons\<addon>\saved_sets.lua (pre-1.0.1 location)
    migrated_count = 0,     -- Number of sets migrated on this load (0 if no migration happened)
    last_error     = nil,   -- Last load/save error message, if any
};

local DB_FILE       = 'saved_sets.lua';
local MIGRATED_EXT  = '.migrated';
local TMP_EXT       = '.tmp';

local log = function(msg) print('[VanaBlu] ' .. msg); end

-- -----------------------------------------------------------------------------
-- Filesystem helpers
-- -----------------------------------------------------------------------------

local function with_trailing_sep(p)
    if p == nil or p == '' then return p; end
    local last = p:sub(-1);
    if last ~= '\\' and last ~= '/' then
        return p .. '\\';
    end
    return p;
end

local function exists(path)
    local ok, res = pcall(function() return ashita.fs.exists(path); end);
    if ok and res ~= nil then
        return res == true;
    end
    local f = io.open(path, 'rb');
    if f then f:close(); return true; end
    return false;
end

local function ensure_dir(path)
    if exists(path) then return true; end
    local mk = ashita.fs.create_directory or ashita.fs.create_dir;
    if mk then pcall(mk, path); end
    return exists(path);
end

local function remove(path)
    if not exists(path) then return true; end
    return os.remove(path) ~= nil;
end

-- -----------------------------------------------------------------------------
-- (De)serialization
-- -----------------------------------------------------------------------------

--- Validates and copies raw set data into the canonical in-memory format:
--   sets[name] = { name = <string>, spells = { <spell id>, ... } }
-- Unknown fields are dropped; spell ids outside the Blue Magic range are skipped.
local function normalize(raw)
    local sets = {};
    if type(raw) ~= 'table' then return sets; end
    for key, v in pairs(raw) do
        if type(v) == 'table' and type(v.spells) == 'table' then
            local name = (type(v.name) == 'string' and v.name ~= '') and v.name or tostring(key);
            local spells = {};
            for _, id in ipairs(v.spells) do
                id = tonumber(id);
                if id and id >= 512 and id < 1024 and id == math.floor(id) then
                    spells[#spells + 1] = id;
                end
            end
            sets[name] = { name = name, spells = spells };
        end
    end
    return sets;
end

local function count(sets)
    local n = 0;
    for _ in pairs(sets or {}) do n = n + 1; end
    return n;
end

--- Reads a saved sets file. Returns the normalized sets table, or nil and an error message.
local function read_file(path)
    local chunk, err;
    if setfenv then
        chunk, err = loadfile(path);           -- LuaJIT / Lua 5.1 (Ashita)
        if chunk then setfenv(chunk, {}); end
    else
        chunk, err = loadfile(path, 't', {});  -- Lua 5.2+ (tests)
    end
    if not chunk then
        return nil, tostring(err);
    end
    local ok, data = pcall(chunk);
    if not ok then
        return nil, tostring(data);
    end
    if type(data) ~= 'table' then
        return nil, 'file did not return a table';
    end
    return normalize(data);
end

local function serialize(sets)
    local names = {};
    for name in pairs(sets or {}) do names[#names + 1] = name; end
    table.sort(names);

    local out = {
        '-- VanaBlu Saved Sets Database',
        '-- Location: <Ashita>\\config\\addons\\vanablu\\saved_sets.lua (safe across addon updates)',
        'return {',
    };
    for _, name in ipairs(names) do
        local set = sets[name];
        local ids = {};
        for _, id in ipairs(set.spells or {}) do
            ids[#ids + 1] = string.format('%d', id);
        end
        out[#out + 1] = string.format('    [%q] = {', name);
        out[#out + 1] = string.format('        name = %q,', set.name or name);
        out[#out + 1] = '        spells = { ' .. table.concat(ids, ', ') .. (#ids > 0 and ', ' or '') .. '},';
        out[#out + 1] = '    },';
    end
    out[#out + 1] = '};';
    return table.concat(out, '\n') .. '\n';
end

local function write_raw(path, content)
    local f, err = io.open(path, 'w');
    if not f then return false, tostring(err); end
    local ok, werr = f:write(content);
    f:close();
    if not ok then return false, tostring(werr); end
    return true;
end

--- Writes the database safely: write to a temp file, verify it parses, then replace the live file.
local function write_file(path, sets)
    local content = serialize(sets);
    local tmp = path .. TMP_EXT;

    local ok, err = write_raw(tmp, content);
    if not ok then
        remove(tmp);
        return false, err;
    end

    local check, cerr = read_file(tmp);
    if not check or count(check) ~= count(sets) then
        remove(tmp);
        return false, 'verification of written data failed: ' .. tostring(cerr or 'set count mismatch');
    end

    -- Windows rename does not overwrite, so remove the old database first. If anything goes wrong
    -- after this point, M.load() recovers from the verified temp file.
    remove(path);
    if os.rename(tmp, path) then
        return true;
    end

    ok, err = write_raw(path, content);
    if ok then remove(tmp); end
    return ok, err;
end

-- -----------------------------------------------------------------------------
-- Public API
-- -----------------------------------------------------------------------------

--- Resolves file locations. Must be called before load()/save().
-- @param opts table { addon_name = string, install_path = string, addon_dir = string, logger = function|nil }
function M.init(opts)
    opts = opts or {};
    if opts.logger then log = opts.logger; end

    local install = opts.install_path;
    if install and install ~= '' then
        install = install:gsub('[\\/]+$', '');
        M.config_dir = string.format('%s\\config\\addons\\%s\\', install, opts.addon_name or 'vanablu');
        M.db_path = M.config_dir .. DB_FILE;
    else
        M.config_dir, M.db_path = nil, nil;
    end

    if opts.addon_dir and opts.addon_dir ~= '' then
        M.legacy_path = with_trailing_sep(opts.addon_dir) .. DB_FILE;
    else
        M.legacy_path = nil;
    end
end

--- Renames the old addon-folder database so it is not read again (data is kept, not deleted).
local function retire_legacy()
    if not M.legacy_path or not exists(M.legacy_path) then return; end
    local target = M.legacy_path .. MIGRATED_EXT;
    remove(target);
    if not os.rename(M.legacy_path, target) then
        log('Note: could not rename the old addons\\vanablu\\saved_sets.lua; it will be ignored.');
    end
end

--- Loads saved sets, creating the config-folder database (and migrating old data) if needed.
-- @param extra_legacy_sets table|nil sets from the old per-character settings file (migration only)
-- @return table sets keyed by name
function M.load(extra_legacy_sets)
    M.migrated_count = 0;
    M.last_error = nil;

    if not M.db_path then
        M.last_error = 'Ashita install path unavailable; saved sets cannot be stored.';
        log(M.last_error);
        return {};
    end

    if not ensure_dir(M.config_dir) then
        M.last_error = 'Could not create config folder: ' .. M.config_dir;
        log(M.last_error);
    end

    -- 1. Recover from an interrupted save (database removed, verified temp file left behind)
    local tmp = M.db_path .. TMP_EXT;
    if not exists(M.db_path) and exists(tmp) and read_file(tmp) then
        os.rename(tmp, M.db_path);
    end

    -- 2. Normal case: the config-folder database is the single source of truth
    if exists(M.db_path) then
        local sets, err = read_file(M.db_path);
        if sets then
            retire_legacy();
            return sets;
        end
        -- Unreadable database: keep it for inspection rather than overwriting it, then rebuild below
        local bad = M.db_path .. '.unreadable-' .. os.date('%Y%m%d-%H%M%S');
        os.rename(M.db_path, bad);
        M.last_error = 'Saved sets database could not be read (' .. tostring(err) .. '). It was kept as ' .. bad;
        log(M.last_error);
    end

    -- 3. First run of this version: build the database from the old locations
    local sets = {};
    for name, set in pairs(normalize(extra_legacy_sets)) do
        sets[name] = set;
    end
    if M.legacy_path and exists(M.legacy_path) then
        local legacy, err = read_file(M.legacy_path);
        if legacy then
            for name, set in pairs(legacy) do
                sets[name] = set; -- addon-folder file wins, as it did in older versions
            end
        else
            log('Could not read old saved sets file (' .. tostring(err) .. '); it was left in place.');
        end
    end

    local ok, err = write_file(M.db_path, sets);
    if not ok then
        M.last_error = 'Could not create saved sets database: ' .. tostring(err);
        log(M.last_error);
        return sets; -- still usable this session; old file is left untouched
    end

    M.migrated_count = count(sets);
    if M.migrated_count > 0 then
        log(string.format('Moved %d saved set%s to config\\addons\\vanablu\\saved_sets.lua.',
            M.migrated_count, M.migrated_count == 1 and '' or 's'));
    end
    retire_legacy();
    return sets;
end

--- Saves all sets to the config-folder database.
-- @return boolean ok, string|nil error
function M.save(sets)
    if not M.db_path then
        return false, 'Ashita install path unavailable.';
    end
    ensure_dir(M.config_dir);
    local ok, err = write_file(M.db_path, sets);
    if not ok then
        M.last_error = 'Failed to save sets: ' .. tostring(err);
        log(M.last_error);
    end
    return ok, err;
end

--- Adds sets from `raw` whose names are not already in `target` (existing sets always win).
-- Used to recover the copies older versions wrote into per-character settings files.
-- @return number count of sets added
function M.merge_missing(target, raw)
    local added = 0;
    for name, set in pairs(normalize(raw)) do
        if target[name] == nil then
            target[name] = set;
            added = added + 1;
        end
    end
    return added;
end

-- Exposed for tests
M._serialize = serialize;
M._read_file = read_file;

return M;
