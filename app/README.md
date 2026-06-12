# Matrix Construction Set

**Create and visualize Shadowrun matrix environments.** A modern Windows desktop rebuild of the
Matrix Construction Set from the classic *Cyberspace/Matrix Program Package* (Stefan Markgraf,
1996–2000, Visual Basic 3.0, GPL) — rebuilt with Electron, React and TypeScript.

![status](https://img.shields.io/badge/SR_rules-VR_1.0_%2F_SR_2.01-ff2d6f)

## What it does

Design matrix grids for Shadowrun 2nd-edition decking runs:

- **Place nodes** — CPU, SPU, Datastore, I/O Port, Slave Module, SAN, Dataline Junction, and
  LNK cross-grid links, each with a security color (Blue → Dark) and system rating.
- **Connect** nodes into a grid; drag to rearrange; everything snaps to the grid.
- **Stock nodes** with data files (name / Mp size / nuyen value) and IC: all 15 classic types
  (Access, Barrier, Scramble, Probe, Killer, Blaster, Acid, Binder, Jammer, Marker, Tar Baby,
  Tar Pit, Trace and Report/Dump/Burn), White/Gray/Black, with mobility, activity,
  trigger chains and damage staging.
- **Analyze** — the original rules audit, ported verbatim: security-tier rating scheme,
  legal connection matrix, CPU-based IC budget (VR 1.0 p. 23), active-IC percentage and more.
- **Matrix parameters** — entry node and range, alert status, emergency shutdown, read-only grids.

## Run mode — the Cyberspace Emulator

Hit **⚡ Jack In** to run a decker through the grid you built, in a Three.js 3D matrix view
(bloom-lit neon structures, fog-of-war, orbiting IC entities, alert-tinted atmosphere):

- **SR2/VR1.0 mechanics** ported from `cyberspc.exe`: open-ended d6 tests, hacking pool,
  initiative loop, the IC satisfaction ladder (sleazed → suspicious → alarm), passive/active
  alerts, mobile IC that hunts you, trigger chains, Trace/Scramble/Tar/attribute IC behavior,
  damage staging with hardening and condition monitors, dump shock.
- **Actions**: approach/withdraw ranges, move along datatrails, Analyze, Browse, file
  transfer (I/O-timed, Scramble races you for the files), Sleaze, Deception, Attack, Slow,
  deck programs (Armor/Cloak/Mirrors/Shield/Smoke/Medic), system operations per node type,
  jack out (Black IC permitting).
- **Original characters load**: `.DEK` cyberdecks and `.NPC` deckers from the 1996 package.
- **Seedable RNG** — same seed, same run; ideal for testing and replays.

### Swapping rules editions

All edition math lives behind the `RulesEngine` interface
([src/domain/run/rules.ts](src/domain/run/rules.ts)) — dice mechanics, initiative, damage
staging, timing formulas. The session engine, IC AI and UI never touch edition specifics.
To add Shadowrun 4: implement `Sr4Rules` against the same interface and pass it to
`RunSession`. (SR4's fixed TN 5 hit-counting fits the same `successTest` contract.)

## File compatibility

Grids load from and save to the original **`.ltg` text format**. Every file produced by the
1996 `mated.exe` opens here, and grids you save remain loadable by the original
`cyberspc.exe`/`mated.exe`. Sixteen original demo grids ship in the **Examples** menu
(FIRSTRUN, CITY, ANDY2M, …).

## Run it

```bash
npm install
npm run dev        # dev: Vite + Electron with hot reload
npm test           # domain test suite (parser round-trip vs. original grids)
npm run dist       # package portable .exe + installer into release/
```

Or grab `release/Matrix Construction Set <version>.exe` (portable, no install needed).

## Keyboard

| Keys | Action |
| --- | --- |
| `Ctrl+O` / `Ctrl+S` / `Ctrl+Shift+S` | Open / Save / Save As |
| `Ctrl+Z` / `Ctrl+Y` | Undo / Redo |
| `Delete` | Delete selected node |

## Architecture

```
electron/        main process (window, file dialogs) — plain CommonJS
src/domain/      framework-free TypeScript: types, .ltg parser/serializer,
                 validation (TestMatrix + MatrixStatistic ports), editor ops
src/components/  React UI: SVG canvas, toolbar, inspector
examples/        original demo grids (bundled as extraResources)
```

The domain layer has no React/Electron imports and is covered by Vitest — including a
round-trip test over every bundled original grid.

## Heritage & license

Original package: *Cyberspace Emulator / Matrix Construction Set / Cyberdeck Designer /
Decker Biomonitor* by **Stefan Markgraf** (icetoaster@gmx.de), released as free software under
the GNU GPL — sources at [sourceforge.net/p/cyberspace](https://sourceforge.net/p/cyberspace/).
This rebuild is licensed **GPL-2.0** accordingly. Shadowrun is a trademark of its respective
owners; this is an unofficial fan tool.
