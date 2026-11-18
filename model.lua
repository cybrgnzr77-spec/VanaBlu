--[[
* VanaBlu for Ashita v4
* Module: model.lua
* Blue Magic rules with no game client access: slot/set point limits, equipped-spell
* bookkeeping, equip validation, job trait tiers and saved-set helpers.
* Original bluGuide (Windower 4) by Anissa of Cerberus.
--]]

local M = {}


--- Computes BLU slot / set point (BP) / gift limits.
-- Set point maximum (matches LandSandBoat blueutils::GetTotalBlueMagicPoints):
--   base: 10 BP at Lv.1-10, +5 per 10 levels, 55 BP at Lv.91-99
--   +1 BP per Assimilation merit (max 5) at Lv.75+
--   +1 BP per Blue Magic Point Bonus job point rank (max 20) at Lv.99
--   => 80 BP maximum.
-- If the game client's own computed maximum is available (client_max_points > 0) it is used
-- as the authoritative value, since it already includes every merit and job point bonus.
-- @param client_max_points number|nil max set points read from client memory (0/nil = unknown)
function M.get_limits(level, is_main, assimilation_points, blue_point_bonus, jp_spent, client_max_points)
    level = math.min(99, math.max(1, level or 1))
    assimilation_points = math.min(5, math.max(0, assimilation_points or 0))
    blue_point_bonus = math.min(20, math.max(0, blue_point_bonus or 0))
    jp_spent = math.max(0, jp_spent or 0)

    local slots = 0
    local points = 0
    local gifts = 0

    -- Slot capacity: 20 slots if level > 70, otherwise formulaic progression
    if level > 70 then
        slots = 20
    else
        slots = (math.floor((level + 9) / 10) * 2) + 4
    end

    -- Base Set Points: 10 BP at Lv.1 up to 55 BP at Lv.91-99
    local base_points = (math.floor((level + 9) / 10) * 5) + 5
    local merit_points = 0
    local jp_points = 0

    -- Assimilation merits apply if character level reaches 75+
    if level >= 75 then
        merit_points = assimilation_points
        -- Level 99 Job Point bonus (up to +20 BP)
        if level == 99 then
            jp_points = blue_point_bonus
        end
    end

    local calculated_points = base_points + merit_points + jp_points
    points = calculated_points

    -- Prefer the client's own computed maximum when it is available
    local points_source = 'calculated'
    client_max_points = tonumber(client_max_points) or 0
    if client_max_points > 0 then
        points = client_max_points
        points_source = 'client'
    end

    -- Job Point gift "Job Trait Bonus" (LandSandBoat job_point_gifts: BLU, 100 JP): +1 trait tier.
    -- Applied by the server only when the MAIN job is BLU at level 99 with 100+ JP spent on BLU.
    if level == 99 and is_main and jp_spent >= 100 then
        gifts = 1
    end

    slots = math.min(20, math.max(0, slots))

    return {
        slots = slots,
        points = points,
        gifts = gifts,
        level = level,
        is_main = is_main,
        base_points = base_points,
        bonus_points = points - base_points,   -- everything above the level-based base
        merit_points = merit_points,
        jp_points = jp_points,
        calculated_points = calculated_points,
        points_source = points_source,          -- 'client' (read from game) or 'calculated'
        jp_spent = jp_spent,
    }
end

--- Converts the 20 raw spell bytes from client memory into lookup tables.
-- @param raw_array table 20 spell bytes (spell id - 512; 0 = empty slot)
-- @param spellinfo table res/spellinfo.lua
-- @return table { map = [spell_id] = slot, slots = [slot] = spell_id, count = n, points_spent = BP }
function M.process_equipped(raw_array, spellinfo)
    local equipped_map = {}
    local equipped_slots = {}
    local count = 0
    local points_spent = 0

    for slot = 1, 20 do
        local raw_val = raw_array[slot] or 0
        if raw_val ~= 0 then
            local spell_id = raw_val + 512
            equipped_map[spell_id] = slot
            equipped_slots[slot] = spell_id
            count = count + 1

            local sinfo = spellinfo[spell_id]
            if sinfo and sinfo.cost then
                points_spent = points_spent + sinfo.cost
            end
        end
    end

    return {
        map = equipped_map,
        slots = equipped_slots,
        count = count,
        points_spent = points_spent
    }
end

--- Returns the first empty slot number (1..max_slots), or nil if all are used.
function M.find_free_slot(equipped_slots, max_slots)
    for slot = 1, max_slots do
        if not equipped_slots[slot] or equipped_slots[slot] == 0 then
            return slot
        end
    end
    return nil
end

--- Decides what clicking a spell should do: remove it if equipped, otherwise set it in the first
-- free slot if it is learned, the level allows it, and a slot and enough set points are free.
-- @param is_learned boolean|nil false blocks equipping; nil (unknown) does not
-- @return boolean ok, table|nil { action = 'remove'|'set', slot, spell_id[, cost] }, string|nil error
function M.validate_action(spell_id, equipped_state, limits, spellinfo, is_learned)
    local sinfo = spellinfo[spell_id]
    if not sinfo then
        return false, nil, 'Unknown spell ID: ' .. tostring(spell_id)
    end

    if equipped_state.map[spell_id] then
        local slot = equipped_state.map[spell_id]
        return true, { action = 'remove', slot = slot, spell_id = spell_id }
    end

    if is_learned == false then
        return false, nil, 'You have not learned ' .. sinfo.name .. '.'
    end

    if sinfo.level > limits.level then
        return false, nil, string.format('Level too low for %s (Requires Lv. %d, current Lv. %d).', sinfo.name, sinfo.level, limits.level)
    end

    if equipped_state.count >= limits.slots then
        return false, nil, string.format('All spell slots full (%d/%d).', equipped_state.count, limits.slots)
    end

    if (equipped_state.points_spent + (sinfo.cost or 0)) > limits.points then
        return false, nil, string.format('Not enough Set Points (%d + %d > %d).', equipped_state.points_spent, sinfo.cost or 0, limits.points)
    end

    local free_slot = M.find_free_slot(equipped_state.slots, limits.slots)
    if not free_slot then
        return false, nil, 'No available free slot.'
    end

    return true, { action = 'set', slot = free_slot, spell_id = spell_id, cost = sinfo.cost or 0 }
end

--- Evaluates one Blue Magic job trait the way the server does (LandSandBoat blueutils::CalculateTraits).
-- 1. Total the `points` of every equipped spell in the trait.
-- 2. The active tier is the highest-rank tier whose `points` requirement is met, ignoring jp_only tiers.
-- 3. The Job Point gift (+1 tier) then raises it to the highest tier with rank <= active rank + bonus,
--    including jp_only tiers. This is also how Double Attack becomes Triple Attack and Gilfinder becomes
--    Treasure Hunter (both are a single trait line on the server).
-- @param trait table entry from res/traits.lua
-- @param equipped_map table [spell_id] = truthy
-- @param bonus number tier bonus from the Job Point gift (0 or 1)
function M.evaluate_trait(trait, equipped_map, bonus)
    bonus = bonus or 0
    local total_points = 0
    local equipped_spells = {}
    local unequipped_spells = {}

    for _, sp in ipairs(trait.spells) do
        if equipped_map[sp.id] then
            total_points = total_points + (sp.points or 0)
            table.insert(equipped_spells, sp)
        else
            table.insert(unequipped_spells, sp)
        end
    end

    local tiers = trait.tiers or {}

    local base_index = 0
    for idx, t in ipairs(tiers) do
        if not t.jp_only and total_points >= t.points then
            if base_index == 0 or t.rank >= tiers[base_index].rank then
                base_index = idx
            end
        end
    end

    local active_index = base_index
    local boosted = false
    if base_index > 0 and bonus > 0 then
        local target_rank = tiers[base_index].rank + bonus
        for idx, t in ipairs(tiers) do
            if t.rank <= target_rank and t.rank > tiers[active_index].rank then
                active_index = idx
                boosted = true
            end
        end
    end

    -- Next tier reachable by adding spells (jp_only tiers can't be reached with points alone)
    local next_req, points_needed = nil, nil
    for _, t in ipairs(tiers) do
        if not t.jp_only and t.points > total_points then
            next_req = t.points
            points_needed = t.points - total_points
            break
        end
    end

    local active = tiers[active_index]
    return {
        name = trait.name,
        current_points = total_points,
        active_tier_index = active_index,
        active_tier_val = active and active.text or nil,
        is_active = (active_index > 0),
        boosted = boosted,
        retail = trait.retail == true,
        next_threshold = next_req,
        points_needed = points_needed,
        equipped_spells = equipped_spells,
        unequipped_spells = unequipped_spells,
        all_spells = trait.spells,
        tiers = tiers,
        subs = trait.subs or {}
    }
end

--- Calculates total Blue Magic Set Points (BP) for a set of spells
-- @param spell_ids table array of spell IDs
-- @param spellinfo table dictionary of spell data
-- @return number total BP cost
function M.calculate_set_bp(spell_ids, spellinfo)
    local total_bp = 0;
    for _, sp_id in ipairs(spell_ids or {}) do
        local sp = spellinfo[sp_id];
        if sp and sp.cost then
            total_bp = total_bp + sp.cost;
        end
    end
    return total_bp;
end

--- Calculates active traits and tiers for a given set of spell IDs
-- @param spell_ids table array of spell IDs
-- @param traits_table table full traits table
-- @param gifts number job point gift tier bonus
-- @return table array of active trait descriptor tables
function M.get_set_traits(spell_ids, traits_table, gifts)
    local equipped_map = {};
    for _, sp_id in ipairs(spell_ids or {}) do
        equipped_map[sp_id] = true;
    end

    local active_traits = {};
    for _, trait in pairs(traits_table or {}) do
        if type(trait) == 'table' and trait.name then
            local evaluated = M.evaluate_trait(trait, equipped_map, gifts or 0);
            if evaluated.is_active then
                table.insert(active_traits, evaluated);
            end
        end
    end

    table.sort(active_traits, function(a, b) return a.name < b.name; end);
    return active_traits;
end

--- Lists the per-slot changes that would turn the equipped spells into target_spell_ids
-- (slot N of the result holds target_spell_ids[N]):
-- 1. 'remove' for every occupied slot whose spell differs from the target for that slot.
-- 2. 'set' for every target spell not already in its slot.
-- Removals come first so a spell that only moves slots is never set twice at once.
-- VanaBlu currently uses this only to detect a set that is already equipped (empty result);
-- loading a set is done by backend.start_equip_set (clear all, then set slot by slot).
-- @param target_spell_ids table array of spell IDs to equip (1-indexed list)
-- @param equipped_slots table map of [1..20] = spell_id
-- @param max_slots number maximum allowed slots (e.g. 20)
-- @return table list of { action = 'remove'|'set', slot = 1..20, slot_index = 0..19, spell_id = 513.., spell_byte = 0..255 }
function M.diff_set(target_spell_ids, equipped_slots, max_slots)
    max_slots = max_slots or 20;
    target_spell_ids = target_spell_ids or {};
    equipped_slots = equipped_slots or {};

    local actions = {};

    -- Phase 1: Unset any slot currently occupied whose spell does not match the target spell for that exact slot
    for slot = 1, max_slots do
        local cur_sp = equipped_slots[slot] or 0;
        local target_sp = (slot <= #target_spell_ids and slot <= max_slots) and target_spell_ids[slot] or 0;
        if cur_sp > 0 and cur_sp ~= target_sp then
            table.insert(actions, {
                action = 'remove',
                slot = slot,
                slot_index = slot - 1,
                spell_id = cur_sp,
                spell_byte = 0,
            });
        end
    end

    -- Phase 2: Set any target spell that is not already equipped in that exact slot
    local target_count = math.min(#target_spell_ids, max_slots);
    for slot = 1, target_count do
        local target_sp = target_spell_ids[slot];
        local cur_sp = equipped_slots[slot] or 0;
        if target_sp and target_sp > 0 and target_sp ~= cur_sp then
            table.insert(actions, {
                action = 'set',
                slot = slot,
                slot_index = slot - 1,
                spell_id = target_sp,
                spell_byte = target_sp - 512,
            });
        end
    end

    return actions;
end

return M
