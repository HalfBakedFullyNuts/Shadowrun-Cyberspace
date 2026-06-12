// Run session engine: the Cyberspace Emulator core loop ported from CYBER01.FRM.
// Owns all mutable run state; consumes rules only via the RulesEngine interface
// so SR4 rules can replace Sr2Rules without touching this file's callers.
import { Matrix, DataFile, colorNumber } from '../types';
import { Decker, Cyberdeck, Program } from './persona';
import { RulesEngine, RunCombatState, DAMAGE_BOXES } from './rules';
import { Rng } from './rng';

export const RANGE_CONTACT = 0;
export const RANGE_SENSOR = 1;
export const RANGE_OBSERVATION = 2;

// ICE satisfaction ladder (CYBER0.BAS constants).
export const SAT_FROZEN = -4;
export const SAT_DECEPTED = -3;
export const SAT_SLEAZED = -2;
export const SAT_NERVOUS = -1;
export const SAT_LOOK = 0;
export const SAT_SUSPICIOUS = 1;
export const SAT_YELLING = 2;
export const SAT_HITTING = 3;

const ICE_PRIORITY: [RegExp, number][] = [
  [/barrier/i, 1],
  [/probe/i, 2],
  [/access/i, 3],
  [/trace/i, 4],
  [/acid|binder|marker|jammer|tar baby|tar pit/i, 5],
  [/killer|blaster/i, 6],
];

export interface RunIce {
  /** Index into the flat ICE list (stable id). */
  id: number;
  code: 'White' | 'Gray' | 'Black';
  type: string;
  rating: number;
  mobility: 'mobile' | 'pmobile' | 'amobile' | 'immobile';
  activeLevel: number; // 0 ever / 1 passive / 2 active / 3 triggered / 4+ crashed
  ptrigger: number;
  atrigger: number;
  baseDamageLevel: number; // 0..3 L/M/S/D
  nodenr: number;
  lastnode: number;
  range: number;
  satisfaction: number;
  ini: number;
  damage: number;
  freezemod: number;
  tracetics: number;
  succattacked: boolean;
  succslowed: boolean;
  /** Revealed to the decker (via analyze or engagement). */
  known: boolean;
}

export interface RunNode {
  visited: number; // 0 unknown, -1 partial, -2 full
  anaTarget: number;
  browseTarget: number;
  failSysop: number;
  locked: number;
  files: DataFile[];
  filesKnown: boolean;
}

export interface RunEvent {
  kind: 'log' | 'combat' | 'alert' | 'move' | 'system' | 'end' | 'good' | 'bad';
  text: string;
}

export type RunOutcome = 'running' | 'jacked-out' | 'dumped' | 'deck-fried' | 'unconscious' | 'dying';

export interface LootFile extends DataFile {
  fromNode: number;
}

export class RunSession {
  readonly matrix: Matrix;
  readonly decker: Decker;
  readonly deck: Cyberdeck;
  readonly rules: RulesEngine;
  private rng: Rng;

  combat: RunCombatState;
  ice: RunIce[] = [];
  nodes: RunNode[] = [];
  events: RunEvent[] = [];
  loot: LootFile[] = [];

  curnode: number;
  lastnode: number;
  range: number = RANGE_OBSERVATION;
  deckerIni = 0;
  round = 1;
  outcome: RunOutcome = 'running';
  istraced = false;

  shutdowntics = -1;
  sysirqtics = 0;
  emergetics: number;
  emergeperc: number;
  busyTics = 0;
  busyLabel = '';
  private pendingDownload: { nodeIndex: number; fileIndex: number } | null = null;

  // Per-node program execution state (usedprgs.<x> = nodenr in the original).
  private runningUtil = new Map<string, number>();
  private modAttack = 0;
  private modSleaze = 0;

  constructor(matrix: Matrix, decker: Decker, deck: Cyberdeck, rules: RulesEngine, rng: Rng) {
    this.matrix = matrix;
    this.decker = decker;
    this.deck = deck;
    this.rules = rules;
    this.rng = rng;
    this.combat = {
      alert: matrix.alert === 'active' ? 2 : matrix.alert === 'passive' ? 1 : 0,
      deckDamage: 0, stunDamage: 0, physDamage: 0,
      addBod: 0, addEva: 0, addMask: 0,
      damBod: 0, damEva: 0, damMask: 0, damSens: 0,
      modSmoke: 0, modLoad: 0, modShield: 0,
      shieldActive: false, hangTough: false,
      spendHacking: 3, leftHacking: decker.hackingPool,
    };
    this.emergeperc = matrix.emergency?.perc ?? 0;
    this.emergetics = matrix.emergency?.tics ?? 0;
    this.nodes = matrix.nodes.map((node) => ({
      visited: 0, anaTarget: 0, browseTarget: 0, failSysop: 0,
      locked: node.locked, files: node.files.map((f) => ({ ...f })), filesKnown: false,
    }));
    let id = 0;
    matrix.nodes.forEach((node, nodeIndex) => {
      for (const ice of node.ice) {
        this.ice.push({
          id: id++,
          code: ice.code,
          type: ice.type,
          rating: ice.rating,
          mobility: ice.mobility,
          activeLevel: ice.activity === 'ever' ? 0 : ice.activity === 'passive' ? 1 : ice.activity === 'active' ? 2 : 3,
          ptrigger: ice.ptrigger,
          atrigger: ice.atrigger,
          baseDamageLevel: this.damageLevelFromType(ice.type, ice.damage),
          nodenr: nodeIndex,
          lastnode: -1,
          range: RANGE_CONTACT,
          satisfaction: SAT_LOOK,
          ini: 0,
          damage: 0,
          freezemod: 0,
          tracetics: 0,
          succattacked: false,
          succslowed: false,
          known: false,
        });
      }
    });
    this.curnode = matrix.entry;
    this.lastnode = 0;
    this.range = matrix.range;
    this.nodes[this.curnode].visited = -1;
    this.emit('move', `Jacked in at ${this.nodeLabel(this.curnode)} — ${this.rangeName()} range.`);
    this.newRound();
    this.runIceUntilDeckerTurn();
  }

  // ---------- helpers ----------

  private damageLevelFromType(type: string, explicit: number): number {
    if (explicit >= 1 && explicit <= 4) return explicit - 1;
    const match = type.match(/\((L|M|S|D)\)/i);
    if (match) return 'LMSD'.indexOf(match[1].toUpperCase());
    return 1; // Moderate default
  }

  private emit(kind: RunEvent['kind'], text: string): void {
    this.events.push({ kind, text });
  }

  nodeLabel(index: number): string {
    const node = this.matrix.nodes[index];
    if (!node) return `node ${index}`;
    if (node.kind === 'MAT' || node.kind === 'CRA') return 'the external matrix';
    return `${node.kind}-${index}`;
  }

  rangeName(): string {
    return ['contact', 'sensor', 'observation'][this.range] ?? 'unknown';
  }

  program(name: string): Program | undefined {
    return this.deck.programs.find((p) => p.name.toLowerCase().startsWith(name.toLowerCase()));
  }

  activeIceHere(): RunIce[] {
    return this.ice.filter(
      (ice) =>
        ice.nodenr === this.curnode &&
        ice.activeLevel <= this.combat.alert &&
        ice.damage < 10,
    );
  }

  engagedIce(): RunIce[] {
    return this.activeIceHere().filter((ice) => ice.range === this.range);
  }

  private icePriority(ice: RunIce): number {
    for (const [pattern, priority] of ICE_PRIORITY) {
      if (pattern.test(ice.type)) return ice.code === 'Black' && priority === 6 ? 7 : priority;
    }
    return 6;
  }

  /** Highest-priority engaged ICE that still needs to be fooled. */
  appropriateIce(): RunIce | null {
    const candidates = this.engagedIce().filter((ice) => ice.satisfaction >= SAT_LOOK);
    if (candidates.length === 0) return null;
    candidates.sort((a, b) => this.icePriority(a) - this.icePriority(b));
    return candidates[0];
  }

  blockedByIce(): boolean {
    return this.engagedIce().some(
      (ice) =>
        ice.satisfaction >= SAT_LOOK &&
        !/scramble/i.test(ice.type) &&
        !(ice.tracetics < 0),
    );
  }

  // ---------- alerts & triggers ----------

  private raiseAlert(): void {
    if (this.combat.alert === 0) {
      this.combat.alert = 1;
      this.emit('alert', '▲ PASSIVE ALERT — the system noticed something.');
    } else if (this.combat.alert === 1) {
      this.combat.alert = 2;
      this.emit('alert', '▲▲ ACTIVE ALERT — the system is hunting you.');
    }
  }

  private triggerIce(targetId: number, sourceIni: number, nodenr: number): void {
    if (targetId === -2 || targetId === -3) {
      for (const ice of this.ice) {
        if (ice.nodenr === nodenr && ice.activeLevel === 3 && ice.damage < 10 && ice.satisfaction !== SAT_FROZEN) {
          ice.activeLevel = this.combat.alert;
          ice.ini = sourceIni - 10;
          this.emit('bad', `${ice.code} ${ice.type} wakes up!`);
        }
      }
      return;
    }
    if (targetId < 0) return;
    const ice = this.ice[targetId];
    if (ice && ice.damage < 10 && ice.satisfaction !== SAT_FROZEN) {
      ice.activeLevel = this.combat.alert;
      ice.ini = sourceIni - 10;
      this.emit('bad', `${ice.code} ${ice.type} is triggered and wakes up!`);
    }
  }

  // ---------- turn machinery ----------

  private newRound(): void {
    this.round++;
    this.deckerIni = this.rules.deckerInitiative(this.decker, this.deck, this.combat);
    for (const ice of this.ice) {
      if (ice.activeLevel <= this.combat.alert && ice.damage < 10) {
        const node = this.matrix.nodes[ice.nodenr];
        ice.ini = this.rules.iceInitiative(ice.rating, node, ice, this.combat);
        if (ice.ini <= 0 && ice.freezemod > 0 && ice.satisfaction !== SAT_FROZEN) {
          ice.freezemod = 100;
          ice.satisfaction = SAT_FROZEN;
          this.emit('good', `${ice.code} ${ice.type} freezes solid.`);
        }
      } else {
        ice.ini = 0;
      }
    }
    // per-round degradation and counters (NewIni + CountDown port)
    if (this.combat.modSmoke > 0) this.combat.modSmoke--;
    if (this.combat.addEva > 0) this.combat.addEva--;
    this.combat.leftHacking = this.decker.hackingPool;
    this.countDown();
  }

  private countDown(): void {
    for (let i = 1; i < this.nodes.length; i++) {
      if (this.nodes[i].locked > 0) this.nodes[i].locked--;
      if (i !== this.curnode && this.nodes[i].failSysop > 0) this.nodes[i].failSysop--;
    }
    if (this.shutdowntics > 0) {
      this.shutdowntics--;
      if (this.shutdowntics <= 2 && this.shutdowntics > 0) {
        this.emit('alert', `System shutdown imminent — ${this.shutdowntics} turns!`);
      }
      if (this.shutdowntics === 0) {
        this.emit('end', 'SYSTEM SHUTDOWN — all personas dumped.');
        this.dump('dumped', true);
        return;
      }
    }
    if (this.sysirqtics > 0) {
      this.sysirqtics--;
      if (this.sysirqtics === 0) this.raiseAlert();
    }
    if (this.emergeperc > 0) {
      const crashed = this.ice.filter((ice) => ice.damage >= 10).length;
      if (this.ice.length > 0 && (crashed * 100) / this.ice.length >= this.emergeperc) {
        if (this.emergetics <= 0 && this.shutdowntics < 0) {
          this.shutdowntics = 10;
          this.emit('alert', 'EMERGENCY — system operators initiate shutdown!');
        }
        this.emergetics--;
      }
    }
  }

  private checkDeckerCondition(): boolean {
    if (this.outcome !== 'running') return false;
    if (this.combat.deckDamage >= 10) {
      this.emit('end', 'Your cyberdeck is FRIED. The matrix dissolves into static.');
      this.dump('deck-fried', true);
      return false;
    }
    if (this.combat.stunDamage >= 10) {
      this.emit('end', 'You black out. Dump shock takes you.');
      this.dump('unconscious', true);
      return false;
    }
    if (this.combat.physDamage >= 10) {
      this.emit('end', 'Your body gives out. You are dying in your chair.');
      this.dump('dying', true);
      return false;
    }
    return true;
  }

  private dump(outcome: RunOutcome, shock: boolean): void {
    if (this.outcome !== 'running') return;
    this.outcome = outcome;
    if (shock && outcome !== 'unconscious' && outcome !== 'dying') {
      const resist = this.rules.successTest(this.decker.willpower, 6);
      const damage = Math.max(0, DAMAGE_BOXES[1] - resist.successes);
      if (damage > 0) {
        this.combat.stunDamage = Math.min(10, this.combat.stunDamage + damage);
        this.emit('bad', `Dump shock: ${damage} boxes of stun.`);
      } else {
        this.emit('good', 'You ride out the dump shock.');
      }
    }
  }

  /** Run ICE actions until it is the decker's turn again (or round rolls over). */
  private runIceUntilDeckerTurn(): void {
    let guard = 0;
    while (this.outcome === 'running' && guard < 500) {
      guard++;
      const actors = this.ice.filter(
        (ice) => ice.activeLevel <= this.combat.alert && ice.damage < 10 && ice.ini > 0 && ice.satisfaction !== SAT_FROZEN,
      );
      const top = actors.reduce<RunIce | null>((best, ice) => (!best || ice.ini > best.ini ? ice : best), null);
      if (this.deckerIni > 0 && (!top || this.deckerIni >= top.ini)) {
        if (this.busyTics === 0) return; // decker's turn
        this.deckerIni = 0; // busy with a transfer — forfeit remaining actions this round
        continue;
      }
      if (!top) {
        this.newRound();
        if (this.busyTics > 0) {
          this.busyTics--;
          this.deckerIni = 0; // busy: decker forfeits the round
          if (this.busyTics === 0) this.finishBusy();
        }
        continue;
      }
      this.doIce(top);
      top.ini -= 10;
      top.succattacked = false;
      top.succslowed = false;
      if (!this.checkDeckerCondition()) return;
    }
  }

  private finishBusy(): void {
    if (this.pendingDownload) {
      const { nodeIndex, fileIndex } = this.pendingDownload;
      const file = this.nodes[nodeIndex].files[fileIndex];
      if (file) {
        this.nodes[nodeIndex].files.splice(fileIndex, 1);
        this.loot.push({ ...file, fromNode: nodeIndex });
        this.emit('good', `Download complete: "${file.name}" (${file.sizeMp} Mp, ${file.value}¥).`);
      }
      this.pendingDownload = null;
    }
    this.busyLabel = '';
  }

  // ---------- ICE AI (DoICE port) ----------

  private doIce(ice: RunIce): void {
    if (ice.satisfaction === SAT_FROZEN || ice.satisfaction === SAT_DECEPTED) return;
    if (ice.tracetics > 0) {
      this.countTrace(ice);
      if (this.outcome !== 'running') return;
    }
    const sameNode = ice.nodenr === this.curnode;
    const sameRange = sameNode && ice.range === this.range;
    if (!sameNode || !sameRange) {
      this.moveIce(ice);
      return;
    }
    // Engaged: escalate the satisfaction ladder.
    if (ice.satisfaction < SAT_HITTING) {
      ice.satisfaction++;
      ice.known = true;
      switch (ice.satisfaction) {
        case SAT_NERVOUS:
          this.emit('log', `${this.iceLabel(ice)} is nervous…`);
          return;
        case SAT_LOOK:
          this.emit('log', `${this.iceLabel(ice)} wants your identification.`);
          return;
        case SAT_SUSPICIOUS:
          this.emit('bad', `${this.iceLabel(ice)} is suspicious!`);
          this.raiseAlert();
          this.triggerIce(ice.ptrigger, ice.ini, ice.nodenr);
          this.broadcastSatisfaction(ice, SAT_SUSPICIOUS);
          return;
        case SAT_YELLING:
          this.emit('bad', `${this.iceLabel(ice)} sounds the alarm!`);
          this.raiseAlert();
          this.triggerIce(ice.atrigger, ice.ini, ice.nodenr);
          this.broadcastSatisfaction(ice, SAT_YELLING);
          break; // falls through to acting hostile this action
      }
    }
    this.iceHostileAction(ice);
  }

  private broadcastSatisfaction(source: RunIce, level: number): void {
    for (const other of this.ice) {
      if (other !== source && other.nodenr === source.nodenr && other.satisfaction > SAT_FROZEN) {
        if (level >= SAT_SUSPICIOUS && other.satisfaction < level) other.satisfaction = level;
        if (level <= SAT_LOOK) other.satisfaction = level;
      }
    }
  }

  iceLabel(ice: RunIce): string {
    return ice.known ? `${ice.code} ${ice.type}-${ice.rating}` : 'Unknown IC';
  }

  private iceHostileAction(ice: RunIce): void {
    const type = ice.type.toLowerCase();
    if (/scramble/.test(type)) {
      const node = this.nodes[ice.nodenr];
      const protectedIdx = this.pendingDownload?.nodeIndex === ice.nodenr ? this.pendingDownload.fileIndex : -1;
      const target = node.files.findIndex((_, i) => i !== protectedIdx);
      if (target >= 0) {
        const file = node.files[target];
        node.files.splice(target, 1);
        if (this.pendingDownload && this.pendingDownload.nodeIndex === ice.nodenr && this.pendingDownload.fileIndex > target) {
          this.pendingDownload.fileIndex--;
        }
        this.emit('bad', `${this.iceLabel(ice)} erases "${file.name}"!`);
      }
      return;
    }
    if (/trace/.test(type)) {
      if (ice.tracetics === 0) {
        const test = this.rules.oppositionTest(
          this.rules.iceDice(ice.rating, this.combat),
          this.rules.effectiveMasking(this.deck, this.combat),
        );
        if (test.successes > 0) {
          ice.tracetics = this.rules.traceTics(test.successes);
          this.emit('bad', `${this.iceLabel(ice)} releases an ICE-dog — trace running (${ice.tracetics} actions)!`);
        } else {
          this.emit('log', `${this.iceLabel(ice)} fails to fix your datatrail.`);
        }
      }
      return;
    }
    if (/acid|binder|marker|jammer/.test(type)) {
      this.iceAttributeAttack(ice);
      return;
    }
    if (/tar baby|tar pit/.test(type)) {
      this.iceTarAttack(ice);
      return;
    }
    // Killer / Blaster / Access / Barrier / Probe (gray+black) → direct attack.
    this.iceAttacksPersona(ice, /blaster/.test(type) ? 'deck' : ice.code === 'Black' ? 'black' : 'deck');
  }

  private countTrace(ice: RunIce): void {
    ice.tracetics--;
    if (ice.tracetics > 0) {
      if (ice.tracetics <= 3) this.emit('alert', `Trace closing in — ${ice.tracetics} actions left!`);
      return;
    }
    const type = ice.type.toLowerCase();
    this.istraced = true;
    if (/report/.test(type)) {
      ice.tracetics = -3;
      this.emit('alert', 'TRACED — your meat location has been reported. Expect company.');
    } else if (/dump/.test(type)) {
      ice.tracetics = -2;
      this.emit('end', 'TRACED — the system dumps you hard.');
      this.dump('dumped', true);
    } else if (/burn/.test(type)) {
      ice.tracetics = -1;
      this.emit('alert', 'TRACED — Blaster surge incoming at your jackpoint!');
      this.iceAttacksPersona(ice, 'burn');
    }
  }

  private moveIce(ice: RunIce): void {
    if (ice.succattacked || ice.succslowed || ice.satisfaction < SAT_LOOK) return;
    const mobileAt =
      ice.mobility === 'mobile' ? 0 : ice.mobility === 'pmobile' ? 1 : ice.mobility === 'amobile' ? 2 : 99;
    if (this.combat.alert < mobileAt) return;
    if (ice.nodenr === this.curnode) {
      // close range toward the decker
      if (ice.range > this.range) ice.range--;
      else if (ice.range < this.range) ice.range++;
      if (ice.range === this.range) {
        ice.known = true;
        this.emit('bad', `${this.iceLabel(ice)} closes to ${this.rangeName()} range!`);
      }
      return;
    }
    if (ice.range > RANGE_CONTACT) {
      ice.range--;
      return;
    }
    // wander / hunt across nodes
    let next = -1;
    if (this.combat.alert >= 2) {
      const links = this.matrix.nodes[ice.nodenr].links;
      if (links.includes(this.curnode)) next = this.curnode;
    }
    if (next < 0) next = this.randomWalk(ice);
    if (next >= 0 && next !== ice.nodenr) {
      ice.lastnode = ice.nodenr;
      ice.nodenr = next;
      ice.range = RANGE_OBSERVATION;
      if (next === this.curnode) {
        ice.satisfaction = SAT_LOOK;
        this.emit('bad', '* New IC approaches this node.');
      }
    }
  }

  private randomWalk(ice: RunIce): number {
    const node = this.matrix.nodes[ice.nodenr];
    if (node.kind === 'SAN' && ice.lastnode !== -1) return ice.lastnode;
    const valid = node.links.filter((target) => {
      const other = this.matrix.nodes[target];
      return target !== ice.lastnode && target !== 0 && other && other.kind !== 'LNK';
    });
    if (valid.length === 0) return node.links[0] ?? -1;
    return valid[Math.floor(this.rng.next() * valid.length)];
  }

  // ---------- combat ----------

  private iceAttacksPersona(ice: RunIce, mode: 'deck' | 'black' | 'burn'): void {
    const node = this.matrix.nodes[ice.nodenr];
    const dice =
      mode === 'burn' ? Math.floor(0.5 * ice.rating + 0.95) : this.rules.iceDice(ice.rating, this.combat);
    const target =
      mode === 'black'
        ? this.decker.body + this.rules.iceMod(ice, this.combat)
        : this.rules.effectiveBod(this.deck, this.combat) + this.rules.iceMod(ice, this.combat);
    const attack = this.rules.oppositionTest(dice, target);
    if (attack.successes <= 0) {
      this.emit('combat', `${this.iceLabel(ice)} attacks — and misses.`);
      return;
    }
    let resist;
    if (this.combat.hangTough) {
      resist = { successes: 0, rolls: [] };
    } else if (mode === 'black') {
      resist = this.rules.successTest(
        this.decker.willpower,
        ice.rating + this.rules.deckerMod(this.combat),
      );
    } else {
      resist = this.rules.successTest(
        this.rules.programDice(this.deck.mpcp, this.combat),
        node.rating + this.rules.deckerMod(this.combat),
      );
    }
    const net = attack.successes - resist.successes;
    if (net <= 0) {
      this.emit('combat', `${this.iceLabel(ice)} attacks — you shrug it off.`);
      return;
    }
    if (mode === 'black') {
      const stun = this.rules.stageBlackDamage(ice.baseDamageLevel, net, this.deck);
      if (stun > 0) {
        this.combat.stunDamage += stun;
        if (this.combat.stunDamage > 10) {
          this.combat.physDamage += this.combat.stunDamage - 10;
          this.combat.stunDamage = 10;
        }
        this.emit('combat', `BLACK ICE BITES — ${stun} boxes of stun sear your brain.`);
      } else {
        this.emit('combat', `${this.iceLabel(ice)} grazes you — hardening holds.`);
      }
    } else {
      const damage = this.rules.stageDeckDamage(ice.baseDamageLevel, net, this.deck, this.combat);
      if (this.combat.shieldActive) this.combat.modShield = Math.max(0, this.combat.modShield - 1);
      if (damage > 0) {
        this.combat.deckDamage += damage;
        this.emit('combat', `${this.iceLabel(ice)} hits — ${damage} boxes of deck damage.`);
      } else {
        this.emit('combat', `${this.iceLabel(ice)} hits, but your defenses absorb it.`);
      }
    }
  }

  private iceAttributeAttack(ice: RunIce): void {
    const attack = this.rules.oppositionTest(
      this.rules.iceDice(ice.rating, this.combat),
      this.rules.effectiveEvasion(this.deck, this.combat) + this.rules.iceMod(ice, this.combat),
    );
    const resist = this.rules.successTest(
      this.rules.effectiveEvasion(this.deck, this.combat),
      ice.rating + this.rules.deckerMod(this.combat),
    );
    const net = attack.successes - resist.successes;
    if (net <= 0) {
      this.emit('combat', `${this.iceLabel(ice)} lashes out — you evade.`);
      return;
    }
    const type = ice.type.toLowerCase();
    const dam = Math.max(1, Math.floor(net / 2));
    if (/acid/.test(type)) {
      this.applyAttributeDamage('addBod', 'damBod', dam);
      this.emit('combat', `ACID corrodes your Bod by ${dam}.`);
    } else if (/binder/.test(type)) {
      this.applyAttributeDamage('addEva', 'damEva', dam);
      this.emit('combat', `BINDER tangles your Evasion by ${dam}.`);
    } else if (/marker/.test(type)) {
      this.applyAttributeDamage('addMask', 'damMask', dam);
      this.emit('combat', `MARKER strips your Masking by ${dam}.`);
    } else {
      this.combat.damSens += dam;
      this.emit('combat', `JAMMER scrambles your Sensors by ${dam}.`);
    }
  }

  private applyAttributeDamage(addKey: 'addBod' | 'addEva' | 'addMask', damKey: 'damBod' | 'damEva' | 'damMask', dam: number): void {
    const buffer = Math.min(this.combat[addKey], dam);
    this.combat[addKey] -= buffer;
    this.combat[damKey] += dam - buffer;
  }

  private iceTarAttack(ice: RunIce): void {
    const attack = this.rules.oppositionTest(
      this.rules.iceDice(ice.rating, this.combat),
      this.rules.effectiveMasking(this.deck, this.combat),
    );
    if (attack.successes <= 0) {
      this.emit('combat', `${this.iceLabel(ice)} lunges and misses.`);
      return;
    }
    const victim = this.deck.programs[Math.floor(this.rng.next() * this.deck.programs.length)];
    if (victim) {
      this.deck.programs = this.deck.programs.filter((p) => p !== victim);
      ice.damage = 10; // tar ICE crashes itself with its prey
      this.emit('combat', `${this.iceLabel(ice)} engulfs your ${victim.name}-${victim.rating} and crashes with it!`);
    }
  }

  // ---------- decker actions ----------

  get isDeckerTurn(): boolean {
    return this.outcome === 'running' && this.busyTics === 0;
  }

  /** Wraps a decker action: spends the action, runs ReSleaze, then lets ICE act. */
  private deckerAction(isMovement: boolean, action: () => void): void {
    if (!this.isDeckerTurn) return;
    this.combat.leftHacking = this.decker.hackingPool;
    this.combat.hangTough = false;
    if (!isMovement) this.reSleaze();
    if (this.outcome !== 'running') return;
    action();
    if (this.outcome !== 'running') return;
    this.deckerIni -= 10;
    if (!this.checkDeckerCondition()) return;
    this.runIceUntilDeckerTurn();
  }

  /** ReSleaze port: sleazed ICE re-tests the decker's mask on every non-movement action. */
  private reSleaze(): void {
    for (const ice of this.engagedIce()) {
      if (ice.satisfaction === SAT_SLEAZED || ice.satisfaction === SAT_NERVOUS) {
        const sleaze = this.program('sleaze');
        if (!sleaze) continue;
        const node = this.matrix.nodes[this.curnode];
        const probeBonus = /probe/i.test(ice.type) ? 2 : 0;
        const dice = this.rules.programDice(sleaze.rating, this.combat);
        const test = this.rules.successTest(
          dice,
          node.rating + this.rules.deckerMod(this.combat) + this.modSleaze + probeBonus,
        );
        const opp = this.rules.oppositionTest(
          this.rules.iceDice(ice.rating, this.combat),
          this.rules.effectiveMasking(this.deck, this.combat) + this.rules.iceMod(ice, this.combat),
        );
        if (test.successes - opp.successes >= 0) {
          ice.satisfaction = SAT_SLEAZED;
          this.modSleaze++;
        } else {
          ice.satisfaction = SAT_LOOK;
          this.emit('bad', `${this.iceLabel(ice)} sees through your sleaze!`);
        }
      }
    }
  }

  pass(): void {
    this.deckerAction(false, () => this.emit('log', 'You hold position, watching the node.'));
  }

  approach(): void {
    this.deckerAction(true, () => {
      if (this.range > RANGE_CONTACT) {
        this.range--;
        this.emit('move', `You close to ${this.rangeName()} range.`);
        const engaged = this.engagedIce();
        for (const ice of engaged) {
          if (ice.satisfaction >= SAT_LOOK) ice.known = true;
        }
        if (engaged.length > 0) {
          this.emit('log', `IC present: ${engaged.map((i) => this.iceLabel(i)).join(', ')}.`);
        }
      }
    });
  }

  withdraw(): void {
    this.deckerAction(true, () => {
      if (this.range < RANGE_OBSERVATION) {
        this.range++;
        this.emit('move', `You fall back to ${this.rangeName()} range.`);
      }
    });
  }

  moveForward(linkIndex: number): void {
    this.deckerAction(true, () => {
      const node = this.matrix.nodes[this.curnode];
      const target = node.links[linkIndex];
      if (target === undefined || !this.matrix.nodes[target]) return;
      if (this.matrix.nodes[target].kind === 'MAT' || this.matrix.nodes[target].kind === 'CRA') {
        this.jackOutInternal();
        return;
      }
      if (this.range !== RANGE_CONTACT) {
        this.emit('log', 'You must be at contact range to take an exit.');
        return;
      }
      if (this.blockedByIce()) {
        this.emit('bad', '* IC blocks your way.');
        return;
      }
      if (this.nodes[target].locked > 0) {
        this.emit('log', `${this.nodeLabel(target)} is locked (${this.nodes[target].locked} turns).`);
        return;
      }
      if (this.engagedIce().some((ice) => ice.satisfaction >= SAT_YELLING)) {
        this.raiseAlert();
      }
      this.lastnode = this.curnode;
      this.curnode = target;
      this.range = RANGE_OBSERVATION;
      if (this.nodes[target].visited === 0) this.nodes[target].visited = -1;
      this.emit('move', `You slide along the datatrail into ${this.nodeLabel(target)}.`);
    });
  }

  jackOut(): void {
    if (!this.isDeckerTurn) return;
    this.jackOutInternal();
  }

  private jackOutInternal(): void {
    const blackAttacking = this.engagedIce().some(
      (ice) => ice.code === 'Black' && ice.satisfaction >= SAT_YELLING,
    );
    if (blackAttacking) {
      this.combat.hangTough = true;
      const test = this.rules.successTest(this.decker.willpower, 6);
      if (test.successes === 0) {
        this.emit('bad', 'The Black IC holds your mind in the matrix — you cannot jack out!');
        this.deckerIni -= 10;
        this.runIceUntilDeckerTurn();
        return;
      }
      this.emit('end', 'You tear yourself free of the Black IC and jack out.');
      this.dump('jacked-out', true);
      return;
    }
    this.emit('end', 'You jack out clean. The matrix fades.');
    this.outcome = 'jacked-out';
  }

  analyze(): void {
    this.deckerAction(false, () => {
      const program = this.program('analy');
      if (!program) {
        this.emit('log', 'No Analyze utility loaded.');
        return;
      }
      const node = this.matrix.nodes[this.curnode];
      const runtime = this.nodes[this.curnode];
      const net = this.utilityTestVsNode(program, runtime.anaTarget);
      if (net < 0) {
        runtime.anaTarget += 2;
        this.emit('log', 'Analyze fails — the node shifts its geometry. Difficulty rises.');
        return;
      }
      runtime.visited = net >= 2 ? -2 : -1;
      if (net >= 2) runtime.anaTarget = -1000;
      this.emit('good', `Analyze: ${node.kind} ${node.color}-${node.rating}${node.mesg ? ` — "${node.mesg}"` : ''}.`);
      const hidden = this.ice.filter((ice) => ice.nodenr === this.curnode && !ice.known);
      if (net >= 4) {
        hidden.forEach((ice) => { ice.known = true; });
        if (hidden.length) this.emit('good', `All IC revealed: ${hidden.map((i) => this.iceLabel(i)).join(', ')}.`);
        else this.emit('good', 'No hidden IC in this node.');
      } else if (net >= 3 && hidden.length > 0) {
        hidden[0].known = true;
        this.emit('good', `IC revealed: ${this.iceLabel(hidden[0])}.`);
      }
    });
  }

  private utilityTestVsNode(program: Program, addTarget: number): number {
    const node = this.matrix.nodes[this.curnode];
    if (addTarget < -900) return 4;
    const dice = this.rules.programDice(program.rating, this.combat);
    const test = this.rules.successTest(dice, node.rating + this.rules.deckerMod(this.combat) + addTarget);
    const opp = this.rules.oppositionTest(node.rating, this.rules.effectiveEvasion(this.deck, this.combat));
    const colnr = colorNumber(node.color);
    if (test.successes < opp.successes) return -2;
    return test.successes - opp.successes - colnr;
  }

  browse(): void {
    this.deckerAction(false, () => {
      const program = this.program('browse');
      if (!program) {
        this.emit('log', 'No Browse utility loaded.');
        return;
      }
      const runtime = this.nodes[this.curnode];
      const net = this.utilityTestVsNode(program, runtime.browseTarget);
      if (net < 0) {
        runtime.browseTarget += 2;
        this.emit('log', 'Browse fails — index scrambled. Difficulty rises.');
        return;
      }
      runtime.filesKnown = true;
      if (runtime.files.length === 0) {
        this.emit('log', 'Browse: no data files in this node.');
      } else {
        this.emit('good', `Browse: ${runtime.files.map((f) => `"${f.name}" ${f.sizeMp}Mp`).join(', ')}.`);
      }
    });
  }

  download(fileIndex: number): void {
    this.deckerAction(false, () => {
      const runtime = this.nodes[this.curnode];
      const file = runtime.files[fileIndex];
      if (!file) return;
      if (this.range !== RANGE_CONTACT) {
        this.emit('log', 'You need contact range to transfer files.');
        return;
      }
      const tics = Math.max(1, Math.ceil(file.sizeMp / this.deck.io));
      this.busyTics = tics;
      this.busyLabel = `Downloading "${file.name}"`;
      this.pendingDownload = { nodeIndex: this.curnode, fileIndex };
      this.emit('system', `Transfer started: "${file.name}" — ${tics} turn(s) at I/O ${this.deck.io}.`);
    });
  }

  sleaze(): void {
    this.deckerAction(false, () => {
      const program = this.program('sleaze');
      if (!program) {
        this.emit('log', 'No Sleaze utility loaded.');
        return;
      }
      const target = this.appropriateIce();
      if (!target) {
        this.emit('log', 'No IC here needs sleazing.');
        return;
      }
      const node = this.matrix.nodes[this.curnode];
      const dice = this.rules.programDice(program.rating, this.combat);
      const test = this.rules.successTest(dice, node.rating + this.rules.deckerMod(this.combat) + this.modSleaze);
      const opp = this.rules.oppositionTest(
        this.rules.iceDice(target.rating, this.combat),
        this.rules.effectiveMasking(this.deck, this.combat) + this.rules.iceMod(target, this.combat),
      );
      const net = test.successes - opp.successes - colorNumber(node.color);
      if (net >= 0) {
        for (const ice of this.engagedIce()) {
          if (ice.satisfaction >= SAT_LOOK && ice.satisfaction < SAT_SUSPICIOUS) ice.satisfaction = SAT_SLEAZED;
        }
        this.modSleaze++;
        this.emit('good', 'Your sleaze wraps around you — the IC looks right through you.');
      } else {
        this.modSleaze += 2;
        this.emit('bad', `${this.iceLabel(target)} is not fooled.`);
      }
    });
  }

  deception(): void {
    this.deckerAction(false, () => {
      const program = this.program('decep');
      if (!program) {
        this.emit('log', 'No Deception utility loaded.');
        return;
      }
      const target = this.appropriateIce();
      if (!target) {
        this.emit('log', 'No IC here to deceive.');
        return;
      }
      const node = this.matrix.nodes[this.curnode];
      const dice = this.rules.programDice(program.rating, this.combat);
      const test = this.rules.successTest(dice, node.rating + this.rules.deckerMod(this.combat));
      const opp = this.rules.oppositionTest(
        this.rules.iceDice(target.rating, this.combat),
        this.rules.effectiveMasking(this.deck, this.combat) + this.rules.iceMod(target, this.combat),
      );
      const net = test.successes - opp.successes - colorNumber(node.color);
      if (net >= 0) {
        target.satisfaction = SAT_DECEPTED;
        this.emit('good', `${this.iceLabel(target)} accepts your forged passcode.`);
      } else {
        target.satisfaction = Math.max(target.satisfaction, SAT_SUSPICIOUS);
        this.emit('bad', `${this.iceLabel(target)} rejects the forgery — it is suspicious!`);
      }
    });
  }

  attack(iceId: number): void {
    this.deckerAction(false, () => {
      const ice = this.ice.find((i) => i.id === iceId);
      const program = this.program('attack');
      if (!ice || !program) return;
      const node = this.matrix.nodes[this.curnode];
      ice.known = true;
      // execution test, once per node
      if (this.runningUtil.get('attack') !== this.curnode) {
        const exec = this.utilityTestVsNode(program, this.modAttack);
        if (exec < 0) {
          this.modAttack += 2;
          this.emit('log', 'Attack utility fails to execute — difficulties increase.');
          return;
        }
        this.runningUtil.set('attack', this.curnode);
      }
      const dice = this.rules.programDice(program.rating, this.combat);
      const test = this.rules.successTest(dice, node.rating + this.rules.deckerMod(this.combat));
      const frozen = ice.satisfaction === SAT_FROZEN;
      const defense =
        ice.code === 'White' || frozen
          ? { successes: 0, rolls: [] }
          : this.rules.oppositionTest(this.rules.iceDice(ice.rating, this.combat), node.rating);
      const net = test.successes - defense.successes - colorNumber(node.color);
      ice.satisfaction = Math.max(ice.satisfaction, SAT_YELLING);
      this.raiseAlert();
      if (net < 0) {
        this.emit('combat', `Your attack splashes off ${this.iceLabel(ice)}.`);
        return;
      }
      const baseLevel = this.attackDamageLevel(program);
      const damage = DAMAGE_BOXES[baseLevel] + net - 1;
      ice.damage += Math.max(0, damage);
      ice.succattacked = true;
      this.emit('combat', `You hit ${this.iceLabel(ice)} for ${damage} boxes.`);
      if (ice.damage >= 10) {
        ice.activeLevel = 4;
        this.emit('good', `${this.iceLabel(ice)} shatters into dead code.`);
      }
    });
  }

  private attackDamageLevel(program: Program): number {
    const match = program.name.match(/\((L|M|S|D)\)/i);
    if (match) return 'LMSD'.indexOf(match[1].toUpperCase());
    return 1;
  }

  slow(iceId: number): void {
    this.deckerAction(false, () => {
      const ice = this.ice.find((i) => i.id === iceId);
      const program = this.program('slow');
      if (!ice || !program) {
        this.emit('log', 'No Slow utility loaded.');
        return;
      }
      const node = this.matrix.nodes[this.curnode];
      ice.known = true;
      const dice = this.rules.programDice(program.rating, this.combat);
      const test = this.rules.successTest(dice, node.rating + this.rules.deckerMod(this.combat));
      const opp = this.rules.oppositionTest(
        this.rules.iceDice(ice.rating, this.combat),
        this.rules.effectiveEvasion(this.deck, this.combat) + this.rules.iceMod(ice, this.combat),
      );
      const net = test.successes - opp.successes - colorNumber(node.color) - 1;
      ice.satisfaction = Math.max(ice.satisfaction, SAT_YELLING);
      this.raiseAlert();
      if (net > 0) {
        ice.freezemod += net;
        ice.succslowed = true;
        this.emit('good', `${this.iceLabel(ice)} stutters — its code crystallizes (+${net} freeze).`);
      } else {
        this.emit('combat', `${this.iceLabel(ice)} shakes off the slow.`);
      }
    });
  }

  runDefense(name: 'armor' | 'cloak' | 'mirrors' | 'shield' | 'smoke' | 'medic'): void {
    this.deckerAction(false, () => {
      const program = this.program(name === 'mirrors' ? 'mirror' : name);
      if (!program) {
        this.emit('log', `No ${name} utility loaded.`);
        return;
      }
      switch (name) {
        case 'armor':
          this.combat.addBod = program.rating;
          this.emit('system', `Armor-${program.rating} hardens your persona.`);
          break;
        case 'cloak':
          this.combat.addMask = program.rating;
          this.emit('system', `Cloak-${program.rating} blurs your signature.`);
          break;
        case 'mirrors':
          this.combat.addEva = program.rating;
          this.emit('system', `Mirrors-${program.rating} split your image.`);
          break;
        case 'shield':
          this.combat.shieldActive = true;
          this.combat.modShield = program.rating;
          this.emit('system', `Shield-${program.rating} raised.`);
          break;
        case 'smoke':
          this.combat.modSmoke = program.rating;
          this.emit('system', `Smoke-${program.rating} floods the node — everyone is blind.`);
          break;
        case 'medic': {
          const tn = this.combat.deckDamage >= 6 ? 6 : this.combat.deckDamage >= 3 ? 5 : 4;
          const test = this.rules.successTest(program.rating, tn);
          const healed = Math.min(this.combat.deckDamage, test.successes);
          this.combat.deckDamage -= healed;
          this.emit(healed > 0 ? 'good' : 'log', `Medic patches ${healed} boxes of deck damage.`);
          break;
        }
      }
    });
  }

  systemOp(op: string, arg?: number): void {
    this.deckerAction(false, () => {
      const node = this.matrix.nodes[this.curnode];
      const runtime = this.nodes[this.curnode];
      if (this.range !== RANGE_CONTACT) {
        this.emit('log', 'System operations require contact range.');
        return;
      }
      if (this.blockedByIce()) {
        this.emit('bad', '* IC blocks the operation.');
        return;
      }
      if (op === 'see-system') {
        const kinds = this.matrix.nodes.slice(1).map((n) => n.kind).join(', ');
        this.emit('system', `System architecture: ${kinds}.`);
        return;
      }
      const colnr = colorNumber(node.color);
      const dice = this.rules.programDice(this.decker.computer, this.combat);
      const tn = (op === 'back-door' ? 2 * node.rating : node.rating) + runtime.failSysop + this.rules.deckerMod(this.combat);
      const test = this.rules.successTest(dice, tn);
      const net = test.successes - colnr;
      if (net <= 0) {
        runtime.failSysop++;
        this.emit('log', `Operation failed — the system logs the attempt (TN now +${runtime.failSysop}).`);
        return;
      }
      switch (op) {
        case 'cancel-alert':
          if (this.combat.alert === 1) {
            this.combat.alert = 0;
            this.emit('good', 'Passive alert cancelled. The system relaxes.');
          } else if (this.combat.alert === 2) {
            this.emit('log', 'Active alerts cannot be cancelled from here.');
          } else {
            this.emit('log', 'No alert to cancel.');
          }
          break;
        case 'display-map':
          this.nodes.forEach((n) => { n.visited = -2; });
          this.emit('good', 'System map dumped to your deck — full grid revealed.');
          break;
        case 'shutdown':
          this.shutdowntics = this.rules.shutdownTics(net);
          this.emit('alert', `Shutdown sequence engaged — system dies in ${this.shutdowntics} turns.`);
          break;
        case 'change-node': {
          const target = arg ?? -1;
          if (target >= 1 && target < this.matrix.nodes.length && this.matrix.nodes[target].kind !== 'LNK') {
            this.lastnode = this.curnode;
            this.curnode = target;
            this.range = RANGE_CONTACT;
            if (this.nodes[target].visited === 0) this.nodes[target].visited = -1;
            for (const ice of this.activeIceHere()) ice.satisfaction = SAT_DECEPTED;
            this.emit('move', `Legal signal rerouted — you materialize in ${this.nodeLabel(target)}.`);
          }
          break;
        }
        case 'lockout':
          runtime.locked = Math.max(1, this.decker.computer + net);
          this.emit('good', `Node locked for ${runtime.locked} turns — IC cannot enter.`);
          break;
        case 'read-file': {
          const file = runtime.files[arg ?? 0];
          if (file) this.emit('system', `"${file.name}": ${file.sizeMp} Mp, appraised at ${file.value}¥.`);
          runtime.filesKnown = true;
          break;
        }
        case 'erase-file': {
          const file = runtime.files[arg ?? 0];
          if (file) {
            runtime.files.splice(arg ?? 0, 1);
            this.emit('system', `"${file.name}" wiped from the datastore.`);
          }
          break;
        }
        case 'control':
          this.emit('system', `You seize control of the slaved system${node.mesg ? `: ${node.mesg}` : ''}.`);
          break;
        case 'sensor-readout':
          this.emit('system', `Sensor readout${node.mesg ? `: ${node.mesg}` : ' captured'}.`);
          break;
        case 'display-message':
          this.emit('system', node.mesg ? `Message: "${node.mesg}"` : 'No message on this port.');
          break;
        default:
          this.emit('log', `Operation ${op} not supported.`);
      }
    });
  }
}
