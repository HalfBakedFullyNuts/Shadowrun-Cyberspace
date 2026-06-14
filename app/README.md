# Matrix Construction Set — Developer Notes

See the [repo root README](../README.md) for the full project overview and getting-started guide.

## Commands

```bash
npm install                              # install deps
npm run dev                              # Vite + Electron, hot reload
npm test                                 # Vitest (25 tests)
npm run build                            # tsc + vite build (CI check)
npm run test -- --watch                  # watch mode
npm run test -- -t "RunSession"          # run one describe block
npm run test -- -t "round-trip"          # run one test by name fragment
```

## Architecture

```
domain/         Pure TypeScript — no React, no Electron, no DOM
  types.ts        Matrix, MatrixNode, Ice, DataFile; NODE_KINDS / NODE_COLORS / ICE_TYPES enums
  ltg.ts          .ltg INI parser (parseLtg) + serializer (serializeLtg); round-trips all 16 originals
  validate.ts     checkStructure (TestMatrix port) + auditRules (MatrixStatistic port)
  ops.ts          Immutable editor ops — all return a new Matrix
  run/
    rng.ts        Mulberry32 seedable RNG — createRng(seed) → { next, die }
    persona.ts    Decker / Cyberdeck / Program interfaces; parseDek / parseNpc for original files
    rules.ts      RulesEngine interface + Sr2Rules; add Sr4Rules here when rules are available
    session.ts    RunSession — full ICE/decker initiative loop, all actions, AI

components/     React editor UI (Canvas, Toolbar, Inspector, JackInDialog)
run3d/          Three.js 3D view
  scene3d.ts      MatrixScene — EffectComposer + UnrealBloomPass, per-kind geometries,
                  fog-of-war, IC entities, persona avatar, alert atmosphere, sync(session)
  RunView.tsx     React wrapper — HUD (condition monitors, ICE tracker, run log, action bar)
```

## Hard rules (from CLAUDE.md)

- **No React/Electron imports in `domain/`** — keep it testable
- **All state mutations via `GameController`** (editor) or returned new objects (domain ops)
- **`RulesEngine` is the SR4 extension point** — implement `Sr4Rules` against it; nothing else changes

## Adding SR4 rules

1. Create `src/domain/run/sr4rules.ts`, implement `RulesEngine`
2. The key differences from SR2: fixed TN 5 (not variable), hits counted directly (not open-ended),
   initiative uses Edge, damage staging uses boxes not levels
3. Add an edition selector to `JackInDialog.tsx` and pass the chosen engine to `new RunSession(...)`
4. Add tests in `run.test.ts` mirroring the `Sr2Rules` describe block

## Building the portable exe

`electron-builder` triggers EPERM on this machine (AV interference during `.tmp` rename).
Manual process:

```powershell
npm run build                                         # vite output → dist/
Copy-Item node_modules\electron\dist -Destination release\MatrixConstructionSet -Recurse -Force
New-Item release\MatrixConstructionSet\resources\app -ItemType Directory -Force
Copy-Item dist     release\MatrixConstructionSet\resources\app\dist     -Recurse -Force
Copy-Item electron release\MatrixConstructionSet\resources\app\electron -Recurse -Force
Copy-Item package.json release\MatrixConstructionSet\resources\app\
New-Item release\MatrixConstructionSet\resources\examples -ItemType Directory -Force
Copy-Item examples\* release\MatrixConstructionSet\resources\examples\ -Force
Rename-Item release\MatrixConstructionSet\electron.exe MatrixConstructionSet.exe
Compress-Archive release\MatrixConstructionSet "release\MatrixConstructionSet-v$(node -p "require('./package.json').version").zip" -Force
```

## File format

`.ltg` is an INI-style text format from the 1996 package. Key sections:

```ini
[Matrix]           name, entry, range, alert, flags
[NodeX]            kind, color, rating, x/y position
[LinksX]           space-separated neighbour indices (bidirectional)
[DataX]            files: "name,sizeMp,nuyen"
[ICEX_Y]           "Color Type (M/I)-Rating [passive|active] [mobile|immobile] [damage N]"
[TriggerX_Y_Z]     trigger chains between ICE
```

All 16 original demo grids in `examples/` pass the round-trip test (parse → serialize → re-parse ≡ original).
