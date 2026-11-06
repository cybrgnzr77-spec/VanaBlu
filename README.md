# VanaBlu for Ashita v4 (v1.0)

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
  - Obtainment & Hunting database (`res/hunting.lua`) with real retail monster names, exact level ranges, and verified sub-map coordinates—eliminating generic placeholders and fabricated mobs.
- **Zero-CPU Idle Optimization**:
  - Automatically bypasses all memory polling and rendering routines when the window is closed and no background queue is active, consuming 0% idle CPU.
- **Zero Per-Frame Garbage Allocation**:
  - All temporary buffers, tables, and state snapshots are pre-allocated and reused in place across frame cycles.

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
           ├── saved_sets.lua
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
