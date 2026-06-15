# Shadowrun Cyberspace

> *"The Matrix is not a place. It's a state of mind."*

A modern Windows desktop rebuild of **Stefan Markgraf's classic Cyberspace/Matrix Program Package** (1996, Visual Basic 3.0, GPL) — the definitive fan toolkit for Shadowrun matrix environments.

Built with Electron 42 · React 19 · Three.js · TypeScript.

---

## What is this

In Shadowrun, deckers jack into the **Matrix** — a three-dimensional cyberspace where corporations hide their secrets behind walls of black ice. Running a matrix grid requires knowing your node layout, your ICE loadout, and your escape route before you ever plug in.

This app is two things in one:

### Matrix Construction Set — the editor
Design, populate and validate matrix grids:

- Place the nine node types (CPU, SPU, Datastore, I/O Port, Slave Module, SAN, Dataline Junction, LNK, MAT) across a hex grid
- Set security colors (Blue → Green → Orange → Red → Purple → Dark) and system ratings
- Stock nodes with **data files** (name, megapulse size, nuyen street value) and **ICE** — all 15 classic types: Access, Barrier, Scramble, Probe, Killer, Blaster, Acid, Binder, Jammer, Marker, Tar Baby, Tar Pit, Trace and Report/Dump/Burn
- Configure ICE behavior: White/Gray/Black, mobile or stationary, passive or active, trigger chains, damage staging
- Run the original **rules audit** from VR 1.0 p.23: legal connection matrix, CPU-based ICE budget, security-tier rating, active-ICE percentage
- **Full file compatibility**: reads and writes the original `.ltg` format — every file produced by the 1996 `mated.exe` opens here; grids you save load in the original executables

### Cyberspace Emulator — the run engine
Hit **⚡ Jack In** and play through the grid you built in a live Three.js 3D matrix view:

![Matrix 3D view: bloom-lit neon node structures, orbiting ICE entities, alert atmosphere](docs/screenshot-placeholder.png)

- **SR2 / VR 1.0 mechanics** ported faithfully from the original `cyberspc.exe` source:
  open-ended d6 tests · hacking pool · initiative loop · ICE satisfaction ladder
  (sleazed → suspicious → alarm) · passive/active alerts · mobile ICE that hunts you ·
  trigger chains · Trace/Scramble/Tar/attribute IC · damage staging · condition monitors · dump shock
- **Actions**: approach/withdraw range, traverse datatrails, Analyze, Browse, file download
  (I/O-timed — Scramble races you), Sleaze, Deception, Attack, Slow, run deck programs
  (Armor/Cloak/Mirrors/Shield/Smoke/Medic), system operations, jack out
- **Load original characters**: `.DEK` cyberdeck files and `.NPC` decker files from the 1996 package
- **Seedable RNG** — same seed → same run; ideal for replays and testing
- **Pluggable rules engine**: all edition math is behind a `RulesEngine` TypeScript interface —
  SR4 rules slot straight in without touching the engine or UI
- **Node sculpts**: give any node one of 12 visual themes (Zen Garden, Aztec Temple, Mad Max
  Wasteland, Urban, Underwater, Forest, Space, Castle, Abstract, Pixel Art, Retrofuturistic,
  Vintage Vector) — picked in the editor's **3D Sculpt** control, rendered as bespoke geometry in
  the run view with a kind badge. The SR "sculpted host" idea. Saved per-node in the `.ltg`
  (a key the 1996 binaries ignore, so files stay compatible)

---

## Getting started

### Prerequisites

- [Node.js](https://nodejs.org/) 20 or newer
- Windows 10/11 (Electron app — Mac/Linux untested)

### Run in dev mode

```bash
git clone https://github.com/HalfBakedFullyNuts/Shadowrun-Cyberspace.git
cd Shadowrun-Cyberspace/app
npm install
npm run dev
```

This starts **Vite + Electron** together with hot reload. The editor opens immediately. To test the emulator, load a grid from **Examples** and click **⚡ Jack In**.

### Run the tests

```bash
cd app
npm test
```

Runs 25 Vitest tests covering:

| Suite | What it covers |
|---|---|
| `ltg.test.ts` | Parser round-trips all 16 original demo grids (byte-faithful), ICE string parsing, validation |
| `run.test.ts` | SR2 dice formulas, persona file parsing, RunSession lifecycle, combat, download race, jack-out, fuzzing |

The fuzzing test runs 10 different seeds × 200 random decker actions and asserts nothing ever hangs — no infinite loops in the ICE AI or initiative loop.

### Quick test of the emulator — suggested playthrough

1. `npm run dev`
2. Click **Examples → FIRSTRUN** (a clean beginner grid — CPU, two SPUs, a Datastore, Access ICE)
3. Click **⚡ Jack In** → **Jack In** (default decker / Fairlight Excalibur)
4. In the 3D view:
   - **APPROACH** twice to close to contact range — the Access ICE will engage
   - **DECEPTION** to forge a passcode — watch the satisfaction state change in the ICE tracker
   - **MOVE** through the now-passive gate node to explore deeper
   - Find the **Datastore**, **BROWSE** to see its files, then **DOWNLOAD** one
   - Use **ANALYZE** on any node to reveal its contents
   - Try **ATTACK** on Gray ICE to see the alert escalate and active-alert multiplier kick in
5. Jack out cleanly or let a Trace catch you — the run-end card shows your loot and outcome

---

## Project layout

```
app/
  electron/          main process — window, file dialogs, IPC (CommonJS)
  src/
    domain/          framework-free TypeScript — the game engine core
      types.ts         domain model: Matrix, MatrixNode, Ice, DataFile
      ltg.ts           .ltg parser + serializer (original format, round-trip safe)
      validate.ts      rules audit port: TestMatrix + MatrixStatistic from VB3
      ops.ts           immutable editor operations (add/move/delete/link/ICE)
      run/
        rng.ts         seedable Mulberry32 RNG
        persona.ts     Decker, Cyberdeck, Program; .DEK / .NPC file parsers
        rules.ts       RulesEngine interface + Sr2Rules implementation
        session.ts     RunSession — the full emulator turn loop
    components/      React editor UI (Canvas, Toolbar, Inspector, JackInDialog)
    run3d/           Three.js 3D view (scene3d.ts) + HUD (RunView.tsx)
  examples/          16 original demo grids (.LTG files)
  release/           portable .exe (built manually — see BUILDING.md)

vb6-source/          original VB3 source files (reference only)
ANALYSIS.md          notes on the original format and mechanics
EMULATOR_SPEC.md     full mechanics spec extracted from CYBER01.FRM
```

---

## Planned

- **Shadowrun 4th Edition rules** — the `RulesEngine` interface is ready; SR4's fixed TN 5
  hit-counting fits the same `successTest` contract. Rules implementation pending user-provided
  SR4 source material.
- LNK node multi-grid hops (cross-grid travel)
- Karma rerolls

---

## Building a portable exe

`electron-builder` is included but may fail on machines with aggressive AV (EPERM during extraction). The portable release is assembled manually — see [app/README.md](app/README.md#building) for the exact steps used.

---

## Heritage & license

Original package: **Cyberspace Emulator / Matrix Construction Set / Cyberdeck Designer / Decker Biomonitor** by Stefan Markgraf (icetoaster@gmx.de), 1996–2000. Released under the GNU GPL. Sources at [sourceforge.net/p/cyberspace](https://sourceforge.net/p/cyberspace/).

This rebuild is licensed **GPL-2.0** accordingly.

*Shadowrun is a trademark of Catalyst Game Labs / FASA. This is an unofficial fan project.*
