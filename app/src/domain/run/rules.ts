// Pluggable rules layer. The session engine only talks to RulesEngine, so a
// Shadowrun 4 implementation can be dropped in later without touching the
// session, AI or UI. Sr2Rules ports the VB3 formulas verbatim (EMULATOR_SPEC.md).
import { MatrixNode, colorNumber } from '../types';
import { Rng } from './rng';
import { Decker, Cyberdeck } from './persona';

export interface TestResult {
  successes: number;
  rolls: number[];
}

/** Mutable per-run combat state the rules need to read (damage, pools, alert…). */
export interface RunCombatState {
  alert: 0 | 1 | 2;
  deckDamage: number;
  stunDamage: number;
  physDamage: number;
  /** Temporary persona boosts from Armor/Mirrors/Cloak (deck.add). */
  addBod: number;
  addEva: number;
  addMask: number;
  /** Persona attribute damage from Acid/Binder/Marker/Jammer (deck.dam). */
  damBod: number;
  damEva: number;
  damMask: number;
  damSens: number;
  modSmoke: number;
  modLoad: number;
  modShield: number;
  shieldActive: boolean;
  hangTough: boolean;
  spendHacking: number;
  leftHacking: number;
}

export interface RunIceState {
  damage: number;
  freezemod: number;
}

export interface RulesEngine {
  readonly id: string;
  readonly name: string;

  /** Open-ended success test for the player side (auto-roll). */
  successTest(dice: number, target: number): TestResult;
  /** Success test for opposition (ICE / node). */
  oppositionTest(dice: number, target: number): TestResult;

  damageMod(boxes: number): number;
  deckerMod(state: RunCombatState): number;
  iceMod(ice: RunIceState, state: RunCombatState): number;

  /** Dice the decker rolls for a program, consuming hacking pool. */
  programDice(programRating: number, state: RunCombatState): number;

  deckerInitiative(decker: Decker, deck: Cyberdeck, state: RunCombatState): number;
  iceInitiative(iceRating: number, node: MatrixNode, ice: RunIceState, state: RunCombatState): number;

  /** Effective ICE dice (alert multiplier). */
  iceDice(iceRating: number, state: RunCombatState): number;

  /** Effective persona attributes after boosts and attribute damage. */
  effectiveBod(deck: Cyberdeck, state: RunCombatState): number;
  effectiveEvasion(deck: Cyberdeck, state: RunCombatState): number;
  effectiveMasking(deck: Cyberdeck, state: RunCombatState): number;

  /** Stage base damage letter + net successes into boxes (deck damage path). */
  stageDeckDamage(baseLevel: number, netSuccesses: number, deck: Cyberdeck, state: RunCombatState): number;
  /** Black ICE stun/physical staging. */
  stageBlackDamage(baseLevel: number, netSuccesses: number, deck: Cyberdeck): number;

  traceTics(successes: number): number;
  shutdownTics(netSuccesses: number): number;
}

export const DAMAGE_BOXES = [1, 3, 6, 10]; // L / M / S / D

export class Sr2Rules implements RulesEngine {
  readonly id = 'sr2';
  readonly name = 'Shadowrun 2nd Edition / VR 1.0';
  private rng: Rng;

  constructor(rng: Rng) {
    this.rng = rng;
  }

  /** One open-ended d6: reroll-and-add while showing 6 (no rule of ones, as in the original). */
  private openD6(): number {
    let total = 0;
    let guard = 0;
    let roll = 6;
    while (roll === 6 && guard < 50) {
      roll = this.rng.die(6);
      total += roll;
      guard++;
    }
    return total;
  }

  private rollSuccesses(dice: number, target: number): TestResult {
    const rolls: number[] = [];
    let successes = 0;
    for (let i = 0; i < dice; i++) {
      const value = this.openD6();
      rolls.push(value);
      if (value >= target) successes++;
    }
    return { successes, rolls };
  }

  successTest(dice: number, target: number): TestResult {
    if (dice <= 0) return { successes: 0, rolls: [] };
    return this.rollSuccesses(dice, target);
  }

  oppositionTest(dice: number, target: number): TestResult {
    if (dice <= 0) return { successes: 0, rolls: [] };
    return this.rollSuccesses(dice, target);
  }

  damageMod(boxes: number): number {
    if (boxes >= 10) return 1000;
    if (boxes >= 6) return 3;
    if (boxes >= 3) return 2;
    if (boxes >= 1) return 1;
    return 0;
  }

  deckerMod(state: RunCombatState): number {
    return (
      this.damageMod(state.deckDamage) +
      this.damageMod(state.stunDamage) +
      this.damageMod(state.physDamage) +
      state.modLoad +
      state.modSmoke
    );
  }

  iceMod(ice: RunIceState, state: RunCombatState): number {
    return this.damageMod(ice.damage) + state.modSmoke;
  }

  programDice(programRating: number, state: RunCombatState): number {
    let add = Math.min(state.spendHacking, state.leftHacking, programRating);
    if (add < 0) add = 0;
    state.leftHacking -= add;
    return programRating + add;
  }

  deckerInitiative(decker: Decker, deck: Cyberdeck, state: RunCombatState): number {
    let roll = 0;
    for (let i = 0; i < decker.reactDice; i++) roll += this.rng.die(6);
    const reaction = decker.reaction + deck.response - this.deckerMod(state);
    return reaction + roll;
  }

  iceInitiative(iceRating: number, node: MatrixNode, ice: RunIceState, state: RunCombatState): number {
    return (
      iceRating + colorNumber(node.color) * 2 + 1 + this.rng.die(6) - this.iceMod(ice, state) - ice.freezemod
    );
  }

  iceDice(iceRating: number, state: RunCombatState): number {
    const factor = state.alert > 0 ? 1.5 : 1.0;
    return Math.floor(factor * iceRating);
  }

  effectiveBod(deck: Cyberdeck, state: RunCombatState): number {
    return Math.max(0, deck.bod + state.addBod - state.damBod);
  }
  effectiveEvasion(deck: Cyberdeck, state: RunCombatState): number {
    return Math.max(0, deck.evasion + state.addEva - state.damEva);
  }
  effectiveMasking(deck: Cyberdeck, state: RunCombatState): number {
    return Math.max(0, deck.masking + state.addMask - state.damMask);
  }

  stageDeckDamage(baseLevel: number, netSuccesses: number, deck: Cyberdeck, state: RunCombatState): number {
    let damage = DAMAGE_BOXES[baseLevel] + netSuccesses - 1;
    if (state.shieldActive) damage = Math.max(0, damage - state.modShield);
    damage -= deck.hardening;
    return Math.max(0, damage);
  }

  stageBlackDamage(baseLevel: number, netSuccesses: number, deck: Cyberdeck): number {
    if (netSuccesses < 2) return 0;
    const damage = DAMAGE_BOXES[baseLevel] + Math.floor(netSuccesses / 2) - 1 - deck.hardening;
    return Math.max(0, damage);
  }

  traceTics(successes: number): number {
    if (successes <= 0) return 0;
    return Math.max(1, Math.ceil(10 / successes));
  }

  shutdownTics(netSuccesses: number): number {
    if (netSuccesses <= 0) return 0;
    return Math.max(1, Math.ceil(5 / netSuccesses));
  }
}
