# Cyberspace/Matrix Package — Legacy Analysis

Source: VB 3.0 (1996–2000), Stefan Markgraf, GPL. SourceForge SVN r2.

## Programs in package
| EXE | Purpose | Modern fate |
|---|---|---|
| `mated.exe` | **Matrix Construction Set** — design node grids, ICE, data | **Core of the Electron rewrite** |
| `cyberspc.exe` | Cyberspace Emulator — run a decker through the grid (SR 2.01 / VR 1.0 rules) | Out of scope v1 (visualizer covers viewing) |
| `cybdeck.exe` | Cyberdeck Designer | Out of scope v1 |
| `deckered.exe` | Decker Biomonitor | Out of scope v1 |

## LTG file format (INI-style text, must stay compatible)
```
[Matrix]
Description=<name>
Nodes=<N>                 ; node count, nodes are [Node0]..[NodeN], Node0 = external matrix (MAT)
Entry=<n>                 ; entry node index
Range=<0|1|2>             ; contact/sensor/observation
Alert=none|passive|active
Emergency=<perc>/<tics>   ; optional
Shutdowntics=<n>          ; optional
Readonly=Yes|No
LTGImagePath=<path>       ; optional

[Node<i>]
Type=<TYP> <Color>-<rating> <x> <y> [locked <tics>]
Type=LNK <file.ltg> <entry> <x> <y>          ; cross-grid link node
Mesg=<free text>                             ; optional
Files=<name>/<sizeMp>/<value> <name>/...     ; optional
ICEType=<icestr> | ICEType1=.. ICEType2=..   ; optional, multiple
Links=<i>/<j>/<k>                            ; sorted by angle (270°→-90° desc), ext matrix first
```
ICE string: `<White|Gray|Black> <Description>-<rating> [mobile|pmobile|amobile|immobile] [ever|passive|active|triggered] [ptrigger <i>] [atrigger <i>] [damage <n>]`
- Defaults: White → immobile+ever; Gray/Black → pmobile+passive
- damage < 0 encodes freezemod: freeze=floor(-d/16), dmg=-d mod 16; -100 = freeze 100
- damage ≥ 10 forces active=4

## Domain model
- **Node**: typ (CPU, SPU, DS, IOP, SM/SN, SAN, MAT/CRA, DLJ, LNK), color (Blue/Green/Orange/Red/Purple/Dark = colnr 1–6), rating 1–12, x/y grid pos, mesg, locked tics, files[≤20] {name, sizeMp, value¥}, links[≤30], ≤100 nodes
- **ICE**: code (White/Gray/Black), description = one of 15 types: Access, Barrier, Scramble, Probe, Killer, Blaster, Acid, Binder, Jammer, Marker, Tar Baby, Tar Pit, Trace and Report, Trace and Dump, Trace and Burn. rating, mobility (EMOBILE/PMOBILE/AMOBILE/IMOBILE), activity (0 ever/1 passive/2 active/3 triggered), ptrigger/atrigger (ICE index, -1 none, -2 all-triggered), damage, freezemod. ≤100 ICE
- **Matrix**: name, entrynode, range, alert, emergency %/tics, shutdowntics, readonly

## Validation rules (TestMatrix + MatrixStatistic, NODELIM.DAT)
1. Entry node must exist, not be LNK; Node0 (ext matrix) auto-linked to entry
2. All links bidirectional (auto-repair w/ warning); no node without links; no two nodes on same position
3. Security tiers via m=(colnr-1)*10+rating against table (5 tiers × 5 node categories: DLJ/SM, IOP, CPU/SAN, DS/SPU, LNK):
   ```
   none:  1-2   4-4   12-14 13-21 21-24
   low:   3-3  11-13  15-25 22-31 25-32
   med:   4-4  14-15  26-27 32-35 33-37
   high:  3-4  11-15  15-27 22-35 25-37
   ultra: (0s — table truncated in data file)
   ```
   Gaps (e.g. Blue 5–10, Green 6–10, Orange 8+, Red 8+) flagged as impossible/exaggerated.
4. Legal connections, 9×9 (CPU DS IOP SM SPU SAN MAT DLJ LNK):
   ```
   CPU: 0 1 1 1 1 1 0 1 0
   DS:  1 1 0 0 1 0 0 1 0
   IOP: 1 0 0 0 1 0 1 1 1
   SM:  1 0 0 0 1 0 0 1 0
   SPU: 1 1 1 1 1 1 0 1 0
   SAN: 1 1 0 0 1 0 1 1 1
   MAT: 0 0 1 0 0 1 0 0 0
   DLJ: 1 1 1 1 1 1 1 1 0
   LNK: 0 0 1 0 0 1 0 0 0
   ```
5. System must have a CPU; sum(White+Gray ICE ratings) ≤ 2·Σ(CPU rating·colnr) (VR1.0 p.23); ~25% of ICE ratings should be "ever" active; ICE rating > 12 flagged; ICE in Blue node flagged; ICE in LNK node flagged; colors above Red flagged.

## MATED editor UX (to modernize)
- Tool modes: **Set/Delete node**, **Move node**, **Connect/Disconnect** (click 2 nodes), **Add files**, **Add ICE**
- Node design panel: type + color (B/G/O/R/P/D) + rating 1–12
- General params: matrix name, alert, entry node + range, emergency, messages
- Analyze menu → Matrix Statistics report; File → New/Load/Save LTG
- Status: node count, ICE count

## Sample data
`bin-extracted/DATA/*.LTG` — real grids (FIRSTRUN, CITY, ANDY2M, …) usable as bundled examples + parser test fixtures.
