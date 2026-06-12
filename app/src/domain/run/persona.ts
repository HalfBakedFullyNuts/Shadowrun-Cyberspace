// Decker, cyberdeck and utility program model (port of deckertype/cyberdecktype)
// plus .DEK / .NPC INI parsers so original character files load.

export interface Program {
  name: string;
  rating: number;
}

export interface Cyberdeck {
  model: string;
  mpcp: number;
  bod: number;
  evasion: number;
  masking: number;
  sensor: number;
  hardening: number;
  activeMem: number;
  storageMem: number;
  load: number;
  io: number;
  response: number;
  programs: Program[];
}

export interface Decker {
  name: string;
  body: number;
  quickness: number;
  strength: number;
  charisma: number;
  intelligence: number;
  willpower: number;
  computer: number;
  etiqMatrix: number;
  /** Base reaction bonus, e.g. 3 from "Reaction=3+1D6". */
  reaction: number;
  /** Reaction dice, e.g. 1 from "3+1D6". */
  reactDice: number;
  hackingPool: number;
  karma: number;
}

export function defaultDeck(): Cyberdeck {
  return {
    model: 'Fairlight Excalibur',
    mpcp: 12, bod: 9, evasion: 9, masking: 9, sensor: 9,
    hardening: 5, activeMem: 500, storageMem: 1000, load: 100, io: 50, response: 0,
    programs: [
      { name: 'Attack', rating: 7 },
      { name: 'Sleaze', rating: 7 },
      { name: 'Deception', rating: 7 },
      { name: 'Analyze', rating: 7 },
      { name: 'Browse', rating: 5 },
      { name: 'Armor', rating: 5 },
      { name: 'Cloak', rating: 5 },
      { name: 'Shield', rating: 5 },
      { name: 'Medic', rating: 5 },
      { name: 'Slow', rating: 5 },
    ],
  };
}

export function defaultDecker(): Decker {
  return {
    name: 'Fastjack Jr.',
    body: 4, quickness: 5, strength: 3, charisma: 3, intelligence: 6, willpower: 5,
    computer: 6, etiqMatrix: 3,
    reaction: 5, reactDice: 2,
    hackingPool: 11, // (int + computer) — hacking pool = MatR + Computer per README FAQ
    karma: 3,
  };
}

function parseIni(text: string): Map<string, Map<string, string>> {
  const sections = new Map<string, Map<string, string>>();
  let current: Map<string, string> | null = null;
  for (const rawLine of text.split(/\r\n|\n|\r/)) {
    const line = rawLine.trim();
    if (!line) continue;
    const sectionMatch = line.match(/^\[(.+)\]$/);
    if (sectionMatch) {
      current = new Map();
      sections.set(sectionMatch[1].toUpperCase(), current);
      continue;
    }
    const eq = line.indexOf('=');
    if (eq > 0 && current) current.set(line.slice(0, eq).trim().toUpperCase(), line.slice(eq + 1).trim());
  }
  return sections;
}

/** Parse an original .DEK cyberdeck file. */
export function parseDek(text: string): Cyberdeck {
  const sections = parseIni(text);
  const persona = sections.get('PERSONA') ?? new Map<string, string>();
  const tech = sections.get('TECHNICAL PARAMETERS') ?? new Map<string, string>();
  const utils = sections.get('UTILITIES') ?? new Map<string, string>();
  const deck = defaultDeck();
  deck.model = persona.get('MODEL') ?? deck.model;
  deck.mpcp = parseInt(persona.get('MPCP') ?? '6', 10) || 6;
  deck.bod = parseInt(persona.get('BOD') ?? '4', 10) || 0;
  deck.evasion = parseInt(persona.get('EVASION') ?? '4', 10) || 0;
  deck.masking = parseInt(persona.get('MASKING') ?? '4', 10) || 0;
  deck.sensor = parseInt(persona.get('SENSOR') ?? '4', 10) || 0;
  deck.hardening = parseInt(tech.get('HARDENING') ?? '0', 10) || 0;
  deck.activeMem = parseInt(tech.get('ACTIVEMEM') ?? '200', 10) || 0;
  deck.storageMem = parseInt(tech.get('STORAGEMEM') ?? '500', 10) || 0;
  deck.load = parseInt(tech.get('LOAD') ?? '100', 10) || 0;
  deck.io = parseInt(tech.get('I/O') ?? '20', 10) || 20;
  deck.response = parseInt(tech.get('RESPONSE') ?? '0', 10) || 0;
  deck.programs = [];
  for (let i = 1; i <= 64; i++) {
    const raw = utils.get(`PROGRAM${i}`);
    if (!raw) break;
    const match = raw.match(/^(.*)-(\d+)$/);
    if (match) deck.programs.push({ name: match[1].trim(), rating: parseInt(match[2], 10) });
  }
  return deck;
}

/** Parse an original .NPC decker file. */
export function parseNpc(text: string): Decker {
  const sections = parseIni(text);
  const char = sections.get('CHARACTER') ?? new Map<string, string>();
  const attrs = sections.get('ATTRIBUTES') ?? new Map<string, string>();
  const skills = sections.get('SKILLS') ?? new Map<string, string>();
  const pools = sections.get('DICE POOLS') ?? new Map<string, string>();
  const decker = defaultDecker();
  decker.name = char.get('NAME') ?? decker.name;
  decker.body = parseInt(attrs.get('BODY') ?? '3', 10) || 3;
  decker.quickness = parseInt(attrs.get('QUICKNESS') ?? '3', 10) || 3;
  decker.strength = parseInt(attrs.get('STRENGTH') ?? '3', 10) || 3;
  decker.charisma = parseInt(attrs.get('CHARISMA') ?? '3', 10) || 3;
  decker.intelligence = parseInt(attrs.get('INTELLIGENCE') ?? '3', 10) || 3;
  decker.willpower = parseInt(attrs.get('WILLPOWER') ?? '3', 10) || 3;
  const reaction = (attrs.get('REACTION') ?? '3+1D6').match(/^(\d+)\s*\+\s*(\d+)D6$/i);
  decker.reaction = reaction ? parseInt(reaction[1], 10) : 3;
  decker.reactDice = reaction ? parseInt(reaction[2], 10) : 1;
  decker.computer = parseInt(skills.get('COMPUTER/SOFTWARE/DECKING') ?? '3', 10) || 3;
  decker.etiqMatrix = parseInt(skills.get('ETIQUETTE/MATRIX') ?? '1', 10) || 1;
  decker.karma = parseInt(pools.get('KARMA') ?? '0', 10) || 0;
  // Hacking pool = Matrix Reaction + Computer skill (per original FAQ §14)
  decker.hackingPool = decker.intelligence + decker.computer;
  return decker;
}
