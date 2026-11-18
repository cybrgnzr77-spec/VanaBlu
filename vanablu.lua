--[[
* =============================================================================
* VanaBlu for Ashita v4
* Module: vanablu.lua
*
* Description:
*   A comprehensive, interactive Blue Magic spell, job trait, and skillchain
*   guide for Final Fantasy XI, rebuilt for Ashita v4.
*
* Architectural Highlights:
*   - Native Direct3D Dear ImGui rendering via 'd3d_present' event.
*   - Uses clean two-column layout (Columns API) with zero child-window nesting,
*     eliminating internal Dear ImGui assertions and orphan Debug windows.
*   - Full PushID/PopID scoping on all spell rows and slots to completely
*     prevent Dear ImGui ID collision warnings.
*   - Native SetTooltip implementation for hover tooltips with zero window leaks.
*   - Direct memory reading and safe native spell-equipping.
*
* Author: Anissa of Cerberus (Original Windower 4 concept)
* Re-engineered for Ashita v4 by Assistant
* =============================================================================
--]]

addon.name    = 'vanablu';
addon.author  = 'Anissa (original bluGuide) / Ashita v4 port & VanaBlu enhancements';
addon.version = '1.0.2';
addon.desc    = 'Interactive Blue Magic spell, trait, skillchain, and hunting guide for Ashita v4.';
addon.link    = 'https://github.com/mverteuil/windower4-addons/tree/master/vanablu';

require('common');
local imgui   = require('imgui');
local backend = require('backend');
local model   = require('model');
local spells  = require('res.spellinfo');
local traits  = require('res.traits');
local hunting = require('res.hunting');
local setstore = require('setstore');
local tracker = require('tracker');

-- =============================================================================
-- GUI State & Navigation
-- =============================================================================
local gui = {
    is_open               = { false }, -- Closed on load; toggled via /vanablu, /vanab, or /vb
    active_tab            = 'Traits',
    search_query          = { '' },
    new_set_name          = { '' },
    saved_sets            = {},
    saved_sets_dirty      = true,     -- Dirty flag to avoid re-sorting set names every frame
    sorted_set_names      = {},       -- Cached list of sorted set names
    cached_learned_map    = nil,      -- Cached map of learned spells to avoid ~10k calls/sec
    cached_learned_count  = 0,        -- Cached count of learned spells
    last_learned_check    = 0,        -- Timestamp of last memory scan for learned spells
    last_player_level     = -1,       -- Level tracking to invalidate learned cache on level-up
    cached_limits         = nil,      -- Cached character limits (recomputed only on level/merit change)
    cached_lim_lvl        = -1,
    cached_lim_main       = nil,
    cached_lim_assim      = -1,
    cached_lim_bp         = -1,
    cached_lim_jp         = -1,
    cached_lim_client_max = -1,
    cached_equipped_state = nil,      -- Cached equipped state (recomputed only when memory buffer changes)
    last_raw_buf             = nil,      -- Snapshot of last frame's 20-byte spell buffer
    filter_learned_only      = { false },
    filter_unlearned_only    = { false },
    filter_my_level_only     = { false },
    filter_current_zone_only = { false },-- Toggle to filter tracker by current zone
    cached_zone_id           = 0,        -- Cached zone ID
    cached_zone_name         = '',       -- Cached zone name
    override_zone_name       = '',       -- Optional manual zone override for testing/custom areas
    status_message           = '',
    status_time              = 0,
    status_is_error          = false,
};

-- Available navigation tabs including Saved Sets manager
local NAV_TABS = {
    'Traits',
    'Utility',
    'Damage',
    'Procs',
    'All Spells',
    'Spell Tracker',
    'Saved Sets',
    'Help'
};

-- Precomputed static tab button labels to eliminate string concatenations per frame
local TAB_BUTTON_LABELS_ACTIVE = {};
local TAB_BUTTON_LABELS_INACTIVE = {};
for _, tab_name in ipairs(NAV_TABS) do
    TAB_BUTTON_LABELS_ACTIVE[tab_name] = '* ' .. tab_name .. ' *##nav_' .. tab_name;
    TAB_BUTTON_LABELS_INACTIVE[tab_name] = tab_name .. '##nav_' .. tab_name;
end

-- =============================================================================
-- Saved Sets Persistence
-- =============================================================================
local settings = nil;
pcall(function() settings = require('settings'); end);

-- Per-character settings (Ashita settings library). Saved sets are NOT stored here anymore; any
-- saved_sets table left in an existing settings file is only read once for migration.
local default_settings = {};

local addon_settings = nil;
if settings and settings.load then
    pcall(function()
        addon_settings = settings.load(default_settings);
    end);
end
if not addon_settings then
    addon_settings = default_settings;
end

local function get_addon_dir()
    local path = '';
    pcall(function()
        if addon and addon.path and addon.path ~= '' then
            path = addon.path;
        end
    end);
    if path == '' then
        pcall(function()
            local ashita_path = AshitaCore:GetInstallPath();
            if ashita_path and ashita_path ~= '' then
                path = ashita_path .. '/addons/vanablu/';
            end
        end);
    end
    if path == '' then
        path = 'addons/vanablu/';
    end
    local last_char = path:sub(-1);
    if last_char ~= '/' and last_char ~= '\\' then
        path = path .. '/';
    end
    return path;
end

-- Saved sets are stored in <Ashita>\config\addons\vanablu\saved_sets.lua (see setstore.lua) so that
-- updating the addon never overwrites them. Sets from the old addon-folder file are migrated
-- automatically on first load.
local function load_saved_sets()
    local install_path = '';
    pcall(function() install_path = AshitaCore:GetInstallPath() or ''; end);

    setstore.init({
        addon_name   = addon.name,
        install_path = install_path,
        addon_dir    = get_addon_dir(),
    });

    local sets = setstore.load();
    for _, set in pairs(sets) do
        set.total_bp = model.calculate_set_bp(set.spells, spells);
    end
    return sets;
end

local function save_saved_sets(sets)
    gui.saved_sets_dirty = true;
    return setstore.save(sets);
end

-- Initialize saved sets from storage
gui.saved_sets = load_saved_sets();

--- Older versions also copied every saved set into the per-character settings file
--- (config\addons\vanablu\<Character>_<id>\settings.lua). Those copies survive addon updates, so
--- they can restore sets lost by earlier updates. Each copy is imported once (sets already in the
--- database are never overwritten) and then removed from the settings file, so a set deleted later
--- cannot reappear from a stale copy.
local function absorb_settings_sets(s)
    if type(s) ~= 'table' or type(s.saved_sets) ~= 'table' then
        return;
    end

    local added = setstore.merge_missing(gui.saved_sets, s.saved_sets);
    if added > 0 then
        for _, set in pairs(gui.saved_sets) do
            set.total_bp = set.total_bp or model.calculate_set_bp(set.spells, spells);
        end
        local ok = save_saved_sets(gui.saved_sets);
        if not ok then
            return; -- keep the settings copy; try again next time
        end
        print(string.format('[VanaBlu] Recovered %d saved set%s from your character settings.', added, added == 1 and '' or 's'));
    end

    s.saved_sets = nil;
    if settings and settings.save then
        pcall(function() settings.save(); end);
    end
end

absorb_settings_sets(addon_settings);

-- The settings library loads each character's settings file after login / on character change.
if settings and settings.register then
    pcall(function()
        settings.register('settings', 'vanablu_settings_update', function(s)
            addon_settings = s;
            absorb_settings_sets(s);
        end);
    end);
end

-- Pre-sorted lists
local ordered_spells = {};
local trait_list = {};

-- Utility effect filter definitions matching the original Windower bluGuide
local utility_categories = {
    { name = 'Cure', filter = function(s) return s.effect and s.effect['Cure'] end },
    { name = 'Erase', filter = function(s) return s.effect and s.effect['Erase'] end },
    { name = 'Haste', filter = function(s) return s.effect and s.effect['Haste'] end },
    { name = 'Refresh', filter = function(s) return s.effect and s.effect['Refresh'] end },
    { name = 'Regen', filter = function(s) return s.effect and s.effect['Regen'] end },
    { name = 'Attack Boost', filter = function(s) return s.effect and s.effect['Attack Boost'] end },
    { name = 'Defense Boost', filter = function(s) return s.effect and s.effect['Defense Boost'] end },
    { name = 'Accuracy Boost', filter = function(s) return s.effect and s.effect['Accuracy Boost'] end },
    { name = 'Evasion Boost', filter = function(s) return s.effect and s.effect['Evasion Boost'] end },
    { name = 'Magic Attack Boost', filter = function(s) return s.effect and s.effect['Magic Attack Boost'] end },
    { name = 'Magic Defense Boost', filter = function(s) return s.effect and s.effect['Magic Defense Boost'] end },
    { name = 'Stoneskin', filter = function(s) return s.effect and s.effect['Stoneskin'] end },
    { name = 'Phalanx', filter = function(s) return s.effect and s.effect['Phalanx'] end },
    { name = 'Blink', filter = function(s) return s.effect and s.effect['Blink'] end },
    { name = 'Spikes', filter = function(s) return s.effect and s.effect['Spikes'] end },
    { name = 'Counter', filter = function(s) return s.effect and s.effect['Counter'] end },
    { name = 'Sleep', filter = function(s) return s.effect and s.effect['Sleep'] end },
    { name = 'Dispel', filter = function(s) return s.effect and s.effect['Dispel'] end },
    { name = 'Stun', filter = function(s) return s.effect and s.effect['Stun'] end },
    { name = 'Terror', filter = function(s) return s.effect and s.effect['Terror'] end },
    { name = 'Silence', filter = function(s) return s.effect and s.effect['Silence'] end },
    { name = 'Slow', filter = function(s) return s.effect and s.effect['Slow'] end },
    { name = 'Paralyze', filter = function(s) return s.effect and s.effect['Paralyze'] end },
    { name = 'Bind', filter = function(s) return s.effect and s.effect['Bind'] end },
    { name = 'Gravity', filter = function(s) return s.effect and s.effect['Gravity'] end },
    { name = 'Petrify', filter = function(s) return s.effect and s.effect['Petrify'] end },
    { name = 'Flash', filter = function(s) return s.effect and s.effect['Flash'] end },
    { name = 'Blind', filter = function(s) return s.effect and s.effect['Blind'] end },
    { name = 'Reduce TP', filter = function(s) return s.effect and s.effect['Reduce TP'] end },
    { name = 'Plague', filter = function(s) return s.effect and s.effect['Plague'] end },
    { name = 'Poison', filter = function(s) return s.effect and s.effect['Poison'] end },
    { name = 'Aspir', filter = function(s) return s.effect and s.effect['Aspir'] end },
    { name = 'Drain', filter = function(s) return s.effect and s.effect['Drain'] end },
    { name = 'Defense Down', filter = function(s) return s.effect and s.effect['Defense Down'] end },
    { name = 'Evasion Down', filter = function(s) return s.effect and s.effect['Evasion Down'] end },
    { name = 'Magic Def Down', filter = function(s) return s.effect and (s.effect['Magic Defense Down'] or s.effect['Magic Def. Down']) end },
    { name = 'Accuracy Down', filter = function(s) return s.effect and s.effect['Accuracy Down'] end },
    { name = 'Attack Down', filter = function(s) return s.effect and s.effect['Attack Down'] end },
    { name = 'Vit Down', filter = function(s) return s.effect and s.effect['Vit Down'] end },
    { name = 'Int Down', filter = function(s) return s.effect and s.effect['Int Down'] end },
    { name = 'Str Down', filter = function(s) return s.effect and s.effect['Str Down'] end },
    { name = 'Dex Down', filter = function(s) return s.effect and s.effect['Dex Down'] end },
    { name = 'Frost / Burn / Drown', filter = function(s) return s.effect and (s.effect['Frost'] or s.effect['Burn'] or s.effect['Drown']) end },
    { name = 'Bio / Doom', filter = function(s) return s.effect and (s.effect['Bio'] or s.effect['Doom']) end },
};

-- Physical skillchain properties
local skillchain_categories = {
    { name = 'Gravitation',   sc = 'Gravitation' },
    { name = 'Fusion',        sc = 'Fusion' },
    { name = 'Distortion',    sc = 'Distortion' },
    { name = 'Fragmentation', sc = 'Fragmentation' },
    { name = 'Transfixion',   sc = 'Transfixion' },
    { name = 'Compression',   sc = 'Compression' },
    { name = 'Reverberation', sc = 'Reverberation' },
    { name = 'Induration',    sc = 'Induration' },
    { name = 'Impaction',     sc = 'Impaction' },
    { name = 'Liquefaction',  sc = 'Liquefaction' },
    { name = 'Detonation',    sc = 'Detonation' },
    { name = 'Scission',      sc = 'Scission' },
};

-- Elemental nukes
local elemental_nukes = {
    { name = 'Fire Nukes',    elem = 0 },
    { name = 'Ice Nukes',     elem = 1 },
    { name = 'Wind Nukes',    elem = 2 },
    { name = 'Earth Nukes',   elem = 3 },
    { name = 'Thunder Nukes', elem = 4 },
    { name = 'Water Nukes',   elem = 5 },
    { name = 'Light Nukes',   elem = 6 },
    { name = 'Dark Nukes',    elem = 7 },
};

-- Weakness proc categories
local proc_categories = {
    { name = 'Voidwatch - Fire',    filter = function(s) return s.Voidwatch and s.element == 0 end },
    { name = 'Voidwatch - Ice',     filter = function(s) return s.Voidwatch and s.element == 1 end },
    { name = 'Voidwatch - Wind',    filter = function(s) return s.Voidwatch and s.element == 2 end },
    { name = 'Voidwatch - Earth',   filter = function(s) return s.Voidwatch and s.element == 3 end },
    { name = 'Voidwatch - Thunder', filter = function(s) return s.Voidwatch and s.element == 4 end },
    { name = 'Voidwatch - Water',   filter = function(s) return s.Voidwatch and s.element == 5 end },
    { name = 'Voidwatch - Light',   filter = function(s) return s.Voidwatch and s.element == 6 end },
    { name = 'Voidwatch - Dark',    filter = function(s) return s.Voidwatch and s.element == 7 end },
    { name = 'Abyssea Procs',       filter = function(s) return s.Abyssea == true end },
};

-- Element colors (RGBA 0.0 - 1.0)
local ELEMENT_COLORS = {
    [0]  = { 1.0, 0.45, 0.45, 1.0 }, -- Fire (Red)
    [1]  = { 0.65, 0.85, 1.0, 1.0 }, -- Ice (Cyan/Light Blue)
    [2]  = { 0.45, 1.0, 0.45, 1.0 }, -- Wind (Green)
    [3]  = { 1.0, 0.92, 0.35, 1.0 }, -- Earth (Yellow)
    [4]  = { 0.92, 0.45, 1.0, 1.0 }, -- Thunder (Purple)
    [5]  = { 0.45, 0.65, 1.0, 1.0 }, -- Water (Blue)
    [6]  = { 0.98, 0.98, 1.0, 1.0 }, -- Light (White)
    [7]  = { 0.70, 0.70, 0.75, 1.0 }, -- Dark (Grey)
    [15] = { 0.95, 0.65, 0.25, 1.0 }, -- Physical (Orange)
    [16] = { 0.80, 0.80, 0.80, 1.0 }, -- No element (Light grey)
};

local ELEMENT_NAMES = {
    [0]  = 'Fire',  [1]  = 'Ice',    [2]  = 'Wind',  [3]  = 'Earth',
    [4]  = 'Thunder',[5] = 'Water',  [6]  = 'Light', [7]  = 'Dark',
    [15] = 'Phys',
};

-- Precomputed 4-character element bracket tags for instant zero-allocation rendering
local ELEMENT_TAGS = {
    [0]  = '[Fire]', [1]  = '[Ice ]', [2]  = '[Wind]', [3]  = '[Eart]',
    [4]  = '[Thun]', [5]  = '[Wate]', [6]  = '[Ligh]', [7]  = '[Dark]',
    [15] = '[Phys]',
};

local WINDOW_TITLE = 'VanaBlu v' .. tostring(addon.version);

-- Precomputed slot labels and push IDs for sidebar slots 1 to 20
local EMPTY_SLOT_LABELS = {};
local SLOT_PUSH_IDS = {};
for slot = 1, 20 do
    EMPTY_SLOT_LABELS[slot] = string.format('%2d. [Empty]', slot);
    SLOT_PUSH_IDS[slot] = 'eq_slot_' .. tostring(slot);
end

local spell_traits_map = {};

-- Initialize and sort master data structures once, and precompute static display strings
local function initialize_data()
    for _, sp in pairs(spells) do
        table.insert(ordered_spells, sp);
    end
    table.sort(ordered_spells, function(a, b)
        if a.level == b.level then
            return a.name < b.name;
        end
        return a.level < b.level;
    end);

    for trait_name, tr in pairs(traits) do
        table.insert(trait_list, tr);
        if tr.spells then
            for _, sp_ref in ipairs(tr.spells) do
                if sp_ref.id then
                    if not spell_traits_map[sp_ref.id] then
                        spell_traits_map[sp_ref.id] = {};
                    end
                    table.insert(spell_traits_map[sp_ref.id], {
                        name = trait_name,
                        points = sp_ref.points or 0,
                    });
                end
            end
        end
    end
    table.sort(trait_list, function(a, b) return a.name < b.name; end);
    for _, tr_sub in pairs(spell_traits_map) do
        table.sort(tr_sub, function(a, b) return a.name < b.name; end);
    end

    -- Precompute per-spell labels, contexts, and tracker strings to eliminate per-frame allocations
    for _, sp in ipairs(ordered_spells) do
        sp.default_label = string.format('%-20s (Lv.%-2d | %d BP)', sp.name, sp.level, sp.cost or 0);
        if sp.physical then
            sp.elem_tag, sp.element_name, sp.elem_key = '[Phys]', 'Physical', 15;
        elseif sp.element == 15 then
            sp.elem_tag, sp.element_name, sp.elem_key = '[None]', 'None', 16;
        else
            sp.elem_tag, sp.element_name, sp.elem_key = ELEMENT_TAGS[sp.element] or '[???]', ELEMENT_NAMES[sp.element] or 'Unknown', sp.element;
        end
        sp.all_ctx = 'all_' .. sp.id;
        sp.id_str = tostring(sp.id);

        -- Precompute traits summary for tracker
        local tr_list = spell_traits_map[sp.id] or {};
        if #tr_list > 0 then
            local tr_strs = {};
            for _, t_entry in ipairs(tr_list) do
                table.insert(tr_strs, string.format('%s (+%d pts)', t_entry.name, t_entry.points));
            end
            sp.tracker_traits = 'Job Traits: ' .. table.concat(tr_strs, ', ');
        else
            sp.tracker_traits = 'Job Traits: None';
        end

        -- Precompute skillchain string
        local sc_parts = {};
        if sp.SCA then table.insert(sc_parts, sp.SCA); end
        if sp.SCB then table.insert(sc_parts, sp.SCB); end
        if #sc_parts > 0 then
            sp.tracker_skillchain = 'Skillchain: ' .. table.concat(sc_parts, ' / ');
            sp.tip_sc_text = '\nSkillchain: ' .. table.concat(sc_parts, ' / ');
        else
            sp.tracker_skillchain = nil;
            sp.tip_sc_text = '';
        end

        -- Precompute additional effects string
        local eff_keys = {};
        if sp.effect then
            for k in pairs(sp.effect) do table.insert(eff_keys, k); end
            table.sort(eff_keys);
        end
        if #eff_keys > 0 then
            sp.tracker_effects = 'Additional Effects: ' .. table.concat(eff_keys, ', ');
            sp.tip_eff_text = '\nEffects: ' .. table.concat(eff_keys, ', ');
        else
            sp.tracker_effects = nil;
            sp.tip_eff_text = '';
        end

        -- Precompute weakness triggers string
        local procs = {};
        if sp.Voidwatch then table.insert(procs, 'Voidwatch'); end
        if sp.Abyssea then table.insert(procs, 'Abyssea'); end
        if #procs > 0 then
            sp.tracker_procs = 'Triggers: ' .. table.concat(procs, ', ');
            sp.tip_proc_text = '\nProcs: ' .. table.concat(procs, ', ');
        else
            sp.tracker_procs = nil;
            sp.tip_proc_text = '';
        end

        -- Spells with no cast script in the public server code (effect on cast is unconfirmed)
        sp.tip_noscript_text = sp.noscript and '\nServer note: no cast script in the public server code - casting it may do nothing.\nIt still counts for job traits and stat bonuses.' or '';

    end

    -- Precompute category spell lists, headers, and item contexts
    for _, cat in ipairs(utility_categories) do
        cat.spells = {};
        for _, sp in ipairs(ordered_spells) do
            if cat.filter(sp) then
                table.insert(cat.spells, sp);
            end
        end
        cat.header = string.format('%s (%d spells)##cat_%s', cat.name, #cat.spells, cat.name);
        for _, sp in ipairs(cat.spells) do
            sp.ut_ctx = sp.ut_ctx or {};
            sp.ut_ctx[cat.name] = 'ut_' .. cat.name .. '_' .. sp.id;
        end
    end

    for _, sc_cat in ipairs(skillchain_categories) do
        sc_cat.spells = {};
        for _, sp in ipairs(ordered_spells) do
            if sp.SCA == sc_cat.sc or sp.SCB == sc_cat.sc then
                table.insert(sc_cat.spells, sp);
            end
        end
        sc_cat.header = string.format('%s (%d spells)###sc_%s', sc_cat.name, #sc_cat.spells, sc_cat.name);
        for _, sp in ipairs(sc_cat.spells) do
            sp.sc_desc = string.format('%-18s [%s%s] (Lv.%d, %d BP)',
                sp.name, sp.SCA or '', (sp.SCA and sp.SCB) and (' / ' .. sp.SCB) or (sp.SCB or ''), sp.level, sp.cost or 0);
            sp.sc_ctx = sp.sc_ctx or {};
            sp.sc_ctx[sc_cat.name] = 'sc_' .. sc_cat.name .. '_' .. sp.id;
        end
    end

    for _, nuke_cat in ipairs(elemental_nukes) do
        nuke_cat.spells = {};
        for _, sp in ipairs(ordered_spells) do
            if sp.Nuke and sp.element == nuke_cat.elem then
                table.insert(nuke_cat.spells, sp);
            end
        end
        nuke_cat.header = string.format('%s (%d spells)###nuke_%s', nuke_cat.name, #nuke_cat.spells, nuke_cat.name);
        for _, sp in ipairs(nuke_cat.spells) do
            sp.nk_ctx = sp.nk_ctx or {};
            sp.nk_ctx[nuke_cat.name] = 'nk_' .. nuke_cat.name .. '_' .. sp.id;
        end
    end

    for _, cat in ipairs(proc_categories) do
        cat.spells = {};
        for _, sp in ipairs(ordered_spells) do
            if cat.filter(sp) then
                table.insert(cat.spells, sp);
            end
        end
        cat.header = string.format('%s (%d spells)###proc_%s', cat.name, #cat.spells, cat.name);
        for _, sp in ipairs(cat.spells) do
            sp.pr_ctx = sp.pr_ctx or {};
            sp.pr_ctx[cat.name] = 'pr_' .. cat.name .. '_' .. sp.id;
        end
    end

    for _, tr in ipairs(trait_list) do
        if tr.spells then
            for _, sp_ref in ipairs(tr.spells) do
                local full_sp = spells[sp_ref.id];
                sp_ref.row_label = string.format('%-18s [Trait: +%d pts | Cost: %d BP | Lv.%d]%s',
                    sp_ref.name, sp_ref.points or 0, sp_ref.cost or (full_sp and full_sp.cost) or 0, (full_sp and full_sp.level) or 1,
                    sp_ref.retail and '  (retail value, unconfirmed)' or '');
                sp_ref.row_ctx = 'tr_' .. tr.name .. '_' .. sp_ref.id;
            end
        end
    end
end

initialize_data();

-- Spell Tracker list (includes Unbridled Learning spells, which are not in res/spellinfo.lua)
tracker.build(hunting, spells);

-- =============================================================================
-- Safe ImGui Adapter Functions & Lifecycle Tracking
-- =============================================================================

local open_styles = 0;
local last_error_log_time = 0;
local last_logged_error = '';

--- Safely logs a rendering error with rate-limiting to prevent chat spam
local function log_render_error(err)
    local now = os.clock();
    local err_str = tostring(err);
    if (now - last_error_log_time > 5.0) or (err_str ~= last_logged_error) then
        print(string.format('\31\200[\31\05VanaBlu Error] %s', err_str));
        last_error_log_time = now;
        last_logged_error = err_str;
    end
end

--- Safely sets the initial/next window size
local function safe_set_window_size(w, h)
    pcall(function()
        local cond = ImGuiCond_FirstUseEver or 4;
        if not pcall(function() imgui.SetNextWindowSize({ w, h }, cond); end) then
            imgui.SetNextWindowSize(w, h, cond);
        end
    end);
end

--- Safely renders colored text adapting to table {r,g,b,a} or 5-arg signatures
local function safe_text_colored(r, g, b, a, text)
    local col_vec = { r, g, b, a };
    if pcall(function() imgui.TextColored(col_vec, text); end) then
        return;
    end
    if pcall(function() imgui.TextColored(r, g, b, a, text); end) then
        return;
    end
    pcall(function() imgui.Text(text); end);
end

--- Safely renders disabled/dimmed text with fallback to standard text
local function safe_text_disabled(text)
    if not text then return end
    if pcall(function() imgui.TextDisabled(text); end) then
        return;
    end
    safe_text_colored(0.6, 0.6, 0.65, 1.0, text);
end

--- Safely renders a button with optional width and height
local function safe_button(label, w, h)
    local clicked = false;
    if w and h then
        local ok = pcall(function() clicked = imgui.Button(label, { w, h }); end);
        if ok then return clicked; end
        ok = pcall(function() clicked = imgui.Button(label, w, h); end);
        if ok then return clicked; end
    end
    pcall(function() clicked = imgui.Button(label); end);
    return clicked;
end

--- Safely renders bullet text with fallback
local function safe_bullet_text(text)
    local ok = pcall(function() imgui.BulletText(text); end);
    if not ok then
        pcall(function() imgui.Bullet(); end);
        pcall(function() imgui.Text(text); end);
    end
end

--- Safely pushes a style color adapting to sol2 table argument {r, g, b, a}
local function safe_push_style_color(idx, r, g, b, a)
    local col_vec = { r, g, b, a };
    local ok = pcall(function() imgui.PushStyleColor(idx, col_vec); end);
    if not ok then
        ok = pcall(function() imgui.PushStyleColor(idx, r, g, b, a); end);
    end
    if ok then
        open_styles = open_styles + 1;
    end
    return ok;
end

--- Safely pops style colors and tracks open style count
local function safe_pop_style_color(count)
    count = count or 1;
    local actual_pop = math.min(count, open_styles);
    if actual_pop > 0 then
        local ok = pcall(function() imgui.PopStyleColor(actual_pop); end);
        if not ok then
            for _ = 1, actual_pop do
                pcall(function() imgui.PopStyleColor(); end);
            end
        end
        open_styles = open_styles - actual_pop;
    end
end

--- Safely renders a progress bar
local function safe_progress_bar(fraction, w, h, overlay)
    overlay = overlay or '';
    local ok = pcall(function() imgui.ProgressBar(fraction, { w, h }, overlay); end);
    if not ok then
        ok = pcall(function() imgui.ProgressBar(fraction, w, h, overlay); end);
        if not ok then
            imgui.Text(string.format('[Progress: %d%%] %s', math.floor(fraction * 100), overlay));
        end
    end
end

--- Sets a temporary user-facing status feedback notification
local function set_status(msg, is_error)
    gui.status_message = msg or '';
    gui.status_time = os.clock();
    gui.status_is_error = is_error or false;
end

-- =============================================================================
-- Core Spell Interaction Logic
-- =============================================================================

--- Handles equipping or unequipping a Blue Magic spell
local function handle_spell_click(spell_id, equipped_state, limits, learned_map, is_main)
    local can_act, target, err = model.validate_action(spell_id, equipped_state, limits, spells, learned_map[spell_id]);
    if not can_act then
        set_status(err, true);
        return;
    end

    if not backend.can_set then
        set_status('Spell setting is unavailable (signatures missing or client in read-only mode).', true);
        return;
    end

    local sinfo = spells[spell_id];
    local sname = sinfo and sinfo.name or ('Spell ' .. tostring(spell_id));

    if target.action == 'remove' then
        local ok, write_err = backend.set_spell(target.slot, 0, is_main);
        if ok then
            set_status('Removed ' .. sname .. ' from slot ' .. tostring(target.slot) .. '.', false);
        else
            set_status(write_err or 'Failed to remove spell.', true);
        end
    elseif target.action == 'set' then
        local ok, write_err = backend.set_spell(target.slot, target.spell_id, is_main);
        if ok then
            set_status('Equipped ' .. sname .. ' into slot ' .. tostring(target.slot) .. '.', false);
        else
            set_status(write_err or 'Failed to equip spell.', true);
        end
    end
end

--- Renders a hover tooltip using SetTooltip (no child window or popup leaks)
local function render_spell_tooltip(sp, is_learned, is_equipped)
    if not imgui.IsItemHovered() then return; end

    local tip = string.format(
        '%s\n--------------------\nElement: %s  |  Level: %d  |  Cost: %d BP\nStatus: %s  |  Learned: %s%s%s%s\n--------------------\nClick button to equip or unequip.',
        sp.name,
        sp.element_name or 'Unknown',
        sp.level,
        sp.cost or 0,
        is_equipped and 'Equipped' or 'Not Equipped',
        is_learned and 'Yes' or 'No',
        sp.tip_sc_text or '',
        sp.tip_eff_text or '',
        (sp.tip_proc_text or '') .. (sp.tip_noscript_text or '')
    );

    pcall(function() imgui.SetTooltip(tip); end);
end

--- Renders an individual spell action row with unique PushID scoping
local function render_spell_row(sp, equipped_state, limits, learned_map, is_main, label_override, unique_context)
    local ctx = unique_context or sp.id_str or sp.id;
    imgui.PushID(ctx);

    local is_equipped = (equipped_state.map[sp.id] ~= nil);
    local is_learned = (learned_map[sp.id] == true);
    local col = ELEMENT_COLORS[sp.elem_key or sp.element] or { 1.0, 1.0, 1.0, 1.0 };

    local btn_label = is_equipped and '[-]##btn' or '[+]##btn';
    if safe_button(btn_label, 26, 20) then
        handle_spell_click(sp.id, equipped_state, limits, learned_map, is_main);
    end

    imgui.SameLine();

    safe_text_colored(col[1], col[2], col[3], col[4], sp.elem_tag or '[???]');
    imgui.SameLine();

    local display_text = label_override or sp.default_label;

    if is_equipped then
        safe_text_colored(0.4, 1.0, 0.4, 1.0, display_text);
    elseif not is_learned then
        safe_text_colored(0.55, 0.55, 0.55, 1.0, display_text);
    elseif sp.level > limits.level then
        safe_text_colored(0.9, 0.4, 0.4, 1.0, display_text);
    else
        imgui.Text(display_text);
    end

    render_spell_tooltip(sp, is_learned, is_equipped);

    imgui.PopID();
end

-- =============================================================================
-- Tab Views
-- =============================================================================

--- Tab 1: Job Traits Explorer
local function render_traits_view(equipped_state, limits, learned_map, is_main)
    imgui.TextDisabled('Expand traits to view contributing spells and active tier thresholds.');
    imgui.Separator();

    for _, tr in ipairs(trait_list) do
        local eval = model.evaluate_trait(tr, equipped_state.map, limits.gifts);
        -- Use ### operator so Dear ImGui keeps the header expanded even when points/title change
        local title = string.format('%s  [Pts: %d%s]###trait_header_%s',
            tr.name,
            eval.current_points,
            eval.is_active and (' | Active: ' .. tostring(eval.active_tier_val)) or '',
            tr.name
        );

        if imgui.CollapsingHeader(title) then
            imgui.Indent(14);

            if eval.retail then
                safe_text_colored(1.0, 0.75, 0.3, 1.0, 'This trait is not in the public server code: tiers are converted from retail and may not apply on this server.');
            end

            -- Tiers summary (active tier in brackets; JP = only reachable through the Job Point gift)
            local tier_items = {};
            for idx, t in ipairs(eval.tiers) do
                local tag = t.jp_only and string.format('JP: %s', t.text) or string.format('%d pts: %s', t.points, t.text);
                if idx == eval.active_tier_index then
                    tag = '[' .. tag .. ']';
                end
                table.insert(tier_items, tag);
            end
            safe_text_colored(0.8, 0.85, 0.95, 1.0, 'Tiers: ' .. table.concat(tier_items, '  ->  '));
            if eval.boosted then
                safe_text_colored(0.4, 1.0, 0.4, 1.0, 'Raised one tier by the Job Point gift (Lv.99 BLU with 100+ JP spent).');
            end

            if eval.points_needed then
                safe_text_colored(0.4, 0.8, 1.0, 1.0, string.format('Next Tier: %d pts needed (%d/%d)', eval.points_needed, eval.current_points, eval.next_threshold));
            else
                safe_text_colored(0.4, 1.0, 0.4, 1.0, 'Highest tier reachable with spell points reached.');
            end

            imgui.Spacing();
            imgui.Text('Contributing Blue Magic Spells:');
            for _, sp in ipairs(tr.spells) do
                local full_sp = spells[sp.id];
                if full_sp then
                    render_spell_row(full_sp, equipped_state, limits, learned_map, is_main, sp.row_label, sp.row_ctx);
                end
            end

            imgui.Unindent(14);
            imgui.Spacing();
        end
    end
end

--- Tab 2: Utility & Buffs
local function render_utility_view(equipped_state, limits, learned_map, is_main)
    imgui.TextDisabled('Spells organized by beneficial buffs, dispels, and enfeeblements.');
    imgui.Separator();

    for _, cat in ipairs(utility_categories) do
        local cat_spells = cat.spells or {};
        if #cat_spells > 0 then
            if imgui.CollapsingHeader(cat.header) then
                imgui.Indent(14);
                local cat_name = cat.name;
                for _, sp in ipairs(cat_spells) do
                    local ctx = (sp.ut_ctx and sp.ut_ctx[cat_name]) or ('ut_' .. cat_name .. '_' .. sp.id);
                    render_spell_row(sp, equipped_state, limits, learned_map, is_main, nil, ctx);
                end
                imgui.Unindent(14);
                imgui.Spacing();
            end
        end
    end
end

--- Tab 3: Damage & Skillchains
local function render_damage_view(equipped_state, limits, learned_map, is_main)
    imgui.TextDisabled('Physical skillchain properties and elemental nuking spells.');
    imgui.Separator();

    if imgui.CollapsingHeader('--- Physical Skillchain Properties ---###sc_section') then
        imgui.Indent(12);
        for _, sc_cat in ipairs(skillchain_categories) do
            local sc_spells = sc_cat.spells or {};
            if #sc_spells > 0 then
                if imgui.CollapsingHeader(sc_cat.header) then
                    imgui.Indent(10);
                    local sc_name = sc_cat.name;
                    for _, sp in ipairs(sc_spells) do
                        local ctx = (sp.sc_ctx and sp.sc_ctx[sc_name]) or ('sc_' .. sc_name .. '_' .. sp.id);
                        render_spell_row(sp, equipped_state, limits, learned_map, is_main, sp.sc_desc, ctx);
                    end
                    imgui.Unindent(10);
                end
            end
        end
        imgui.Unindent(12);
    end

    imgui.Spacing();

    if imgui.CollapsingHeader('--- Elemental Nukes ---###nuke_section') then
        imgui.Indent(12);
        for _, nuke_cat in ipairs(elemental_nukes) do
            local nuke_spells = nuke_cat.spells or {};
            if #nuke_spells > 0 then
                if imgui.CollapsingHeader(nuke_cat.header) then
                    imgui.Indent(10);
                    local nk_name = nuke_cat.name;
                    for _, sp in ipairs(nuke_spells) do
                        local ctx = (sp.nk_ctx and sp.nk_ctx[nk_name]) or ('nk_' .. nk_name .. '_' .. sp.id);
                        render_spell_row(sp, equipped_state, limits, learned_map, is_main, nil, ctx);
                    end
                    imgui.Unindent(10);
                end
            end
        end
        imgui.Unindent(12);
    end
end

--- Tab 4: Weakness Procs
local function render_procs_view(equipped_state, limits, learned_map, is_main)
    imgui.TextDisabled('Abyssea: spells that trigger yellow (magic) weaknesses on this server. Voidwatch: retail reference only (not in the server code).');
    imgui.Separator();

    for _, cat in ipairs(proc_categories) do
        local proc_spells = cat.spells or {};
        if #proc_spells > 0 then
            if imgui.CollapsingHeader(cat.header) then
                imgui.Indent(14);
                local pr_name = cat.name;
                for _, sp in ipairs(proc_spells) do
                    local ctx = (sp.pr_ctx and sp.pr_ctx[pr_name]) or ('pr_' .. pr_name .. '_' .. sp.id);
                    render_spell_row(sp, equipped_state, limits, learned_map, is_main, nil, ctx);
                end
                imgui.Unindent(14);
                imgui.Spacing();
            end
        end
    end
end

--- Tab 5: Complete Spells Database
local function render_all_spells_view(equipped_state, limits, learned_map, is_main)
    -- High-visibility styling for search box and filter checkboxes
    safe_push_style_color(ImGuiCol_FrameBg or 7, 0.16, 0.22, 0.35, 1.0);
    safe_push_style_color(ImGuiCol_FrameBgHovered or 8, 0.24, 0.35, 0.55, 1.0);
    safe_push_style_color(ImGuiCol_FrameBgActive or 9, 0.28, 0.42, 0.68, 1.0);
    safe_push_style_color(ImGuiCol_CheckMark or 18, 0.30, 1.0, 0.45, 1.0);
    safe_push_style_color(ImGuiCol_Border or 5, 0.40, 0.65, 0.95, 0.90);

    safe_text_colored(0.85, 0.90, 1.0, 1.0, 'Search:');
    imgui.SameLine();
    pcall(function()
        imgui.PushItemWidth(140);
        imgui.InputText('##db_search', gui.search_query, 64);
        imgui.PopItemWidth();
    end);

    imgui.SameLine();
    safe_push_style_color(ImGuiCol_Text or 0, 0.60, 1.0, 0.60, 1.0);
    pcall(function() imgui.Checkbox('Learned only##db_l', gui.filter_learned_only); end);
    safe_pop_style_color(1);

    imgui.SameLine();
    safe_push_style_color(ImGuiCol_Text or 0, 0.75, 0.90, 1.0, 1.0);
    pcall(function() imgui.Checkbox('My Level only##db_lvl', gui.filter_my_level_only); end);
    safe_pop_style_color(1);

    safe_pop_style_color(5);

    imgui.Separator();

    local query = (gui.search_query[1] or ''):lower();
    local matched_count = 0;
    for _, sp in ipairs(ordered_spells) do
        local is_learned = (learned_map[sp.id] == true);
        local matches_search = (query == '') or sp.name:lower():find(query, 1, true);
        local matches_learned = not gui.filter_learned_only[1] or is_learned;
        local matches_level = not gui.filter_my_level_only[1] or (sp.level <= limits.level);

        if matches_search and matches_learned and matches_level then
            matched_count = matched_count + 1;
            render_spell_row(sp, equipped_state, limits, learned_map, is_main, nil, sp.all_ctx);
        end
    end

    if matched_count == 0 then
        imgui.TextDisabled('No Blue Magic spells match the active search and filter criteria.');
    end
end

--- Tab 6: Spell Tracker (learning sources for VanaDreams)
-- Data comes from res/hunting.lua via tracker.lua: zones are matched by zone id, and while you are in
-- a listed zone each monster line shows the distance/direction to its nearest known spawn point.
local function render_spell_tracker_view(equipped_state, limits, learned_map, is_main, player_data)
    local entries = tracker.entries;
    local total_count = #entries;
    local learned_count = gui.cached_learned_count or 0;

    local progress_pct = (total_count > 0) and (learned_count / total_count) or 0;
    safe_progress_bar(progress_pct, -1, 22, string.format('Learned Spells: %d / %d (%.1f%%)', learned_count, total_count, progress_pct * 100));

    -- Player Blue Magic skill (for the per-spell skill requirement)
    local my_skill = nil;
    if player_data and player_data.player then
        my_skill = tracker.blue_magic_skill(player_data.player);
    end
    imgui.Spacing();

    -- High-visibility styling for search box and filter checkboxes
    safe_push_style_color(ImGuiCol_FrameBg or 7, 0.16, 0.22, 0.35, 1.0);
    safe_push_style_color(ImGuiCol_FrameBgHovered or 8, 0.24, 0.35, 0.55, 1.0);
    safe_push_style_color(ImGuiCol_FrameBgActive or 9, 0.28, 0.42, 0.68, 1.0);
    safe_push_style_color(ImGuiCol_CheckMark or 18, 0.30, 1.0, 0.45, 1.0);
    safe_push_style_color(ImGuiCol_Border or 5, 0.40, 0.65, 0.95, 0.90);

    safe_text_colored(0.85, 0.90, 1.0, 1.0, 'Search:');
    imgui.SameLine();
    pcall(function()
        imgui.PushItemWidth(125);
        imgui.InputText('##tracker_search', gui.search_query, 64);
        imgui.PopItemWidth();
    end);

    imgui.SameLine();
    local prev_l = gui.filter_learned_only[1];
    local prev_u = gui.filter_unlearned_only[1];

    safe_push_style_color(ImGuiCol_Text or 0, 0.60, 1.0, 0.60, 1.0);
    pcall(function() imgui.Checkbox('Learned only##tr_l', gui.filter_learned_only); end);
    safe_pop_style_color(1);

    imgui.SameLine();
    safe_push_style_color(ImGuiCol_Text or 0, 1.0, 0.90, 0.35, 1.0);
    pcall(function() imgui.Checkbox('Unlearned only##tr_u', gui.filter_unlearned_only); end);
    safe_pop_style_color(1);

    imgui.SameLine();
    safe_push_style_color(ImGuiCol_Text or 0, 0.75, 0.90, 1.0, 1.0);
    pcall(function() imgui.Checkbox('My Level only##tr_lvl', gui.filter_my_level_only); end);
    safe_pop_style_color(1);

    imgui.SameLine();
    safe_push_style_color(ImGuiCol_Text or 0, 0.40, 0.95, 1.0, 1.0);
    pcall(function() imgui.Checkbox('Current Zone only##tr_zone', gui.filter_current_zone_only); end);
    safe_pop_style_color(1);

    safe_pop_style_color(5);

    if not prev_l and gui.filter_learned_only[1] then
        gui.filter_unlearned_only[1] = false;
    elseif not prev_u and gui.filter_unlearned_only[1] then
        gui.filter_learned_only[1] = false;
    end

    -- Current zone (by id) or manual override (/vanablu zone <name>)
    local override = gui.override_zone_name ~= '' and gui.override_zone_name or nil;
    local cur_zone_id = (player_data and player_data.zone_id) or gui.cached_zone_id or 0;
    local cur_zone_name = override or tracker.zone_name(cur_zone_id ~= 0 and cur_zone_id or nil,
        (player_data and player_data.zone_name) or gui.cached_zone_name or '');
    local filter_zone = (gui.filter_current_zone_only[1] == true);

    if filter_zone then
        imgui.SameLine();
        if cur_zone_name and cur_zone_name ~= '' then
            safe_text_colored(0.4, 0.85, 1.0, 1.0, string.format('[Zone: %s]', cur_zone_name));
        else
            safe_text_colored(1.0, 0.65, 0.2, 1.0, '[Zone: Unknown]');
        end
    end

    imgui.Separator();

    local query = (gui.search_query[1] or ''):lower();
    local matched_count = 0;
    local px, py = nil, nil; -- player position, read lazily once per frame if needed

    for _, e in ipairs(entries) do
        local is_learned = (learned_map[e.id] == true);
        local matches_search = (query == '') or e.name:lower():find(query, 1, true);
        local matches_learned = true;
        if gui.filter_learned_only[1] and not is_learned then matches_learned = false; end
        if gui.filter_unlearned_only[1] and is_learned then matches_learned = false; end
        local matches_level = not gui.filter_my_level_only[1] or (e.level <= limits.level);
        local matches_zone = (not filter_zone) or tracker.in_zone(e, cur_zone_id, override);

        if matches_search and matches_learned and matches_level and matches_zone then
            matched_count = matched_count + 1;
            local header_label = is_learned and e.header_learned or e.header_unlearned;

            if is_learned then
                safe_push_style_color(ImGuiCol_Text or 0, 0.4, 1.0, 0.4, 1.0);
            elseif e.status == 'unavailable' then
                safe_push_style_color(ImGuiCol_Text or 0, 0.6, 0.6, 0.6, 1.0);
            else
                safe_push_style_color(ImGuiCol_Text or 0, 1.0, 0.85, 0.2, 1.0);
            end
            local is_expanded = imgui.CollapsingHeader(header_label);
            safe_pop_style_color(1);

            if is_expanded then
                imgui.Indent(14);
                local sp = e.sp;

                if e.banner then
                    safe_text_colored(1.0, 0.45, 0.35, 1.0, e.banner);
                end

                safe_text_colored(0.95, 0.95, 0.95, 1.0, e.summary);

                -- Skill requirement (server rule: skill >= cap for the spell's level - 29)
                if e.skill then
                    if my_skill then
                        local ok = my_skill >= e.skill;
                        local col = ok and { 0.4, 1.0, 0.4 } or { 1.0, 0.45, 0.45 };
                        safe_text_colored(col[1], col[2], col[3], 1.0, string.format(
                            'Blue Magic skill needed to learn: %d   (yours: %d%s)', e.skill, my_skill,
                            ok and '' or ' - too low, gear bonuses count'));
                    else
                        safe_text_colored(0.85, 0.85, 0.85, 1.0, string.format('Blue Magic skill needed to learn: %d', e.skill));
                    end
                end

                if e.attributes then safe_text_colored(0.9, 0.85, 0.4, 1.0, e.attributes); end
                if sp then
                    safe_text_colored(0.5, 0.85, 1.0, 1.0, sp.tracker_traits or 'Job Traits: None');
                    if sp.tracker_skillchain then safe_text_colored(0.8, 0.7, 1.0, 1.0, sp.tracker_skillchain); end
                    if sp.tracker_effects then safe_text_colored(0.7, 0.95, 0.7, 1.0, sp.tracker_effects); end
                    if sp.tracker_procs then safe_text_colored(1.0, 0.7, 0.4, 1.0, sp.tracker_procs); end
                end

                for _, note in ipairs(e.notes) do
                    safe_text_colored(1.0, 0.8, 0.35, 1.0, 'Note: ' .. note);
                end
                if e.extra_text then
                    safe_text_disabled(e.extra_text);
                end

                -- Action button: Equip or Unequip (settable spells only)
                if e.settable and sp then
                    local is_equipped = (equipped_state and equipped_state.map and (equipped_state.map[e.id] ~= nil)) or false;
                    if is_equipped then
                        safe_push_style_color(ImGuiCol_Button or 21, 0.7, 0.2, 0.2, 1.0);
                        if safe_button('Unequip Spell##tr_act_' .. e.id, 120, 22) then
                            handle_spell_click(e.id, equipped_state, limits, learned_map, is_main);
                        end
                        safe_pop_style_color(1);
                    elseif is_learned then
                        safe_push_style_color(ImGuiCol_Button or 21, 0.2, 0.6, 0.2, 1.0);
                        if safe_button('Equip Spell##tr_act_' .. e.id, 120, 22) then
                            handle_spell_click(e.id, equipped_state, limits, learned_map, is_main);
                        end
                        safe_pop_style_color(1);
                    end
                end

                imgui.Spacing();
                safe_text_colored(0.4, 0.8, 1.0, 1.0, e.zones_header);
                imgui.Separator();

                if #e.zones == 0 then
                    safe_text_disabled('No learning locations on this server.');
                else
                    for _, z in ipairs(e.zones) do
                        local is_here = tracker.is_current(z, cur_zone_id, override);
                        if is_here then
                            safe_push_style_color(ImGuiCol_Text or 0, 0.4, 0.95, 1.0, 1.0);
                        end
                        local z_expanded = imgui.CollapsingHeader(is_here and z.header_current or z.header);
                        if is_here then
                            safe_pop_style_color(1);
                        end

                        if z_expanded then
                            imgui.Indent(14);
                            if is_here and not override and not px then
                                px, py = tracker.player_position();
                            end
                            for _, m in ipairs(z.mobs) do
                                local text = m.text;
                                if is_here and px then
                                    local dist, dir = tracker.nearest(m, px, py);
                                    if dist then
                                        text = string.format('%s  |  nearest known spawn: ~%d yalms %s', text, math.floor(dist + 0.5), dir);
                                    end
                                end
                                if m.conf == 'unverified' then
                                    safe_push_style_color(ImGuiCol_Text or 0, 0.65, 0.65, 0.65, 1.0);
                                    safe_bullet_text(text);
                                    safe_pop_style_color(1);
                                else
                                    safe_bullet_text(text);
                                end
                            end
                            if z.more then
                                safe_text_disabled(string.format('...and %d more monster type%s in this zone.', z.more, z.more == 1 and '' or 's'));
                            end
                            imgui.Unindent(14);
                            imgui.Spacing();
                        end
                    end
                end

                imgui.Unindent(14);
                imgui.Spacing();
            end
        end
    end

    if matched_count == 0 then
        if filter_zone and cur_zone_name ~= '' then
            safe_text_disabled(string.format('No Blue Magic spells can be learned in "%s" with the active filters.', cur_zone_name));
        else
            safe_text_disabled('No Blue Magic spells match the active tracker filter criteria.');
        end
    end
end

--- Tab 7: Saved Sets View
local function render_saved_sets_view(equipped_state, limits, learned_map, is_main)
    safe_text_colored(0.95, 0.85, 0.3, 1.0, 'Saved Spell Sets Manager');
    imgui.SameLine();
    imgui.TextDisabled('- Save, manage, and instantly swap custom spell configurations');
    imgui.Separator();

    -- Show active set equipping banner if in progress
    if backend.is_equipping_set then
        safe_text_colored(0.4, 0.8, 1.0, 1.0, string.format('Equipping "%s"... (%d changes remaining)', backend.equip_set_name, #backend.equip_queue));
        imgui.SameLine();
        if safe_button('Cancel##cancel_equip_btn', 80, 20) then
            backend.cancel_equip();
            set_status('Equip operation cancelled.', true);
        end
        imgui.Separator();
    end

    -- Save Current Set Section
    imgui.Text('Save Current Configuration:');
    safe_push_style_color(ImGuiCol_FrameBg or 7, 0.16, 0.22, 0.35, 1.0);
    safe_push_style_color(ImGuiCol_FrameBgHovered or 8, 0.24, 0.35, 0.55, 1.0);
    safe_push_style_color(ImGuiCol_FrameBgActive or 9, 0.28, 0.42, 0.68, 1.0);
    safe_push_style_color(ImGuiCol_Border or 5, 0.40, 0.65, 0.95, 0.90);
    pcall(function()
        imgui.PushItemWidth(220);
        imgui.InputText('##new_set_name_input', gui.new_set_name, 64);
        imgui.PopItemWidth();
    end);
    safe_pop_style_color(4);
    imgui.SameLine();

    local save_btn_label = 'Save Current Set##btn_save_set';
    if safe_button(save_btn_label, 150, 24) then
        local raw_name = gui.new_set_name[1] or '';
        local set_name = raw_name:match('^%s*(.-)%s*$');
        if not set_name or set_name == '' then
            set_status('Please enter a name for the new spell set.', true);
        elseif equipped_state.count == 0 then
            set_status('Cannot save an empty set. Equip spells first.', true);
        else
            -- Collect all currently equipped spell IDs in slot order
            local set_spells = {};
            for slot = 1, limits.slots do
                local sp_id = equipped_state.slots[slot];
                if sp_id and sp_id > 0 then
                    table.insert(set_spells, sp_id);
                end
            end

            gui.saved_sets[set_name] = {
                name = set_name,
                spells = set_spells,
                total_bp = equipped_state.points_spent,
                saved_at = os.time(),
            };

            save_saved_sets(gui.saved_sets);
            set_status(string.format('Saved set "%s" with %d spells (%d BP).', set_name, #set_spells, equipped_state.points_spent), false);
            gui.new_set_name[1] = '';
        end
    end

    safe_text_disabled(string.format('Currently Equipped: %d / %d slots | %d / %d BP',
        equipped_state.count, limits.slots, equipped_state.points_spent, limits.points));
    imgui.Separator();

    -- List of Saved Sets (uses cached sorted names list to eliminate per-frame table re-allocation)
    imgui.Text('Saved Configurations:');
    if gui.saved_sets_dirty then
        gui.sorted_set_names = {};
        for name in pairs(gui.saved_sets or {}) do
            table.insert(gui.sorted_set_names, name);
        end
        table.sort(gui.sorted_set_names);
        gui.saved_sets_dirty = false;
    end
    local sorted_names = gui.sorted_set_names;

    if #sorted_names == 0 then
        imgui.Spacing();
        safe_text_disabled('No saved spell sets found. Equip your desired spells and use the form above to save your first set.');
        return;
    end

    for _, name in ipairs(sorted_names) do
        local set = gui.saved_sets[name];
        if set and set.spells then
            local set_bp = set.total_bp or model.calculate_set_bp(set.spells, spells);
            set.total_bp = set_bp;
            local equipped_count = 0;
            local unlearned_count = 0;
            local highest_level = 0;

            for _, sp_id in ipairs(set.spells) do
                if equipped_state.map[sp_id] then
                    equipped_count = equipped_count + 1;
                end
                if learned_map[sp_id] == false then
                    unlearned_count = unlearned_count + 1;
                end
                local sp = spells[sp_id];
                if sp and sp.level > highest_level then
                    highest_level = sp.level;
                end
            end

            local is_active = (equipped_count == #set.spells and equipped_state.count == #set.spells);
            local status_tag = '';
            if is_active then
                status_tag = '  [ACTIVE]';
            elseif equipped_count > 0 then
                status_tag = string.format('  [%d/%d Equipped]', equipped_count, #set.spells);
            end

            -- Color the header if fully active
            if is_active then
                safe_push_style_color(ImGuiCol_Text or 0, 0.4, 1.0, 0.4, 1.0);
            end

            local header_label = string.format('%s  (%d Spells, %d BP)%s###saved_set_hdr_%s',
                name, #set.spells, set_bp, status_tag, name);
            local is_expanded = imgui.CollapsingHeader(header_label);

            if is_active then
                safe_pop_style_color(1);
            end

            if is_expanded then
                imgui.Indent(14);
                imgui.PushID('saved_set_card_' .. name);

                -- Action Buttons Row: [Load / Equip Set] [Update Set] [Delete Set]
                local is_this_equipping = (backend.is_equipping_set and backend.equip_set_name == name);
                local eq_btn_label = is_this_equipping and 'Loading Set...##btn_eq' or 'Load / Equip Set##btn_eq';

                if safe_button(eq_btn_label, 140, 24) then
                    if not backend.is_equipping_set then
                        if not backend.can_set then
                            set_status('Spell setting is unavailable (signatures missing or client in read-only mode).', true);
                        else
                            -- Filter target spells to learned and level-eligible spells
                            local valid_target = {};
                            local skipped_count = 0;
                            for _, sp_id in ipairs(set.spells) do
                                local sp = spells[sp_id];
                                if sp then
                                    if learned_map[sp_id] == false or sp.level > limits.level then
                                        skipped_count = skipped_count + 1;
                                    else
                                        table.insert(valid_target, sp_id);
                                    end
                                end
                            end

                            if #valid_target == 0 and #set.spells > 0 then
                                set_status('Cannot equip set: no learned spells in this set meet your level requirements.', true);
                            else
                                local diff = model.diff_set(valid_target, equipped_state.slots, limits.slots);
                                if #diff == 0 then
                                    set_status(string.format('Set "%s" is already equipped.', name), false);
                                else
                                    local ok, msg = backend.start_equip_set(valid_target, name, is_main, equipped_state.slots);
                                    if ok and skipped_count > 0 then
                                        msg = string.format('%s (Skipped %d unlearned/over-level spells)', msg, skipped_count);
                                    end
                                    set_status(msg, not ok);
                                end
                            end
                        end
                    end
                end

                imgui.SameLine();

                if safe_button('Update Set##btn_upd', 110, 24) then
                    if equipped_state.count == 0 then
                        set_status('Cannot update set: you have no spells equipped.', true);
                    else
                        local updated_spells = {};
                        for slot = 1, limits.slots do
                            local sp_id = equipped_state.slots[slot];
                            if sp_id and sp_id > 0 then
                                table.insert(updated_spells, sp_id);
                            end
                        end
                        set.spells = updated_spells;
                        set.total_bp = equipped_state.points_spent;
                        set.updated_at = os.time();
                        set.cached_trait_str = nil;
                        set.cached_gifts = nil;
                        save_saved_sets(gui.saved_sets);
                        set_status(string.format('Updated set "%s" with %d currently equipped spells (%d BP).', name, #updated_spells, equipped_state.points_spent), false);
                    end
                end

                imgui.SameLine();

                if safe_button('Delete Set##btn_del', 100, 24) then
                    gui.saved_sets[name] = nil;
                    save_saved_sets(gui.saved_sets);
                    set_status(string.format('Deleted set "%s".', name), false);
                end

                -- Summary & Trait Info (cached on set to eliminate 35 trait evaluations per frame)
                if not set.cached_trait_str or set.cached_gifts ~= limits.gifts then
                    local set_traits = model.get_set_traits(set.spells, traits, limits.gifts);
                    if #set_traits > 0 then
                        local trait_names = {};
                        for _, t in ipairs(set_traits) do
                            table.insert(trait_names, string.format('%s (%s)', t.name, tostring(t.active_tier_val or 'I')));
                        end
                        set.cached_trait_str = 'Job Traits: ' .. table.concat(trait_names, ', ');
                    else
                        set.cached_trait_str = 'No active job traits formed by this set.';
                    end
                    set.cached_gifts = limits.gifts;
                end

                if set.cached_trait_str:sub(1, 10) == 'Job Traits' then
                    safe_text_colored(0.4, 0.85, 0.95, 1.0, set.cached_trait_str);
                else
                    safe_text_disabled(set.cached_trait_str);
                end

                if unlearned_count > 0 then
                    safe_text_colored(1.0, 0.45, 0.45, 1.0, string.format('Notice: %d spell(s) in this set are not learned yet.', unlearned_count));
                end
                if set_bp > limits.points then
                    safe_text_colored(1.0, 0.4, 0.4, 1.0, string.format('Warning: Set requires %d BP (exceeds current limit of %d BP).', set_bp, limits.points));
                end
                if #set.spells > limits.slots then
                    safe_text_colored(1.0, 0.7, 0.2, 1.0, string.format('Warning: Set contains %d spells (current slot limit is %d).', #set.spells, limits.slots));
                end

                imgui.Separator();
                imgui.TextDisabled(string.format('Assigned Spells (%d):', #set.spells));

                for _, sp_id in ipairs(set.spells) do
                    local sp = spells[sp_id];
                    if sp then
                        render_spell_row(sp, equipped_state, limits, learned_map, is_main, nil, 'set_' .. name .. '_' .. sp.id);
                    else
                        imgui.Text(string.format('Unknown Spell ID %d', sp_id));
                    end
                end

                imgui.PopID();
                imgui.Unindent(14);
                imgui.Spacing();
            end
        end
    end
end

--- Tab 8: Documentation & Help
local function render_help_view()
    safe_text_colored(0.95, 0.85, 0.3, 1.0, 'VanaBlu for Ashita v4 - Documentation');
    imgui.Separator();

    imgui.Text('Commands:');
    safe_bullet_text('/vanablu, /vanab, or /vb : Toggle this interface open and closed.');
    safe_bullet_text('/vanablu show : Display the interface window.');
    safe_bullet_text('/vanablu hide : Hide the interface window.');
    safe_bullet_text('/vanablu unsetall : Unset all currently equipped Blue Magic spells.');
    safe_bullet_text('/vanablu set <setname> or /vanablu load <setname> : Equip/load a saved spell set.');
    safe_bullet_text('/vanablu save <setname> : Save current spells as a named set.');
    safe_bullet_text('/vanablu delete <setname> : Delete a saved spell set.');
    safe_bullet_text('/vanablu list : List all saved spell sets.');
    safe_bullet_text('/vanablu help : Print available commands to chat log.');

    imgui.Spacing();
    imgui.Text('How Setting Spells Works:');
    safe_bullet_text('Click [+] next to any spell to set it in your first free spell slot.');
    safe_bullet_text('Click [-] or [X] on an equipped spell to remove it.');
    safe_bullet_text('Spell changes use the game client native memory routine with built-in cooldowns.');
    safe_bullet_text('If your client uses custom signatures, VanaBlu operates in Read-Only Reference Mode.');
    safe_bullet_text('Spell Tracker tab: every spell learnable on this server (including Unbridled Learning spells), with learned status and the monsters/zones that teach it.');
    safe_bullet_text('Saved Sets tab: Save and name custom spell configurations with one-click equip, update, and delete actions.');
    safe_bullet_text('Saved sets are stored in Ashita\\config\\addons\\vanablu\\saved_sets.lua and are kept when the addon is updated.');

    imgui.Spacing();
    imgui.Text('Learning Blue Magic (server rules):');
    safe_bullet_text('Blue Mage must be your MAIN job, alive, and in the same party/alliance as whoever claimed the monster.');
    safe_bullet_text('The monster must actually finish using the move during the fight, and you must be nearby when it dies.');
    safe_bullet_text('Your Blue Magic skill (gear bonuses count) must be within 29 of the skill cap for the spell\'s level.');
    safe_bullet_text('Base chance is 33% per kill. Only one learning attempt is made per kill, even if the monster used several learnable moves.');
    safe_bullet_text('No learning if someone called for help. If the monster regains full HP, the moves it used are forgotten.');
    safe_bullet_text('"Too Weak" monsters can still teach spells (no experience requirement).');
    safe_bullet_text('In the tracker, "nearest known spawn" shows the distance/direction to the closest spawn point while you are in that zone.');
    safe_bullet_text('Entries marked "location from wiki" or "UNVERIFIED" are not confirmed for this server.');

    imgui.Spacing();
    imgui.Text('Job Traits & Gifts:');
    safe_bullet_text('Traits automatically update in real-time as spells are equipped or unequipped.');
    safe_bullet_text('Trait points follow the server: most spells add 1 point and level-99 spells add 2. Tiers unlock at the listed point totals.');
    safe_bullet_text('Main-job BLU at level 99 with 100+ Job Points spent gets +1 tier on every active trait (Job Point gift).');
    safe_bullet_text('That bonus can reach tiers marked "JP" and turns Double Attack into Triple Attack and Gilfinder into Treasure Hunter.');
    safe_bullet_text('Traits or spells marked "retail" are not in the public server code and may not apply on this server.');
end

-- =============================================================================
-- Left Sidebar: Equipped Spells & Capacity Meters
-- =============================================================================
local function render_equipped_sidebar(equipped_state, limits, learned_map, is_main)
    safe_text_colored(0.95, 0.85, 0.3, 1.0, 'Equipped Blue Magic');
    imgui.Separator();

    -- Capacity meters
    local slot_fraction = limits.slots > 0 and (equipped_state.count / limits.slots) or 0;
    imgui.Text(string.format('Slots: %d / %d', equipped_state.count, limits.slots));
    safe_progress_bar(slot_fraction, -1, 14);

    local points_fraction = limits.points > 0 and (equipped_state.points_spent / limits.points) or 0;
    imgui.Text(string.format('Set Points: %d / %d', equipped_state.points_spent, limits.points));
    safe_progress_bar(points_fraction, -1, 14);

    local job_label = limits.is_main and 'Main Job' or 'Support Job';
    if (limits.bonus_points or 0) > 0 then
        imgui.TextDisabled(string.format('%s Lv.%d (+%d Bonus BP)', job_label, limits.level, limits.bonus_points));
    else
        imgui.TextDisabled(string.format('%s Lv.%d', job_label, limits.level));
    end
    if imgui.IsItemHovered() then
        local src = (limits.points_source == 'client') and 'read from the game client'
            or 'calculated (game client value unavailable)';
        pcall(function()
            imgui.SetTooltip(string.format(
                'Set Points: %d (%s)\nBase (level): %d\nAssimilation merits: +%d\nBlue Magic Point Bonus (JP): %s',
                limits.points, src, limits.base_points or 0, limits.merit_points or 0,
                backend.jp_bp_bonus and ('+' .. tostring(limits.jp_points or 0)) or 'not received yet'));
        end);
    end

    -- If the game client's total is unavailable at Lv.99 and the job point rank has not been
    -- received yet, the calculated maximum may be missing up to 20 BP. Tell the player how to fix it.
    if limits.is_main and limits.level == 99 and limits.points_source ~= 'client'
        and backend.jp_bp_bonus == nil and (limits.jp_spent or 0) > 0 then
        safe_text_colored(1.0, 0.75, 0.3, 1.0, 'Set Points may be low: open the in-game');
        safe_text_colored(1.0, 0.75, 0.3, 1.0, 'Job Points or Set Blue Magic menu once.');
    end

    imgui.Separator();

    -- Unset All Button (Maps to native "(Remove all spells)" and queued frame pump)
    local unset_btn_text = backend.is_unsetting and 'Clearing Spells...##btn_unset_all' or 'Unset All Spells##btn_unset_all';
    if safe_button(unset_btn_text, -1, 24) then
        if not backend.is_unsetting then
            if backend.can_set then
                local ok, msg = backend.unset_all(is_main, equipped_state.slots);
                if ok then
                    set_status(msg or 'Clearing all equipped spell slots...', false);
                else
                    set_status(msg or 'Failed to clear spell slots.', true);
                end
            else
                set_status('Spell setting is unavailable.', true);
            end
        end
    end

    imgui.Separator();

    -- Equipped slots list (rendered directly in column with PushID scoping)
    for slot = 1, limits.slots do
        imgui.PushID(SLOT_PUSH_IDS[slot] or ('eq_slot_' .. tostring(slot)));
        local sp_id = equipped_state.slots[slot];
        if sp_id and sp_id > 0 and spells[sp_id] then
            local sp = spells[sp_id];
            local col = ELEMENT_COLORS[sp.elem_key or sp.element] or { 1.0, 1.0, 1.0, 1.0 };

            if safe_button('[X]##eq_btn', 24, 18) then
                handle_spell_click(sp.id, equipped_state, limits, learned_map, is_main);
            end
            imgui.SameLine();

            safe_text_colored(col[1], col[2], col[3], col[4], string.format('%2d. %s (%d)', slot, sp.name, sp.cost or 0));
            render_spell_tooltip(sp, true, true);
        else
            imgui.TextDisabled(EMPTY_SLOT_LABELS[slot] or string.format('%2d. [Empty]', slot));
        end
        imgui.PopID();
    end
end

-- =============================================================================
-- Right Content: Navigation Tabs & Selected View
-- =============================================================================
local function render_navigation_and_content(equipped_state, limits, learned_map, is_main, player_data)
    -- Universal Navigation Buttons (100% reliable across all Ashita v4 builds)
    for idx, tab_name in ipairs(NAV_TABS) do
        local is_active = (gui.active_tab == tab_name);
        if is_active then
            safe_push_style_color(ImGuiCol_Button or 21, 0.2, 0.45, 0.85, 1.0);
            safe_push_style_color(ImGuiCol_ButtonHovered or 22, 0.3, 0.55, 0.95, 1.0);
            safe_push_style_color(ImGuiCol_ButtonActive or 23, 0.15, 0.35, 0.75, 1.0);
        end

        local btn_lbl = is_active and TAB_BUTTON_LABELS_ACTIVE[tab_name] or TAB_BUTTON_LABELS_INACTIVE[tab_name];
        if safe_button(btn_lbl, 0, 24) then
            gui.active_tab = tab_name;
        end

        if is_active then
            safe_pop_style_color(3);
        end

        if idx < #NAV_TABS then
            imgui.SameLine();
        end
    end

    imgui.Separator();

    -- Render the active view directly in the column
    if gui.active_tab == 'Traits' then
        render_traits_view(equipped_state, limits, learned_map, is_main);
    elseif gui.active_tab == 'Utility' then
        render_utility_view(equipped_state, limits, learned_map, is_main);
    elseif gui.active_tab == 'Damage' then
        render_damage_view(equipped_state, limits, learned_map, is_main);
    elseif gui.active_tab == 'Procs' then
        render_procs_view(equipped_state, limits, learned_map, is_main);
    elseif gui.active_tab == 'All Spells' then
        render_all_spells_view(equipped_state, limits, learned_map, is_main);
    elseif gui.active_tab == 'Spell Tracker' then
        render_spell_tracker_view(equipped_state, limits, learned_map, is_main, player_data);
    elseif gui.active_tab == 'Saved Sets' then
        render_saved_sets_view(equipped_state, limits, learned_map, is_main);
    elseif gui.active_tab == 'Help' then
        render_help_view();
    end
end

-- =============================================================================
-- Main Direct3D Presentation Loop (Ashita v4 Event)
-- =============================================================================
ashita.events.register('d3d_present', 'vanablu_present_cb', function()
    -- Lightweight Optimization: If window is closed and no background queue is active,
    -- skip all memory polling and rendering entirely to consume zero idle CPU cycles.
    local is_busy = backend.is_unsetting or backend.is_equipping_set;
    if not gui.is_open[1] and not is_busy then
        return;
    end

    -- Lazy initialization of backend scanning
    if not backend.is_initialized then
        backend.init();
    end

    -- Read player state once per frame if backend is active
    local player_data, err = nil, nil;
    if backend.is_initialized then
        pcall(function()
            player_data, err = backend.read();
        end);
    end

    -- Service active asynchronous queues (runs even if UI is closed so operations finish cleanly)
    if backend.is_initialized then
        local is_m = (player_data and player_data.is_main ~= nil) and player_data.is_main or true;

        if backend.is_unsetting then
            local r_slots = player_data and player_data.raw or nil;
            local finished, msg = backend.tick_unset_queue(is_m, r_slots);
            if finished and msg then
                set_status(msg, false);
            end
        end

        if backend.is_equipping_set then
            local finished, msg = backend.tick_equip_queue(is_m);
            if finished and msg then
                set_status(msg, false);
            end
        end
    end

    -- If interface is closed, exit early without invoking ImGui
    if not gui.is_open[1] then
        return;
    end

    -- Set default initial window size
    safe_set_window_size(1020, 640);

    local window_title = WINDOW_TITLE;
    local window_open = false;

    -- Reset per-frame tracking
    open_styles = 0;

    local render_ok, render_err = pcall(function()
        window_open = imgui.Begin(window_title, gui.is_open);
        if not window_open then
            return;
        end

        -- Character state loading guard
        if not player_data or not player_data.ready then
            local msg = err or (player_data and player_data.message) or 'Waiting for Blue Mage character data...';
            safe_text_colored(1.0, 0.6, 0.2, 1.0, msg);
            imgui.Spacing();
            if safe_button('Manual Refresh##retry_mem', 140, 26) then
                backend.init();
                gui.cached_learned_map = nil;
                gui.cached_limits = nil;
                gui.cached_equipped_state = nil;
                gui.last_raw_buf = nil;
            end
            return;
        end

        -- Compute or reuse cached character capacity limits
        local cur_lvl = player_data.level or 1;
        local cur_main = (player_data.is_main == true);
        local cur_assim = player_data.assimilation or 0;
        local cur_bp = player_data.blue_point_bonus or 0;
        local cur_jp = player_data.jp_spent or 0;
        local cur_client_max = player_data.client_max_points or 0;

        if not gui.cached_limits
            or gui.cached_lim_lvl ~= cur_lvl
            or gui.cached_lim_main ~= cur_main
            or gui.cached_lim_assim ~= cur_assim
            or gui.cached_lim_bp ~= cur_bp
            or gui.cached_lim_jp ~= cur_jp
            or gui.cached_lim_client_max ~= cur_client_max then

            gui.cached_limits = model.get_limits(cur_lvl, cur_main, cur_assim, cur_bp, cur_jp, cur_client_max);
            gui.cached_lim_lvl = cur_lvl;
            gui.cached_lim_main = cur_main;
            gui.cached_lim_assim = cur_assim;
            gui.cached_lim_bp = cur_bp;
            gui.cached_lim_jp = cur_jp;
            gui.cached_lim_client_max = cur_client_max;
        end
        local limits = gui.cached_limits;

        -- Check if client memory spell buffer changed since last frame
        local raw_buf = player_data.raw or {};
        local raw_changed = (gui.cached_equipped_state == nil or gui.last_raw_buf == nil);
        if not raw_changed then
            for i = 1, 20 do
                if (raw_buf[i] or 0) ~= (gui.last_raw_buf[i] or 0) then
                    raw_changed = true;
                    break;
                end
            end
        end

        if raw_changed then
            gui.cached_equipped_state = model.process_equipped(raw_buf, spells);
            if not gui.last_raw_buf then gui.last_raw_buf = {}; end
            for i = 1, 20 do
                gui.last_raw_buf[i] = raw_buf[i] or 0;
            end
        end
        local equipped_state = gui.cached_equipped_state;

        -- Cached learned spells query (invalidates every 2 seconds or on character level change)
        local now_clock = os.clock();
        if not gui.cached_learned_map or (now_clock - gui.last_learned_check > 2.0) or (player_data.level ~= gui.last_player_level) then
            -- Checks every tracker spell, including Unbridled Learning spells (a superset of res/spellinfo.lua)
            gui.cached_learned_map = backend.read_learned(player_data.player, tracker.all_ids);
            gui.last_learned_check = now_clock;
            gui.last_player_level = player_data.level;

            local count = 0;
            for _, e in ipairs(tracker.entries) do
                if gui.cached_learned_map[e.id] == true then
                    count = count + 1;
                end
            end
            gui.cached_learned_count = count;
        end
        local learned_map = gui.cached_learned_map;

        -- (Active queues are serviced once per frame at top of d3d_present)

        -- Top status bar / notification banner
        if gui.status_message ~= '' and (os.clock() - gui.status_time < 5.0) then
            if gui.status_is_error then
                safe_text_colored(1.0, 0.4, 0.4, 1.0, gui.status_message);
            else
                safe_text_colored(0.4, 1.0, 0.4, 1.0, gui.status_message);
            end
        else
            safe_text_colored(0.7, 0.7, 0.75, 1.0, player_data.message or 'Ready.');
        end

        imgui.Separator();

        -- Two-Column Layout using native Columns API (clean, stable, zero child-window issues)
        local cols_ok = pcall(function()
            imgui.Columns(2, 'vanablu_columns', true);
            imgui.SetColumnWidth(0, 280);
        end);

        -- Column 1: Equipped Spells Sidebar
        render_equipped_sidebar(equipped_state, limits, learned_map, player_data.is_main);

        -- Column 2: Navigation & Content
        if cols_ok then
            pcall(function() imgui.NextColumn(); end);
        end
        -- Cache zone info from player data
        if player_data and player_data.zone_name and player_data.zone_name ~= '' then
            gui.cached_zone_name = player_data.zone_name;
            gui.cached_zone_id = player_data.zone_id or 0;
        end
        render_navigation_and_content(equipped_state, limits, learned_map, player_data.is_main, player_data);

        -- Restore single column
        if cols_ok then
            pcall(function() imgui.Columns(1); end);
        end
    end);

    -- Emergency cleanup: unwind any style colors left open due to mid-frame error
    while open_styles > 0 do
        pcall(function() imgui.PopStyleColor(); end);
        open_styles = open_styles - 1;
    end

    -- Crucial: imgui.End() must ALWAYS be called if imgui.Begin() returned true
    if window_open then
        pcall(function() imgui.End(); end);
    end

    if not render_ok then
        log_render_error(render_err);
    end
end);

-- =============================================================================
-- Incoming Packets: capture BLU job point data (Blue Magic Point Bonus) from 0x08D
-- =============================================================================
ashita.events.register('packet_in', 'vanablu_packet_in_cb', function(e)
    pcall(backend.handle_packet_in, e);
end);

-- =============================================================================
-- Command Handling (Ashita v4 Standard)
-- =============================================================================
local function print_help()
    print('[VanaBlu] Command Reference:');
    print('  /vanablu, /vanab, or /vb - Toggle the VanaBlu window.');
    print('  /vanablu show - Open the VanaBlu window.');
    print('  /vanablu hide - Close the VanaBlu window.');
    print('  /vanablu toggle - Toggle open/closed state.');
    print('  /vanablu unsetall - Unset all currently equipped Blue Magic spells.');
    print('  /vanablu set <setname> or /vanablu load <setname> - Equip/load a saved spell set.');
    print('  /vanablu save <setname> - Save current spells as a named set.');
    print('  /vanablu delete <setname> - Delete a saved spell set.');
    print('  /vanablu zone [name|reset] - View or set active zone for tracker filtering.');
    print('  /vanablu list - List all saved spell sets.');
    print('  /vanablu help - Print this help message.');
end

ashita.events.register('command', 'vanablu_command_cb', function(e)
    local args = e.command:args();
    if #args > 0 then
        local cmd = args[1]:lower();
        if cmd == '/vanablu' or cmd == '/vanab' or cmd == '/vb' then
            e.blocked = true;

            if #args == 1 then
                gui.is_open[1] = not gui.is_open[1];
            else
                local sub = args[2]:lower();
                if sub == 'show' then
                    gui.is_open[1] = true;
                elseif sub == 'hide' then
                    gui.is_open[1] = false;
                elseif sub == 'toggle' then
                    gui.is_open[1] = not gui.is_open[1];
                elseif sub == 'unsetall' or sub == 'clear' or sub == 'reset' then
                    if backend.can_set then
                        local p_data = nil;
                        pcall(function() p_data = backend.read(); end);
                        local is_m = p_data and p_data.is_main or true;
                        local r_slots = p_data and p_data.raw or {};
                        backend.unset_all(is_m, r_slots);
                        print('[VanaBlu] Clearing all equipped Blue Magic spells...');
                    else
                        print('[VanaBlu] Spell setting is unavailable.');
                    end
                elseif sub == 'set' or sub == 'equip' or sub == 'load' then
                    if #args >= 3 then
                        local target_name = table.concat(args, ' ', 3);
                        local matched_set = nil;
                        for name, data in pairs(gui.saved_sets or {}) do
                            if name:lower() == target_name:lower() then
                                matched_set = data;
                                break;
                            end
                        end
                        if matched_set then
                            local p_data = nil;
                            pcall(function() p_data = backend.read(); end);
                            local is_m = p_data and p_data.is_main or true;
                            local lim = model.get_limits(p_data and p_data.level or 1, is_m, p_data and p_data.assimilation, p_data and p_data.blue_point_bonus, p_data and p_data.jp_spent, p_data and p_data.client_max_points);
                            local eq_s = model.process_equipped(p_data and p_data.raw or {}, spells);
                            local l_map = gui.cached_learned_map or backend.read_learned(p_data and p_data.player, spells);
                            local valid_target = {};
                            for _, sp_id in ipairs(matched_set.spells) do
                                local sp = spells[sp_id];
                                if sp and l_map[sp_id] ~= false and sp.level <= lim.level then
                                    table.insert(valid_target, sp_id);
                                end
                            end
                            local diff = model.diff_set(valid_target, eq_s.slots, lim.slots);
                            if #diff == 0 then
                                print(string.format('[VanaBlu] Set "%s" is already equipped.', matched_set.name));
                            else
                                local ok, msg = backend.start_equip_set(valid_target, matched_set.name, is_m, eq_s.slots);
                                print('[VanaBlu] ' .. (msg or 'Equipping set...'));
                            end
                        else
                            print(string.format('[VanaBlu] Saved set "%s" not found.', target_name));
                        end
                    else
                        print('[VanaBlu] Usage: /vanablu set <setname>');
                    end
                elseif sub == 'save' then
                    if #args >= 3 then
                        local target_name = table.concat(args, ' ', 3);
                        local p_data = nil;
                        pcall(function() p_data = backend.read(); end);
                        local eq_s = model.process_equipped(p_data and p_data.raw or {}, spells);
                        if eq_s.count == 0 then
                            print('[VanaBlu] Cannot save empty set. Equip spells first.');
                        else
                            local lim = model.get_limits(p_data and p_data.level or 1, p_data and p_data.is_main, p_data and p_data.assimilation, p_data and p_data.blue_point_bonus, p_data and p_data.jp_spent, p_data and p_data.client_max_points);
                            local set_spells = {};
                            for slot = 1, lim.slots do
                                local sp_id = eq_s.slots[slot];
                                if sp_id and sp_id > 0 then
                                    table.insert(set_spells, sp_id);
                                end
                            end
                            gui.saved_sets[target_name] = { name = target_name, spells = set_spells, saved_at = os.time() };
                            save_saved_sets(gui.saved_sets);
                            print(string.format('[VanaBlu] Saved set "%s" with %d spells (%d BP).', target_name, #set_spells, eq_s.points_spent));
                        end
                    else
                        print('[VanaBlu] Usage: /vanablu save <setname>');
                    end
                elseif sub == 'delete' then
                    if #args >= 3 then
                        local target_name = table.concat(args, ' ', 3);
                        local found = false;
                        for name in pairs(gui.saved_sets or {}) do
                            if name:lower() == target_name:lower() then
                                gui.saved_sets[name] = nil;
                                found = true;
                                break;
                            end
                        end
                        if found then
                            save_saved_sets(gui.saved_sets);
                            print(string.format('[VanaBlu] Deleted set "%s".', target_name));
                        else
                            print(string.format('[VanaBlu] Set "%s" not found.', target_name));
                        end
                    else
                        print('[VanaBlu] Usage: /vanablu delete <setname>');
                    end
                elseif sub == 'list' or sub == 'sets' then
                    print('[VanaBlu] Saved Spell Sets:');
                    local count = 0;
                    for name, data in pairs(gui.saved_sets or {}) do
                        count = count + 1;
                        print(string.format('  - %s (%d spells)', name, #data.spells));
                    end
                    if count == 0 then
                        print('  (No sets saved yet)');
                    end
                    print('  Stored in: ' .. tostring(setstore.db_path or 'unavailable'));
                elseif sub == 'zone' then
                    if #args >= 3 then
                        local z_name = table.concat(args, ' ', 3);
                        if z_name:lower() == 'clear' or z_name:lower() == 'auto' or z_name:lower() == 'reset' then
                            gui.override_zone_name = '';
                            print('[VanaBlu] Zone filter reset to automatic client memory detection.');
                        else
                            gui.override_zone_name = z_name;
                            gui.filter_current_zone_only[1] = true;
                            print(string.format('[VanaBlu] Tracker zone filter manually set to: "%s".', z_name));
                        end
                    else
                        local p_data = nil;
                        pcall(function() p_data = backend.read(); end);
                        local cur_z = (gui.override_zone_name ~= '' and gui.override_zone_name) or (p_data and p_data.zone_name) or 'Unknown';
                        print(string.format('[VanaBlu] Current Zone: %s (Zone ID: %d)', cur_z, p_data and p_data.zone_id or 0));
                        print('  To override or test: /vanablu zone <zonename> (or /vanablu zone reset)');
                    end
                elseif sub == 'help' then
                    print_help();
                else
                    print_help();
                end
            end
        end
    end
end);

--[[
Copyright © 2015, Anissa
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of bluGuide nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL ANISSA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--]]


return {
    tracker = tracker,
    ordered_spells = ordered_spells,
    gui = gui,
};
