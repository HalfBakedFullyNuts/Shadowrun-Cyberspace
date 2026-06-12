# Cyberspace Emulator — Mechanics Spec (extracted from CYBER01.FRM, VB3)

Consolidated from source analysis. This is the contract for the TypeScript port
(`app/src/domain/run/`). SR2/VR1.0 numbers; the rules layer must stay pluggable for SR4.

## 1. Dice
- `D6(n)` = sum of n d6.
- Open-ended d6: reroll-and-add while a die shows 6 (`v mod 6 == 0`). No rule of ones (original omits it).
- `SuccNumber(ndice, tn)`: per die, open-ended roll; success if total ≥ tn. Used for ICE/node side.
- `SuccTest(ndice, tn, need)`: same roll for decker (auto mode). Karma: spend 1 to reroll failed dice once (cap 2×pool). ndice=0 → 0 successes (hang tough).
- `SuccOppTest = max(succ, need) - oppSucc - need`.
- Hacking pool: `MaxDD(r) = r + min(spendhacking, lefthacking, r)`, deducts from lefthacking; pool refreshes at decker turn.

## 2. Modifiers
- damlev = [1,3,6,10] (L/M/S/D boxes).
- `GetDamMod(n)`: ≥10→+1000, ≥6→+3, ≥3→+2, ≥1→+1, else 0.
- `ModDeck = dmgMod(deck.damage) + dmgMod(stun) + dmgMod(phys) + modload + modsmoke`.
- `ModICE(i) = dmgMod(ice.damage) + modsmoke`.
- Shield: damage→`max(0, dam - modshield)`, shield degrades per use.
- ModAnalyze mapping: -1→+2, -2→-1000 (already analyzed → bypass).
- Alert factor `modalert`: 1.0 none, 1.5 passive/active. ICE dice = `Int(modalert × rating)` when alert>none (GetIceRating); Trace-and-Burn blaster at entry = `Int(0.5×rating+0.95)`.

## 3. Execution tests (SR2 p.174/176)
- Sensor utils (Analyze/Browse/Decrypt/Sift...): decker `SuccTest(MaxDD(progR), nodeR + ModDeck + addTarget, colnr)` vs node `SuccNumber(nodeR, UseEva())`. net = d - o - colnr; net<0 fail (-1; -2 if o>d). Fail → per-op node target +2. Success (≥2 net for analyze) → target := -1000.
- Masking utils (Sleaze/Deception): opponent is ICE: `SuccNumber(iceRating, UseMask() + ModICE)`. If util already running in node (or auto_execute), need=0.
- auto_execute: if rating < nodeR, addTarget += nodeR - auto_execute rating; skips execution test.

## 4. Initiative & turn loop
- Decker ini = `dreaction + D6(dicereact)`; dreaction includes damage/load/smoke mods.
- ICE ini = `rating + colnr×2 + 1 + D6(1) - ModICE - freezemod`. If ≤0 and freezemod>0 → frozen (freezemod=100, satisfaction=FROZ).
- Active ICE = `ice.active ≤ alert` (0 ever / 1 passive / 2 active / 3 triggered / ≥4 crashed).
- Sort by ini desc; actor acts, ini -= 10; repeat; when all ≤0 → NewIni: reroll all, degrade smoke, MIRRORS -1 (RedEva), CountDown timers (locked SANs -1, shutdown, trace, sysirq, failedSysOps decay on other nodes).
- Run ends/dumps when deck.damage ≥10 (deck fried → CRA), stun ≥10 (dump), phys ≥10.

## 5. Combat
ICE attacks persona (IceAttacksPers):
- ICE rolls `SuccNumber(GetIceRating, tn)` where tn: vs deck dmg = UseBod()+ModICE (gray) or decker.body+ModICE (black phys/stun).
- Decker resists: deck dmg `SuccTest(MaxDD(mpcp), nodeR+ModDeck[+modburn],1)`; stun `SuccTest(willpower, iceR+ModDeck,1)`; phys `SuccTest(body, iceR+ModDeck,1)`; acid/binder/marker/jammer `SuccTest(UseEva(), iceR+ModDeck)`. hangtough → 0 dice.
- net = iceSucc - deckerSucc; ≤0 miss.
- Damage: deck dmg = `damlev(base) + net - 1`, then shield, then `- hardening`. Black stun/phys: needs net≥2, dam = `damlev(base) + floor(net/2) - 1 - hardening`. Stun overflow >10 → phys.
- Attribute ICE: Acid→BOD, Binder→EVA, Marker→MASK, Jammer→SENS; eats deck.add() bonus first (degrading armor/mirrors/cloak), rest to deck.dam(attr), restore TN = ice rating.
- Decker attacks ICE (PersHitsIce): execution test once per node (fail → modattack+2), then `SuccTest(MaxDD(attackR), nodeR+ModDeck, colnr)`; White/frozen ICE defends 0, Gray/Black `SuccNumber(GetIceRating, nodeR)`. xtra = d - o - colnr ≥0 hits: ice.damage += `damlev(base)+xtra-1`; ≥10 → crashed (active=4), counts toward emergency %.
- SLOW: opposed test; successes += freezemod (freeze at 100 via ini roll).

## 6. ICE AI — satisfaction ladder
States: FROZ -4, DECP -3, SLEA -2, SLEZ -1, LOOK 0, SUSP 1, YELL 2, HIT 3.
- Escalates one step per ICE action when decker present and not masked: LOOK→SUSP (triggers passive alert once + ptrigger chain) → YELL (passive alert again ⇒ active; atrigger chain; starts attacking) → HIT (display).
- SLEA→SLEZ→LOOK decay of sleaze; ReSleaze each decker action (not movement): masking test (+2 TN vs Probe), success → back to SLEA, modsleaze +1 cumulative.
- MakeICEsatisfaction broadcasts: escalation ≥SUSP raises all non-frozen ICE in node; deception ≤LOOK resets them.
- Priority of engagement (GetAppropICE): Barrier > Probe > Access > Traces > Acid/Binder/Marker/Jammer/TarBaby/TarPit > Killer/Blaster > Black Killer.
- Movement (MoveICE): not if frozen/satisfaction<0/succattacked/succslowed. Trace ICE flees toward CPU. Mobility: EMOBILE always, PMOBILE at passive+, AMOBILE at active only, IMOBILE never. Different node: range steps toward contact then random-walk links (avoid node0, LNK, lastnode; SAN bounces back). Active alert: heads to decker's node. Arriving at decker's node → satisfaction LOOK, "*New ICE approaches".
- Blocking: active unfooled ICE at decker's range blocks movement/ops (Scramble and fleeing traces don't block).

## 7. Trace ICE
On YELL: roll `SuccNumber(GetIceRating, UseMask())`; tracetics = `ceil(10/succ)` (min 1). Counts down per ICE action; satellite uplink cancels (tracetics=-3).
At 0: Report → istraced=true, tracetics=-3; Dump → dump decker (dump shock), -2; Burn → istraced + blaster attack at entry `Int(0.5×r+0.95)` dice, -1.

## 8. System operations (contact range only, timetics=1, TN=nodeR, need > colnr)
- CPU: Cancel Alert (passive only), Change Node (teleport, arrive DECP), Display Map (all visited), Shutdown (`shutdowntics = ceil(5/(succ-colnr))`), System Inquiry.
- SAN: Lockout (`locked = MaxDD(computer) - cpuRate`), Back Door (TN 2×nodeR), See System (free).
- IOP: Display Message, Disconnect Port.
- DS: Read/Edit/Erase/Transfer File (transfer time = `size/io` turns; Iced files bigger; Scramble adds ICE code).
- SM/SN: Control, Sensor Readout.
- Fail → node.failsysop++ (adds +1 TN each, decays 1/turn while away).

## 9. Counters per round
- locked nodes -1; shutdowntics -1 (≤2 warn, 0 → dump all); sysirqtics -1 (0 → passive alert); emergency: when `crashedICE% ≥ emergeperc`, after emergetics → shutdowntics=10; failedSysOps decay on non-current nodes.

## 10. Movement
- Forward along selected link from contact range (or back along link 1); enter next node at observation range; approach: observation→sensor→contact (re-sleaze on the way, ICE engage at matching range). Backward = swap with lastnode, enter at sensor (contact if node empty). Moving while ICE attacked → passive alert ×2 (= active). LNK nodes auto-load next grid. Jack out: free if no Black ICE attacking, else hang-tough test. Dump shock damage on trace-dump/shutdown.

## 11. File formats
.DEK (INI): [Persona] Model/MPCP/Bod/Evasion/Masking/Sensor/Damage; [Technical Parameters] Hardening/ActiveMem/StorageMem/Load/I/O/Response/Satuplink; [Utilities] ProgramN=Name-Rating.
.NPC (INI): [Character] Name/Race; [Attributes] Body..Willpower, Reaction=3+1D6; [SKILLS] Computer/Software/Decking, Etiquette/Matrix; [DICE POOLS] Combat/Karma/Team.

## 12. Port notes
- RNG must be seedable for tests/replays.
- Rules constants/formulas live behind a `RulesEngine` interface → SR4 implementation later.
- Manual-dice mode and satellite/LNK multi-grid: defer (document).
