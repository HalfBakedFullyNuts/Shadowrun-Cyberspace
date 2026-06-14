# Shadowrun 4 Rules — Implementation Requirements

Working doc for adding SR4 (SR4A + Unwired) rules alongside the existing SR2/VR1.0 engine.
Fill the **NEEDS DATA** slots and I can implement `Sr4Rules` + the engine changes.

---

## Design decisions (locked)

- **Topology: grid as device network.** Keep the spatial grid and 3D view. Each node is
  reinterpreted as an SR4 device with its own Firewall / System / Response / Signal (or a single
  abstract **Device Rating**). Links = network connections. Traversal = hopping between connected
  nodes. **Account privilege (Public / User / Security / Admin) is tracked per node.** This is a
  light house-rule layered over SR4's account-based model so the construction set stays useful.
- **Hack pacing: step through intervals.** Extended Tests (Hack on the Fly, Trace, Browse) are
  played one interval per action. Each interval, the node rolls its detection test against your
  Stealth — your hack races their alert in real time. This is the SR4 analogue of the SR2
  satisfaction ladder.
- **Editions coexist.** SR2 stays fully selectable; an edition picker is added to the Jack In
  dialog. The `RulesEngine` interface and existing tests already support this.
- **Sim mode selectable**, default **hot sim** (3 IPs, 5P dumpshock, lethal Black IC).
- **Technomancer = optional SR4 persona type.** Under SR4, the Jack In dialog offers persona type
  **Hacker** (commlink/deck + programs) or **Technomancer** (Living Persona + Complex Forms +
  Sprites). Same `Sr4Rules` dice engine; the difference is the persona model, the resource it
  spends (Fading vs Matrix damage), and what it summons (Sprites vs loads IC). See the
  Technomancer section below.

---

## Rules captured from user (SR4A / Unwired)

### Dice mechanic — DONE
- Pool of d6, fixed TN 5; a 5 or 6 = 1 hit.
- Net hits = total hits − threshold (Success Test) or − opponent hits (Opposed Test).
- **Glitch**: half or more dice show 1. In Matrix: forces restart, grants node detection bonus,
  or triggers alert.
- **Critical glitch**: glitch with zero hits → severe (take damage / trigger Black IC).
- **Edge**: add Edge to pool pre-roll (6s explode), add Edge dice post-roll, reroll failures, or
  negate a glitch.

### Persona / device attributes — DONE (structural change needed)
- Cyberdecks → commlinks/nexi. Four attributes: **Response** (processing/speed),
  **Signal** (wireless range), **System** (OS stability/multitasking), **Firewall** (intrusion
  protection).
- Hacker contributes **skills** (Cracking: Cybercombat, Electronic Warfare, Hacking; Electronics:
  Computer, Data Search, Hardware, Software) + mental/physical attrs (back seat in Matrix).
- **Programs add their rating to the relevant skill** to form the pool (e.g. Cybercombat + Attack).

### Action dice pools — DONE (some NEEDS DATA below)
| Action | Pool / resolution |
|---|---|
| Hack on the Fly (Approach/Sleaze) | Hacking + Exploit vs target Firewall, **Extended**, Complex Action interval |
| Deception (defending) | Hacking + Stealth (persona) / Firewall + Stealth (node) vs Matrix Perception |
| Analyze node | Computer + Analyze — reveals alert status, hidden access, Matrix damage, data bombs, running programs, attribute ratings (by net hits) |
| Browse (find files) | Data Search + Browse, **Extended** |
| Download (Transfer Data) | Uses System; completes by end of Combat Turn (not I/O-timed); only epic files take longer |
| Attack IC | Cybercombat + Attack vs target Response + Firewall |
| Slow IC | Replaced by **Nuke** (reduce Response/System) or **Crash Program** (Hacking + Exploit vs Firewall + System) |
| Deck programs | Armor (resist Matrix dmg) and Stealth (hide icon — replaces Cloak/Mirrors/deception) still exist |
| System ops | No node-type ops; everything gated by account privilege (User/Security/Admin) |

### IC — DONE (NEEDS DATA on stat blocks)
- IC = agent programs: roll **own Rating + offensive program rating**; defend with Response + Firewall.
- Active alert does **not** multiply IC dice; a restricted alert gives the node **+4 Firewall** vs the intruder.
- 15 classic types streamlined into generic agents loaded with utilities (Attack, Black Hammer,
  Blackout, Track, …).
- IC can move between nodes to pursue, if they have access to the connected node.

### Damage & condition monitors — DONE
- Matrix Condition Monitor = **8 + (System ÷ 2, round up)**.
- Matrix damage DV = offensive program rating + net hits; resist with **System + Armor** (each hit −1 box).
- Biofeedback to the user resisted with **Willpower + Biofeedback Filter**.
- **Dump** when Matrix CM fills, or node executes Terminate Connection / Reboot. Dumpshock =
  **5S (cold) / 5P (hot)**, resist Willpower + Biofeedback Filter, plus disorientation penalty.
- **Flatline**: Black IC (Black Hammer) or hot-sim dumpshock deal Physical to the meat body;
  death if Physical overflow > Body.

### Initiative — DONE (engine change: tics → Combat Turns/passes)
- Matrix Initiative = **Response + Intuition** (cold) / **+1** (hot).
- IC/agents: **Pilot + Response**.
- 3-second Combat Turn, multiple Initiative Passes: cold sim 2 IPs, hot sim 3 IPs, IC/agents 3 IPs.
- Per pass: one Action Phase = two Simple or one Complex, plus one Free.

### Alert system — DONE (NEEDS DATA on ARC specifics)
- **Restricted alert** (targets one intruder) vs **general alert**.
- Triggered when node verifies an intrusion (Firewall detects hack, IC finds hacker, hacker glitches).
- Escalation: **+4 Firewall** vs intruder; node's **Alert Response Configuration (ARC)** fires
  (launch IC, scramble spider, terminate connection, reboot).
- Terminate connection: Opposed Firewall + System vs hacker Exploit, Extended.
- Reboot: System + Response (10, 1 Combat Turn) Extended to log off all users.

### Trace — DONE
- **Track** program follows an icon to its origin node.
- Success reveals access ID + device location (exact if wired, ~50 m if wireless).
- Tracking = **Computer + Track (threshold 10), Complex Action, Extended**.
- Target slows it via **Redirect Trace** (Spoof): net hits from an Opposed Test add to tracker threshold.

### Node structure — DONE
- No CPU/SPU/Datastore. Nodes = peripheral devices / commlinks (standard) / nexi (mainframes).
- Each node has System, Response, Firewall, Signal (or a single Device Rating).
- Actions gated by account privilege (Public/User/Security/Admin), not node type.

---

## Technomancers — optional SR4 persona type

A technomancer is selected instead of a deck-hacker at Jack In. Same TN5 dice engine, same
Cracking/Electronics skills and standard Matrix actions; everything below is what differs.

### Resonance & Fading — DONE
- Powered by **Resonance** (connection to the wireless gestalt); incompatible with Magic. Essence
  loss from 'ware permanently reduces Resonance.
- No programs — they use **Complex Forms**; using abilities causes **Fading** (mental fatigue).

### Living Persona (replaces deck attributes) — DONE
- No deck/commlink/sim module — the brain projects a **Living Persona**. Attributes derive from
  mental stats, **capped at Resonance**:
  - **Firewall = Willpower**
  - **Response = Intuition** (+1 in full VR)
  - **Signal = Resonance ÷ 2** (round up)
  - **System = Logic**
  - **Biofeedback Filter = Charisma** (inherent)
- Complex Form max base rating = **Resonance**.

### Threading & Tasking — DONE
- In any pool, replace the program rating with the **Complex Form** rating.
- **Threading** (improvise/boost a form): Software + Resonance Test; each hit = +1 rating
  (max = 2× Resonance). Sustaining a threaded form = **−2 dice pool** to all other tests.
- **Tasking** skill group (technomancer-only): Compiling, Decompiling, Registering.

### Sprites (replace IC/agents) — DONE (NEEDS DATA on per-type stats)
- Compiled digital entities. A Sprite's Matrix attributes, skills and complex forms all equal its
  **Rating** (chosen at compile); it rolls **Rating + skill/form**.
- **Compile**: Opposed Compiling + Resonance vs Sprite Rating; each net hit = one **task** (service).
  Unregistered sprites vanish after 8 hours or when tasks run out.
- Generic types: **Courier, Crack, Data, Fault, Machine**.
- Sprite initiative: Pilot(Rating) + Response(Rating), **3 IPs**.

### Damage & Fading — DONE
- **No separate Matrix Condition Monitor** — Matrix damage → **Stun** on the meat body. Knocked
  unconscious ⇒ Living Persona crashes.
- **Fading** resisted with **Willpower + Resonance**.
  - Threading: Fading DV = number of hits used.
  - Compile/Register: Fading DV = **2× hits** (not net hits) on the Opposed Test.
  - Fading is Stun, unless final threaded-form rating / sprite rating **exceeds Resonance** ⇒ Physical.

### Initiative — DONE
- Always **hot sim** in full VR. Matrix Initiative = **(Intuition × 2) + 1**, **3 IPs**.

### Alert / bio-node — DONE
- Triggers alerts in enemy nodes normally. Own organic node (PAN) is **always hidden mode**, ignores
  standard acknowledge-response protocols.

### Trace — DONE
- No hardwired access ID — **auto-spoofs** one without a test. A trace can only triangulate physical
  location to ~50 m relative to the connected node.
- Mundane hackers/spiders **cannot hack a bio-node** (not recognized as a valid node). Other
  technomancers/sprites can — treated as hacking an **admin account on the fly, +6 threshold**.

### Streams / Submersion / Resonance Realms — DONE (mostly cosmetic for the emulator)
- **Stream** (Cyberadept, Technoshaman, …) sets which Mental attribute joins Resonance to resist
  Fading, and which five sprite types can be compiled.
- **Submersion** raises Resonance max and grants **Echoes** (Biowire, Overclocking, …) — char-gen,
  largely out of run scope.
- **Resonance Realms** bypass standard topology via Matrix backdoors (Event Horizon). Likely out of
  scope for v1 of the run engine — flag if you want it modeled.

## NEEDS DATA (fill these to finish)

1. **Access-privilege thresholds & intervals**
   - Extended-test threshold to gain User / Security / Admin access.
     (Standard SR4: Firewall / Firewall+3 / Firewall+6 — confirm or override.) `____`
   - Interval for Hack on the Fly (Complex Action — confirm). `____`
   - Probe-the-target alternative (longer interval, fewer alerts) — include it? `____`

2. **Intrusion-detection loop** (the escalation engine)
   - Confirm: while you Hack on the Fly, the node rolls **Analyze + Firewall (Extended)** vs your
     **Stealth** rating; when it reaches threshold = Stealth, it detects you → alert. `____`
   - What exactly fires on detection (restricted alert + launch IC?). `____`

3. **Program list + starting ratings**
   - Canonical program set the persona/editor should offer. Default plan: Exploit, Stealth,
     Analyze, Browse, Edit, Attack, Black Hammer, Blackout, Armor, Medic, Track, Nuke, Spoof,
     Decrypt, Data Bomb, ECCM, Biofeedback Filter, Command. Add/remove? `____`
   - Default ratings for a sample starting hacker (plan: programs R4–6, deck attributes 3–5). `____`

4. **IC stat blocks** (so the editor can offer SR4 IC and auto-stock grids)
   - For each IC type: Pilot/Rating + loaded programs. Example format:
     `Black IC = Pilot 4, Black Hammer 5, Analyze 4, Attack 5`. `____`
   - Suggested IC ratings per security tier (Blue→Red) for auto-stocking. `____`

5. **Matrix Perception**
   - Confirm spotting icons/IC/data bombs = Computer + Analyze vs Stealth, threshold handling. `____`

6. **Edge for IC/AI** — do nodes/IC spend Edge? (Plan: no.) `____`

7. **Data bombs** (new in SR4) — add as an editor feature on nodes/files? `____`

### Technomancer-specific

8. **Complex Form list** — the forms the Living Persona should offer (the SR4 form equivalents of
   Attack, Stealth, Analyze, Exploit, Browse, Track, Medic, Armor, etc.). Confirm 1:1 mapping to the
   program list, or give the canonical list + a sample technomancer's forms & ratings. `____`
9. **Sprite stat blocks** — per type (Courier/Crack/Data/Fault/Machine): which skills/complex forms
   each rolls and any special powers (e.g. Crack sprite's Suppression, Data sprite's Browse). Plus a
   sample starting Resonance + sprite ratings. `____`
10. **Stream table** — for the Streams you want offered, which Mental attribute joins Resonance for
    Fading resistance and which five sprite types each can compile. (Default: offer Cyberadept +
    Technoshaman, all five generic sprites.) `____`
11. **Resonance Realms** — model them in the run engine, or leave out of v1? (Plan: out of v1.) `____`

---

## Implementation plan (once data is in)

1. **Persona model** (`persona.ts`) — add SR4 device attributes (Response/Signal/System/Firewall),
   skills, SR4 program list; keep SR2 fields behind an edition tag. New `.chum`/SR4 file parsing TBD.
2. **`Sr4Rules`** (`sr4rules.ts`) implementing `RulesEngine` — TN5 hit-counting `successTest`,
   glitch detection, Edge, damage staging (System+Armor), dumpshock, trace/reboot thresholds.
3. **Initiative refactor** (`session.ts`) — abstract the tic loop behind a turn model so SR2 keeps
   tics and SR4 uses Combat Turns × Initiative Passes (Simple/Complex/Free action economy).
4. **Account-privilege layer** — per-node access state (Public/User/Security/Admin); actions check
   privilege instead of node type. Node attributes (S/R/F/Sig or Device Rating) on `MatrixNode`.
5. **Extended-test step engine** — generic accumulating-hits-vs-detection mechanic for Hack on the
   Fly / Browse / Trace, one interval per action, with the node's detection roll racing the hacker.
6. **Editor**: SR4 node attribute fields, SR4 IC stat blocks, optional data bombs.
7. **Jack In dialog**: edition picker (SR2 / SR4) + sim mode (cold/hot).
8. **Technomancer persona** (`persona.ts`): a `LivingPersona` variant deriving Firewall/Response/
   Signal/System/Biofeedback from mental stats (capped at Resonance); Complex Forms in place of
   programs; Stream + Resonance fields. Persona-type tag distinguishes Hacker vs Technomancer.
9. **Fading + Threading** in `Sr4Rules`/`session.ts`: Fading resist (Willpower + Resonance), DV
   rules and Stun/Physical switch; Threading as a Software + Resonance action with the −2 sustain
   penalty; auto-spoofed access ID and always-hidden bio-node handling.
10. **Sprites** (mirrors the IC path): compile via Opposed Compiling + Resonance, task accounting,
    sprite acts on its own initiative — reuse the IC entity/AI plumbing in `session.ts` and the
    orbiting-entity rendering in `scene3d.ts`.
11. **Jack In dialog**: under SR4, persona-type toggle Hacker / Technomancer; technomancer forces
    hot sim and shows Resonance/Stream/Fading instead of deck attrs.
12. **Tests** (`run.test.ts`): mirror the `Sr2Rules` suite for `Sr4Rules`; add technomancer cases
    (Living Persona derivation, Fading staging, sprite compile/tasking); fuzz both an SR4 hacker run
    and a technomancer run to confirm no hangs.

---

## Best sources
SR4A core matrix chapter + **Unwired** (dedicated Matrix supplement). Page refs for the per-action
dice-pool tables, IC stat blocks, and damage tracks would let me verify formulas exactly.
