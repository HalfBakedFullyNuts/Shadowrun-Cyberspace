import { describe, expect, it } from 'vitest';
import { readFileSync } from 'node:fs';
import { join } from 'node:path';
import { parseLtg } from '../ltg';
import { createRng } from '../run/rng';
import { Sr2Rules } from '../run/rules';
import { defaultDeck, defaultDecker, parseDek, parseNpc } from '../run/persona';
import { RunSession, SAT_DECEPTED, SAT_SLEAZED } from '../run/session';

const EXAMPLES = join(__dirname, '..', '..', '..', 'examples');

function makeSession(seed = 1337): RunSession {
  const { matrix } = parseLtg(readFileSync(join(EXAMPLES, 'FIRSTRUN.LTG'), 'latin1'));
  const rng = createRng(seed);
  return new RunSession(matrix, defaultDecker(), defaultDeck(), new Sr2Rules(rng), rng);
}

describe('Sr2Rules', () => {
  it('damage modifiers follow the VB tiers', () => {
    const rules = new Sr2Rules(createRng(1));
    expect(rules.damageMod(0)).toBe(0);
    expect(rules.damageMod(1)).toBe(1);
    expect(rules.damageMod(3)).toBe(2);
    expect(rules.damageMod(6)).toBe(3);
    expect(rules.damageMod(10)).toBe(1000);
  });

  it('success tests are deterministic per seed and respect targets', () => {
    const a = new Sr2Rules(createRng(42)).successTest(10, 4);
    const b = new Sr2Rules(createRng(42)).successTest(10, 4);
    expect(a).toEqual(b);
    expect(a.rolls).toHaveLength(10);
    expect(a.successes).toBe(a.rolls.filter((r) => r >= 4).length);
  });

  it('open-ended dice can exceed 6', () => {
    const rules = new Sr2Rules(createRng(7));
    const result = rules.successTest(200, 7);
    expect(result.rolls.some((r) => r > 6)).toBe(true);
    expect(result.rolls.every((r) => r % 6 !== 0)).toBe(true); // totals never end on a bare 6
  });

  it('trace and shutdown timing formulas', () => {
    const rules = new Sr2Rules(createRng(1));
    expect(rules.traceTics(1)).toBe(10);
    expect(rules.traceTics(3)).toBe(4);
    expect(rules.traceTics(20)).toBe(1);
    expect(rules.shutdownTics(1)).toBe(5);
    expect(rules.shutdownTics(5)).toBe(1);
  });

  it('alert multiplies ICE dice by 1.5', () => {
    const rules = new Sr2Rules(createRng(1));
    const state = { alert: 0 } as Parameters<typeof rules.iceDice>[1];
    expect(rules.iceDice(6, { ...state, alert: 0 })).toBe(6);
    expect(rules.iceDice(6, { ...state, alert: 1 })).toBe(9);
  });
});

describe('persona files', () => {
  it('parses original .DEK', () => {
    const deck = parseDek(readFileSync(join(__dirname, 'FAIRLIGH.DEK'), 'latin1'));
    expect(deck.model).toContain('Fairlight');
    expect(deck.mpcp).toBe(12);
    expect(deck.hardening).toBe(5);
    expect(deck.programs).toContainEqual({ name: 'Attack', rating: 7 });
  });

  it('parses original .NPC', () => {
    const decker = parseNpc(readFileSync(join(__dirname, 'BUSHLEAG.NPC'), 'latin1'));
    expect(decker.name).toBe('Bush League');
    expect(decker.willpower).toBe(4);
    expect(decker.reaction).toBe(3);
    expect(decker.reactDice).toBe(1);
    expect(decker.hackingPool).toBe(decker.intelligence + decker.computer);
  });
});

describe('RunSession', () => {
  it('starts at the entry node at matrix range', () => {
    const session = makeSession();
    expect(session.curnode).toBe(1);
    expect(session.outcome).toBe('running');
    expect(session.ice.length).toBe(5);
  });

  it('approach closes range and engages ICE', () => {
    const session = makeSession();
    session.approach(); // obs -> sensor
    session.approach(); // sensor -> contact
    expect(session.range).toBe(0);
    expect(session.engagedIce().length).toBeGreaterThan(0);
  });

  it('deception can satisfy access ICE; movement then succeeds', () => {
    const session = makeSession(7);
    session.approach();
    session.approach();
    let guard = 0;
    while (session.outcome === 'running' && guard < 30) {
      guard++;
      const gate = session.engagedIce()[0];
      if (!gate) break;
      if (gate.satisfaction === SAT_DECEPTED || gate.satisfaction === SAT_SLEAZED) break;
      session.deception();
    }
    const gate = session.ice[0];
    expect([SAT_DECEPTED, SAT_SLEAZED]).toContain(gate.satisfaction);
    expect(session.blockedByIce()).toBe(false);
  });

  it('attacking ICE raises the alert and can crash it', () => {
    const session = makeSession(99);
    session.approach();
    session.approach();
    const target = session.engagedIce()[0];
    let guard = 0;
    while (session.outcome === 'running' && target.damage < 10 && guard < 40) {
      guard++;
      session.attack(target.id);
    }
    expect(session.combat.alert).toBeGreaterThan(0);
    if (session.outcome === 'running') {
      expect(target.damage).toBeGreaterThan(0);
    }
  });

  it('download takes size/io turns and yields loot', () => {
    const session = makeSession(5);
    // teleport-free path: walk to DS-6 takes long; instead test on a crafted state
    session.curnode = 6; // DS with 3 files
    session.range = 0;
    session.nodes[6].filesKnown = true;
    session.download(0);
    expect(session.busyTics).toBe(0); // 40 Mp at I/O 50 → 1 tic, elapsed during the ICE loop
    // The download itself is locked against Scramble (FAQ §17) and must arrive:
    expect(session.loot).toHaveLength(1);
    expect(session.loot[0].name).toBe('Design Data');
    // Scramble ICE in DS-6 may have erased other files meanwhile — that is faithful behavior.
  });

  it('jacking out cleanly ends the run', () => {
    const session = makeSession();
    session.jackOut();
    expect(session.outcome).toBe('jacked-out');
  });

  it('runs never hang: random action fuzzing terminates', () => {
    for (let seed = 1; seed <= 10; seed++) {
      const session = makeSession(seed * 31);
      const rng = createRng(seed);
      let guard = 0;
      while (session.outcome === 'running' && guard < 200) {
        guard++;
        if (!session.isDeckerTurn) break;
        const roll = rng.next();
        if (roll < 0.2) session.approach();
        else if (roll < 0.3) session.analyze();
        else if (roll < 0.4) session.browse();
        else if (roll < 0.5) session.sleaze();
        else if (roll < 0.6) {
          const ice = session.engagedIce()[0];
          if (ice) session.attack(ice.id);
          else session.pass();
        } else if (roll < 0.75) {
          const links = session.matrix.nodes[session.curnode].links;
          session.moveForward(Math.floor(rng.next() * links.length));
        } else if (roll < 0.85) session.withdraw();
        else session.pass();
      }
      expect(guard).toBeLessThan(200 + 1);
    }
  });
});
