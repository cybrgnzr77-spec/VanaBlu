--[[
* VanaBlu for Ashita v4
* Core Domain Model and Calculations
* Ported from Windower 4 bluGuide by Anissa / VanaBlu for Ashita v4
--]]

local M = {}

M.gift_exempt_traits = {
    ['Double/Triple Attack']      = true,
    ['Auto Refresh']              = true,
    ['Gilfinder/TH']              = true,
    ['Gilfinder/Treasure Hunter'] = true,
}

function M.get_limits(level, is_main, assimilation_points, blue_point_bonus, jp_spent)
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
    points = (math.floor((level + 9) / 10) * 5) + 5

    -- Assimilation merits apply if character level reaches 75+
    if level >= 75 then
        points = points + math.min(5, math.max(0, assimilation_points))
        -- Level 99 Job Point bonus (up to +20 BP)
        if level == 99 then
            points = points + math.min(20, math.max(0, blue_point_bonus))
        end
    end

    -- Level 99 Job Point gift tier bonuses (+1 at 100 JP, +2 at 1200 JP)
    if level == 99 then
        if jp_spent >= 1200 then
            gifts = 2
        elseif jp_spent >= 100 then
            gifts = 1
        end
    end

    slots = math.min(20, math.max(0, slots))

    return {
        slots = slots,
        points = points,
        gifts = gifts,
        level = level,
        is_main = is_main
    }
end

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
        else
            equipped_slots[slot] = nil
        end
    end

    return {
        map = equipped_map,
        slots = equipped_slots,
        count = count,
        points_spent = points_spent
    }
end

function M.find_free_slot(equipped_slots, max_slots)
    for slot = 1, max_slots do
        if not equipped_slots[slot] or equipped_slots[slot] == 0 then
            return slot
        end
    end
    return nil
end

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

function M.evaluate_trait(trait, equipped_map, gifts)
    gifts = gifts or 0
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

    if not trait.sorted_tiers then
        local thresholds = {}
        for req, val in pairs(trait.tiers) do
            table.insert(thresholds, { required = req, value = val })
        end
        table.sort(thresholds, function(a, b) return a.required < b.required end)
        trait.sorted_tiers = thresholds
    end
    local thresholds = trait.sorted_tiers

    local active_index = 0
    local active_val = nil
    for idx, t in ipairs(thresholds) do
        if total_points >= t.required then
            active_index = idx
            active_val = t.value
        end
    end

    if active_index > 0 and gifts > 0 and not M.gift_exempt_traits[trait.name] then
        active_index = math.min(#thresholds, active_index + gifts)
        active_val = thresholds[active_index].value
    end

    local next_req = nil
    local points_needed = nil
    if active_index < #thresholds then
        next_req = thresholds[active_index + 1].required
        points_needed = next_req - total_points
    end

    return {
        name = trait.name,
        current_points = total_points,
        active_tier_index = active_index,
        active_tier_val = active_val,
        is_active = (active_index > 0),
        next_threshold = next_req,
        points_needed = points_needed,
        equipped_spells = equipped_spells,
        unequipped_spells = unequipped_spells,
        all_spells = trait.spells,
        tiers = thresholds,
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

--- Generates sequential actions to transform currently equipped spells into target_spell_ids.
-- Follows blusets safe slot management:
-- 1. Unsets any currently equipped slot whose spell does not match the target spell for that exact slot.
-- 2. Sets the desired target spells into their respective slots.
-- Ensures zero slot collisions, zero duplicate spell rejections, and retains matching spells.
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
