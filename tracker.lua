--[[
* =============================================================================
* VanaBlu for Ashita v4
* Module: tracker.lua
*
* Description:
*   Data and helper logic for the Spell Tracker tab (no ImGui code here).
*
*   - Builds the tracker spell list from res/hunting.lua (196 spells on
*     VanaDreams, including the 18 Unbridled Learning spells that cannot be set).
*   - Resolves zone names from the game client by zone id, so the
*     "Current Zone only" filter matches by id instead of by fuzzy name.
*   - Computes distance / compass direction from the player to the nearest
*     known spawn of a teaching monster while you are in that zone.
* =============================================================================
--]]

local M = {
    entries   = {},   -- ordered list of tracker entries
    by_id     = {},   -- spell id -> entry
    all_ids   = {},   -- spell id -> true (for learned-spell checks)
    meta      = {},
};

local ELEMENT_NAMES = {
    [0] = 'Fire', [1] = 'Ice', [2] = 'Wind', [3] = 'Earth',
    [4] = 'Thunder', [5] = 'Water', [6] = 'Light', [7] = 'Dark', [15] = 'Physical',
};
M.ELEMENT_NAMES = ELEMENT_NAMES;

local DIRS = { 'E', 'NE', 'N', 'NW', 'W', 'SW', 'S', 'SE' };

-- -----------------------------------------------------------------------------
-- Name helpers
-- -----------------------------------------------------------------------------

local function resource_manager()
    local rm = nil;
    pcall(function() rm = AshitaCore:GetResourceManager(); end);
    return rm;
end

--- Returns the client's own zone name for an id (exact in-game spelling), or the fallback.
function M.zone_name(id, fallback)
    if id then
        local rm = resource_manager();
        if rm then
            local ok, name = pcall(function() return rm:GetString('zones.names', id); end);
            if ok and type(name) == 'string' and name ~= '' then
                return name;
            end
        end
    end
    return fallback or 'Unknown';
end

--- Returns the client's own spell name, or the fallback.
local function spell_name(id, fallback)
    local rm = resource_manager();
    if rm then
        local ok, name = pcall(function()
            local s = rm:GetSpellById(id);
            return s and s.Name and s.Name[1];
        end);
        if ok and type(name) == 'string' and name ~= '' then
            return name;
        end
    end
    return fallback;
end

local function norm(s)
    return (tostring(s or ''):lower():gsub('[^%w]', ''));
end

-- -----------------------------------------------------------------------------
-- Building the tracker list
-- -----------------------------------------------------------------------------

--- Builds tracker entries.
-- @param hunting table res/hunting.lua
-- @param spellinfo table res/spellinfo.lua (settable spells; may lack Unbridled spells)
function M.build(hunting, spellinfo)
    M.entries, M.by_id, M.all_ids = {}, {}, {};
    M.meta = hunting._meta or {};

    for id, h in pairs(hunting) do
        if type(id) == 'number' and type(h) == 'table' then
            local sp = spellinfo[id];
            local e = {
                id        = id,
                sp        = sp,                                   -- nil for Unbridled Learning spells
                name      = (sp and sp.name) or spell_name(id, h.name) or h.name,
                level     = h.level or (sp and sp.level) or 99,
                element   = (sp and sp.element) or h.element,
                cost      = sp and sp.cost or nil,
                settable  = (sp ~= nil) and not h.unbridled,
                unbridled = h.unbridled == true,
                status    = h.status or 'ok',
                skill     = h.skill,
                family    = h.family or 'Unknown',
                stats     = h.stats or 'None',
                stats_verified = h.stats_verified ~= false,
                notes     = h.notes or {},
                extra_lists = h.extra_lists or {},
                zones     = {},
                zone_ids  = {},
                zone_norm = {},
            };

            for zi, z in ipairs(h.zones or {}) do
                local zname = M.zone_name(z.id, z.zone);
                local nm_count, mob_count = 0, #(z.mobs or {});
                for _, m in ipairs(z.mobs or {}) do
                    if m.nm then nm_count = nm_count + 1; end
                end
                local kind = z.kind and (' [' .. z.kind .. ']') or '';
                local zone = {
                    id     = z.id,
                    name   = zname,
                    kind   = z.kind,
                    more   = z.more,
                    mobs   = z.mobs or {},
                    header = string.format('%s%s  (%d monster%s)###trz_%d_%d', zname, kind, mob_count,
                        mob_count == 1 and '' or 's', id, zi),
                    header_current = string.format('%s%s  (%d monster%s)  [CURRENT ZONE]###trz_%d_%d', zname, kind,
                        mob_count, mob_count == 1 and '' or 's', id, zi),
                };
                for _, m in ipairs(zone.mobs) do
                    local parts = { m.name, 'Lv. ' .. tostring(m.level or '?') };
                    for _, t in ipairs(m.tags or {}) do parts[#parts + 1] = t; end
                    if m.conf == 'wiki' then
                        parts[#parts + 1] = 'location from wiki (retail), not confirmed on this server';
                    elseif m.conf == 'unverified' then
                        parts[#parts + 1] = 'UNVERIFIED: name match only';
                    end
                    m.text = table.concat(parts, '  |  ');
                end
                e.zones[#e.zones + 1] = zone;
                if z.id then e.zone_ids[z.id] = true; end
                e.zone_norm[#e.zone_norm + 1] = norm(zname);
            end

            -- Precomputed display strings
            local lvl = string.format('[Lv.%2d]', e.level);
            e.header_learned   = string.format('%s %-24s  [LEARNED]###trk_%d', lvl, e.name, id);
            e.header_unlearned = string.format('%s %-24s  [NOT LEARNED]###trk_%d', lvl, e.name, id);
            if e.status == 'unavailable' then
                e.header_unlearned = string.format('%s %-24s  [NOT LEARNABLE YET]###trk_%d', lvl, e.name, id);
            end
            local cost_text = e.unbridled and 'Unbridled Learning spell (cannot be set)'
                or string.format('Set Cost: %d BP', e.cost or 0);
            e.summary = string.format('Level: %d   |   %s   |   Element: %s   |   Family: %s',
                e.level, cost_text, ELEMENT_NAMES[e.element] or 'Unknown', e.family);
            if e.unbridled then
                e.attributes = nil;
            else
                e.attributes = 'Attributes: ' .. e.stats .. (e.stats_verified and '' or '  (not verified for this server)');
            end
            if #e.extra_lists > 0 then
                e.extra_text = 'This server also lists the move on skill lists: ' .. table.concat(e.extra_lists, ', ')
                    .. ' (monster locations for these are not confirmed).';
            end
            if e.status == 'unavailable' then
                e.banner = 'Not currently learnable on this server.';
            elseif e.status == 'odyssey' then
                e.banner = 'Odyssey (Sheol Gaol) only on this server.';
            end
            e.zones_header = string.format('Learning Locations (%d Zone%s):', #e.zones, #e.zones == 1 and '' or 's');

            M.entries[#M.entries + 1] = e;
            M.by_id[id] = e;
            M.all_ids[id] = true;
        end
    end

    table.sort(M.entries, function(a, b)
        if a.level ~= b.level then return a.level < b.level; end
        return a.name < b.name;
    end);
    return M.entries;
end

-- -----------------------------------------------------------------------------
-- Zone filtering
-- -----------------------------------------------------------------------------

--- Returns true if the spell can be learned in the given zone.
-- @param zone_id number|nil current zone id (preferred)
-- @param override string|nil manual zone name from /vanablu zone <name>
function M.in_zone(e, zone_id, override)
    if override and override ~= '' then
        local target = norm(override);
        if target == '' then return true; end
        for _, zn in ipairs(e.zone_norm) do
            if zn == target or zn:find(target, 1, true) then
                return true;
            end
        end
        return false;
    end
    if not zone_id or zone_id == 0 then
        return true;
    end
    return e.zone_ids[zone_id] == true;
end

--- Returns true if a tracker zone entry is the player's current zone.
function M.is_current(zone, zone_id, override)
    if override and override ~= '' then
        local target = norm(override);
        local zn = norm(zone.name);
        return target ~= '' and (zn == target or zn:find(target, 1, true) ~= nil);
    end
    return zone.id ~= nil and zone.id == zone_id;
end

-- -----------------------------------------------------------------------------
-- Player position / nearest spawn
-- -----------------------------------------------------------------------------

--- Returns the player's position on the ground plane (x = east, y = north), or nil.
function M.player_position()
    local x, y = nil, nil;
    pcall(function()
        local mm = AshitaCore:GetMemoryManager();
        local idx = mm:GetParty():GetMemberTargetIndex(0);
        local ent = mm:GetEntity();
        x = ent:GetLocalPositionX(idx);
        y = ent:GetLocalPositionY(idx);
    end);
    if type(x) ~= 'number' or type(y) ~= 'number' then
        return nil, nil;
    end
    return x, y;
end

--- Compass direction (8-way) from a delta in game coordinates (x = east, y = north).
function M.direction(dx, dy)
    if dx == 0 and dy == 0 then return 'here'; end
    local ang = math.atan2 and math.atan2(dy, dx) or math.atan(dy, dx);
    local idx = math.floor(((ang / (2 * math.pi)) * 8) + 0.5) % 8;
    return DIRS[idx + 1];
end

--- Nearest known spawn point of a mob from the player.
-- @return number|nil distance in yalms, string|nil compass direction
function M.nearest(mob, px, py)
    local pts = mob.pts;
    if not pts or #pts < 2 or not px then return nil, nil; end
    local best, bdx, bdy = nil, 0, 0;
    for i = 1, #pts - 1, 2 do
        local dx, dy = pts[i] - px, pts[i + 1] - py;
        local d = math.sqrt(dx * dx + dy * dy);
        if not best or d < best then
            best, bdx, bdy = d, dx, dy;
        end
    end
    return best, M.direction(bdx, bdy);
end

-- -----------------------------------------------------------------------------
-- Player Blue Magic skill
-- -----------------------------------------------------------------------------

--- Returns the player's current Blue Magic skill (skill id 43), or nil.
function M.blue_magic_skill(player)
    local v = nil;
    pcall(function()
        local s = player:GetCombatSkill(43);
        v = s and s:GetSkill();
    end);
    if type(v) ~= 'number' then return nil; end
    return v;
end

return M;
