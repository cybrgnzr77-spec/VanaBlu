# VanaBlu for Ashita v4 (v1.0.2)

**VanaBlu** is a comprehensive, interactive Blue Magic spell, job trait, skillchain, and spell-hunting guide for Final Fantasy XI, built natively for **Ashita v4**.

Evolved from the original Windower 4 `bluGuide` addon by **Anissa**, VanaBlu has grown into a full-featured Blue Mage management suite. It combines modern Dear ImGui rendering, an authoritative networking engine using FFXI packet `0x102`, and a 100% verified database covering all 178 Blue Magic spells.

---

## Key Features

- **Authoritative Packet 0x102 Networking Engine**:
  - Replaces fragile client-internal memory setter hooks with direct FFXI packet `0x102` (`Untraditional Equip`) injection, following the exact protocol architecture used in atom0s's official [blusets](https://git.ashitaxi.com/Addons/blusets) addon.
  - Compatible with retail servers, HorizonXI, and private server environments regardless of whether the native in-game spell menu is open.
- **Atomic Batch Reset Engine**:
  - Dispatches atom0s's single 164-byte `0x102` batch reset packet to unequip all 20 Blue Magic slots simultaneously on the server in one atomic transaction.
- **Jitter-Proof Pacing & Settle Window**:
  - Pauses for **1.25 seconds** after a batch reset before equipping the first spell in a saved set, absorbing server transaction lag and eliminating dropped first spells.
  - Spaces subsequent spell additions and removals by **0.75 seconds**, absorbing network ping jitter and server tick variances without feeling sluggish (a full 10-spell set equips in ~8 seconds).
- **Double-Dereference Inventory Traversal**:
  - Follows the official pointer traversal pattern (`read_uint32(read_uint32(pInventory))`) with `+0x04` (main BLU) and `+0xA0` (sub BLU) offsets, guaranteeing accurate detection of currently equipped spells.
- **100% Audited 178-Spell Database**:
  - Verified against [BG-Wiki](https://www.bg-wiki.com/ffxi/Category:Blue_Magic), [FFXIclopedia](https://ffxiclopedia.fandom.com/wiki/Category:Blue_Magic), [FFXIDB](https://www.ffxidb.com/), and retail DAT tables.
  - Corrected Blue Magic Set Point (BP) costs (Seedspray 2 BP, Charged Whisker 4 BP, Foul Waters 4 BP, Sweeping Gouge 6 BP, Retinal Glare 5 BP).
  - Accurate skillchain properties (including secondary Impaction on Uppercut, Goblin Rush, and Thrashing Assault; Distortion/Scission on Quad. Continuum; Induration on Sweeping Gouge; Detonation on Sudden Lunge).
  - Complete job trait mappings with exact point contributions (including 6-point values for tier-4/5 traits).
  - Spell Tracker database (`res/hunting.lua`) built from the server's own spell-to-monster-move mappings and LandSandBoat spawn data: which monsters teach each spell, in which zones, at what levels, under what conditions (NM, night, weather, Dynamis, Odyssey...), plus the distance and direction to the nearest known spawn while you are in that zone. See *Spell Tracker Data* below.
- **Zero-CPU Idle Optimization**:
  - Automatically bypasses all memory polling and rendering routines when the window is closed and no background queue is active, consuming 0% idle CPU.
- **Zero Per-Frame Garbage Allocation**:
  - All temporary buffers, tables, and state snapshots are pre-allocated and reused in place across frame cycles.

---

## Changelog

### v1.0.2
Spell and trait data audited against the server code (LandSandBoat) and retail client data:
- **Job traits rebuilt from the server's trait tables.** Trait points now use the server scale (most spells 1 point, level-99 spells 2). Tier thresholds and values follow the server. Several traits had the wrong number of tiers, e.g. Zanshin has one tier, Beast Killer three, and Max MP Boost tops out at +20. Gilfinder needs 2 points and Treasure Hunter 3.
- **Job Point trait bonus corrected:** +1 tier at main-job level 99 with 100+ JP spent. There is no +2 at 1200 JP. The bonus applies to every trait, can reach the tiers marked "JP", and upgrades Double Attack to Triple Attack and Gilfinder to Treasure Hunter, matching the server.
- **Retail-only trait data marked.** Six traits (Critical Attack Bonus, Inquartata, Magic Accuracy Bonus, Magic Evasion Bonus, Resist Silence, Tenacity) and the level-99 spells' trait points are not in the public server code. They are kept, converted from retail values, and marked as unconfirmed.
- **Spell fixes:** the following now match the server and retail data.
  - Elements: buff and cure spells such as Pollen, Cocoon and Refueling have no element, and they now show "[None]" instead of an element. Seedspray is Earth.
  - Skillchains: Dimensional Death (Transfixion/Impaction), Goblin Rush (Fusion/Impaction), Amorphic Spikes (Gravitation only).
  - Effects: Cursed Sphere is water damage with no poison (now listed as a nuke). Sandspray inflicts Blind. Exuviation also cures. Auroral Drape inflicts Silence + Bind on this server. Hydro Shot has no Enmity Down.
  - Abyssea procs: only the 8 spells the server uses (Bad Breath and Temporal Shift removed). Voidwatch is labelled as retail reference, since the server code doesn't implement it.
- **Level and set-point costs verified:** all 178 spells match both the server and retail, so no changes were needed.
- **Spells without a cast script flagged:** 49 spells (mostly level 77+) have no cast script in the public server code. Their tooltip and tracker entry now say so. They still give traits and stat bonuses when set.
- **Damage tab:** the Liquefaction skillchain list was always empty because of a spelling mismatch. It's fixed.
- **Unbridled Learning spells:** Spell Tracker levels for Droning Whirlwind, Carcharian Verve and Blistering Roar corrected to 99.

### v1.0.1
- **Fixed:** Maximum Blue Magic Set Points stopped at 60 for level 99 characters. The Blue Magic Point Bonus job points (up to +20 BP) were never read, because the Ashita v4 call the addon relied on does not exist. The maximum (up to 80 BP: 55 base + 5 Assimilation merits + 20 job points) is now read directly from the game client, the same value the in-game Set Blue Magic menu shows. If that value is unavailable, the job point rank is captured from the server's job point packet (`0x08D`) instead.
- Hovering the level line under "Set Points" now shows the breakdown (base, merits, job points) and where the maximum came from.
- **Fixed:** Saved spell sets were wiped whenever the addon was updated, because the database lived in the addon folder and each release shipped an empty `saved_sets.lua`. Sets are now stored in `config/addons/vanablu/saved_sets.lua`, which updates never touch. The release no longer includes a `saved_sets.lua`, and sets from older versions are migrated automatically on first load (see *Updating & Saved Sets*).
- Saved sets are no longer duplicated into the per-character settings file. That duplicate copy could bring back sets you had deleted.
- `/vanablu list` now also shows where the saved sets file is stored.
- **Spell Tracker rebuilt for accuracy:** about a third of the old tracker's monster/zone entries pointed to monsters that don't teach the spell on VanaDreams, or to the wrong zone. The new data comes from the server's own spell mappings plus LandSandBoat spawn data (see *Spell Tracker Data*). Changes:
  - 18 Unbridled Learning spells added (196 spells total).
  - Monster levels, spawn conditions (NM, night, weather, fished, Dynamis, instance, battlefield) and per-spell notes, such as "only used at 50% HP or lower".
  - Spells that are Odyssey-only or not currently learnable on VanaDreams are flagged.
  - The Blue Magic skill required to learn each spell is shown next to your current skill.
  - The "Current Zone only" filter matches by zone ID, using the game's own zone names.
  - While you're in a listed zone, each monster shows the distance and compass direction to its nearest known spawn. This replaces the old map grid coordinates, most of which could not be verified.
  - The Help tab lists the server's learning rules.

---

## Installation

1. Close Final Fantasy XI or unload any existing addon instances:
   ```text
   /addon unload vanablu
   /addon unload bluguide
   ```
2. Extract the `vanablu` folder from the release archive directly into your Ashita `addons` directory:
   ```text
   <Ashita Directory>/
   └── addons/
       └── vanablu/
           ├── vanablu.lua
           ├── backend.lua
           ├── model.lua
           ├── setstore.lua
           ├── tracker.lua
           ├── README.md
           ├── LICENSE
           └── res/
               ├── spellinfo.lua
               ├── traits.lua
               └── hunting.lua
   ```
3. In-game, load the addon:
   ```text
   /addon load vanablu
   ```
4. *(Optional)* To load automatically when launching Ashita, add `/addon load vanablu` to your default startup script (`scripts/default.txt`).

### Spell Tracker Data
The tracker covers every spell learnable on VanaDreams (196, including the 18 Unbridled Learning spells, which cannot be set). It was built from:
1. **VanaDreams' live-server mapping extract (2026-11-13)**: which enemy move teaches each spell, and which monster skill lists contain that move. This is the authority for *what* teaches a spell on this server.
2. **The LandSandBoat repository** (the server's code base): which monsters use those skill lists, where they spawn, their levels, spawn conditions, and move-script restrictions (for example, Final Sting is only used at 50% HP or lower).
3. **BG-Wiki / FFXIclopedia (retail)**: only for spells whose VanaDreams skill lists don't exist in the public code. These entries are labelled *"location from wiki (retail), not confirmed on this server"*.

Each spell also shows the Blue Magic skill the server requires to learn it, alongside your current skill. Spells the server cannot currently teach are marked as such: the enemy move has no action script (Retinal Glare, Sinker Drill, Plenilune Embrace), or it only works inside Odyssey (Sheol Gaol).

Spawn data comes from the public LandSandBoat code, so a server with custom spawns may differ in places. Please report anything that doesn't match what you see in game.

### Updating & Saved Sets
Saved spell sets are stored outside the addon folder, in:
```text
<Ashita Directory>/config/addons/vanablu/saved_sets.lua
```
Updating the addon (extracting a new release over `addons/vanablu/`) never touches this file, so your sets are kept. Back up this file if you want a copy of your sets.

Upgrading from v1.0: older versions kept sets in `addons/vanablu/saved_sets.lua`. The first time v1.0.1 loads, those sets (and any copy in your per-character settings file) are moved to the config folder automatically, and the old file is renamed to `saved_sets.lua.migrated`. Extract v1.0.1 over your existing folder instead of deleting the folder first, so the old file is still there to migrate.

---

## Command Reference

All commands support `/vanablu`, `/vanab`, and `/vb` interchangeably:

| Command | Shorthand Examples | Description |
| :--- | :--- | :--- |
| `/vanablu` | `/vanab`, `/vb` | Toggles the VanaBlu interface open or closed. |
| `/vanablu show` | `/vb show` | Opens the VanaBlu interface. |
| `/vanablu hide` | `/vb hide` | Closes the VanaBlu interface. |
| `/vanablu toggle` | `/vb toggle` | Toggles the window visibility. |
| `/vanablu unsetall` | `/vb unsetall` | Unsets all currently equipped Blue Magic spells atomically via packet `0x102`. |
| `/vanablu set <name>` | `/vb set <name>` | Equips a saved spell set by name. |
| `/vanablu load <name>` | `/vb load <name>` | Alias for `/vanablu set <name>`. |
| `/vanablu save <name>` | `/vb save <name>` | Saves current equipped spells as a named set. |
| `/vanablu delete <name>` | `/vb delete <name>` | Deletes a saved spell set. |
| `/vanablu zone [name\|reset]` | `/vb zone [name\|reset]` | Views or overrides the active zone filter for the Spell Tracker. |
| `/vanablu list` | `/vb list` | Lists all saved spell sets in the chat log. |
| `/vanablu help` | `/vb help` | Displays available command usage in the chat log. |

---

## Architecture & Technical Details

### Authoritative Packet 0x102 Protocol
VanaBlu structures outgoing Blue Magic packets following the exact protocol used by atom0s's `blusets`:
- **Opcode**: `0x102` (`Untraditional Equip`).
- **Target Category**: `0x0001` (Blue Magic Spellbook).
- **Payload Structure**:
  - Single Spell Equip: 12-byte packet containing the target slot index (0–19) and spell ID.
  - Atomic Batch Reset: 164-byte packet setting all 20 slot entries to `0x0000` (unequipped) in a single network message.

### Timing Model
```text
[User clicks "Equip Set" or runs /vanablu set <name>]
  │
  ├── 1. Dispatches 164-byte batch reset packet (clears all 20 slots on server)
  │
  ├── 2. Waits 1.25s settle delay (allows server to commit the reset transaction)
  │
  ├── 3. Equips Spell 1 into Slot 1
  │      └── Waits 0.75s pacing delay
  │
  ├── 4. Equips Spell 2 into Slot 2
  │      └── Waits 0.75s pacing delay
  │
  └── ... Continues sequentially until complete (Set complete in ~8 seconds)
```

---

## License & Credits

VanaBlu is released under the **BSD 3-Clause License**. It borrows heavily from and builds upon the original `bluGuide` addon for Windower 4 by **Anissa**.

```text
Original bluGuide Code & Concept:
Copyright (c) 2015, Anissa
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

3. Neither the name of bluGuide, VanaBlu, nor the names of its
   contributors may be used to endorse or promote products derived from
   this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
```

- **Original bluGuide Author**: Anissa of Cerberus
- **Packet 0x102 Protocol Architecture**: atom0s ([blusets](https://git.ashitaxi.com/Addons/blusets))
- **Ashita v4 Native Port & VanaBlu Enhancements**: Assistant
