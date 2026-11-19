# VanaBlu tests

Offline tests that load the addon with Ashita v4, ImGui and the game client simulated.
They need `texlua` (Lua 5.3, ships with TeX Live) and write scratch files under `/tmp`.

Run every suite from the repository root:

```sh
sh tests/run_all.sh
```

Or run one suite, passing the addon folder (the repository root):

```sh
texlua tests/test_audit.lua .
```

| Suite | Covers |
| :--- | :--- |
| `test_bp.lua` | Set point limits (80 BP cap), job point packet `0x08D`, client point reads |
| `test_sets.lua` | Saved set storage in the config folder, migration from older versions |
| `test_spelldata.lua` | Spell and trait data checks, every tab renders without errors |
| `test_tracker.lua` | Spell Tracker data, zone matching, nearest spawn |
| `test_equip.lua` | Saved-set loading against a simulated server: pacing, 0x044 confirmation, retries, dropped packets, the "Set:" label |
| `test_audit.lua` | v1.0.3 fixes: ImGui Begin/End pairing, support-job flag, packet bytes, per-frame lookups, trait cache |

`bench_frames.lua` is not a test: it prints memory allocated and time spent per rendered frame for each tab
(`texlua tests/bench_frames.lua . 300`). Absolute numbers differ from in-game (LuaJIT), but comparisons hold.
