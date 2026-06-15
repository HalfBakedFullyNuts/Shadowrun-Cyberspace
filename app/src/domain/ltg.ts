// LTG text format parser/serializer — faithful port of SaveLTG/StrToNode/StrToICE/StrToLinks
// from MATED0.BAS so files round-trip with the original 1996 programs.
import {
  Matrix,
  MatrixNode,
  Ice,
  IceCode,
  IceMobility,
  IceActivity,
  NodeColor,
  AlertLevel,
  NODE_THEMES,
  NodeTheme,
  createEmptyMatrix,
} from './types';

/** Accept a persisted theme key only if it is a known non-default theme. */
function parseTheme(raw: string | undefined): NodeTheme | undefined {
  const value = (raw ?? '').trim().toLowerCase();
  return value && value !== 'default' && (NODE_THEMES as readonly string[]).includes(value)
    ? (value as NodeTheme)
    : undefined;
}

function parseColor(raw: string): NodeColor | '' {
  switch (raw.trim().toUpperCase().charAt(0)) {
    case 'B': return 'Blue';
    case 'G': return 'Green';
    case 'O': return 'Orange';
    case 'R': return 'Red';
    case 'P': return 'Purple';
    case 'D': return 'Dark';
    default: return '';
  }
}

/** Port of StrToICE: "Gray Killer (M)-9 passive immobile damage 4" */
export function parseIceString(raw: string): Ice | null {
  const trimmed = raw.trim();
  if (!trimmed) return null;
  const firstSpace = trimmed.indexOf(' ');
  if (firstSpace < 0) return null;
  let codeRaw = trimmed.slice(0, firstSpace);
  let rest = trimmed.slice(firstSpace + 1);

  let code: IceCode = 'White';
  let mobility: IceMobility = 'immobile';
  let activity: IceActivity = 'ever';
  switch (codeRaw.toUpperCase()) {
    case 'WHITE':
      code = 'White'; mobility = 'immobile'; activity = 'ever';
      break;
    case 'GRAY':
    case 'GREY':
      code = 'Gray'; mobility = 'pmobile'; activity = 'passive';
      break;
    case 'BLACK':
      code = 'Black'; mobility = 'pmobile'; activity = 'passive';
      break;
  }

  // description runs to the last '-' before the rating number
  const dashMatch = rest.match(/^(.*?)-(\d+)\s*(.*)$/);
  if (!dashMatch) return null;
  const type = dashMatch[1].trim();
  const rating = parseInt(dashMatch[2], 10);
  let options = dashMatch[3].trim();

  const ice: Ice = { code, type, rating, mobility, activity, ptrigger: -1, atrigger: -1, damage: 0, freezemod: 0 };

  const words = options.length > 0 ? options.split(/\s+/) : [];
  for (let i = 0; i < words.length; i++) {
    const word = words[i].toUpperCase();
    const arg = () => parseInt(words[i + 1] ?? '0', 10);
    switch (word) {
      case 'MOBILE': ice.mobility = 'mobile'; break;
      case 'PMOBILE': ice.mobility = 'pmobile'; break;
      case 'AMOBILE': ice.mobility = 'amobile'; break;
      case 'IMMOBILE': ice.mobility = 'immobile'; break;
      case 'EVER': ice.activity = 'ever'; break;
      case 'PASSIVE': ice.activity = 'passive'; break;
      case 'ACTIVE': ice.activity = 'active'; break;
      case 'TRIGGERED': ice.activity = 'triggered'; break;
      case 'PTRIGGER': ice.ptrigger = arg(); i++; break;
      case 'ATRIGGER': ice.atrigger = arg(); i++; break;
      case 'DAMAGE': {
        let damage = arg();
        i++;
        if (damage < 0) {
          if (damage === -100) {
            ice.freezemod = 100;
            ice.damage = 0;
          } else {
            ice.freezemod = Math.floor(-damage / 16);
            ice.damage = -damage % 16;
          }
        } else {
          ice.damage = damage;
        }
        break;
      }
    }
  }
  return ice;
}

/** Port of GetICEsavestr (without the angle re-sort side effects). */
export function serializeIce(ice: Ice, orderOf: (globalIndex: number) => number): string {
  let out = `${ice.code} ${ice.type}-${ice.rating}`;
  const defaultMobility: IceMobility = ice.code === 'White' ? 'immobile' : 'pmobile';
  if (ice.mobility !== defaultMobility) out += ` ${ice.mobility}`;
  const defaultActivity: IceActivity = ice.code === 'White' ? 'ever' : 'passive';
  if (ice.activity !== defaultActivity) out += ` ${ice.activity}`;
  if (ice.ptrigger !== -1) {
    out += ` ptrigger ${ice.ptrigger >= 0 ? orderOf(ice.ptrigger) : ice.ptrigger}`;
  }
  if (ice.atrigger !== -1) {
    out += ` atrigger ${ice.atrigger >= 0 ? orderOf(ice.atrigger) : ice.atrigger}`;
  }
  if (ice.damage > 0 && ice.freezemod === 0) {
    out += ` Damage ${ice.damage}`;
  } else if (ice.freezemod === 100) {
    out += ' Damage -100';
  } else if (ice.damage > 0 || ice.freezemod > 0) {
    const dmg = Math.min(ice.damage, 10);
    out += ` Damage ${-(dmg + ice.freezemod * 16)}`;
  }
  return out;
}

function parseIniSections(text: string): Map<string, Map<string, string>> {
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
    if (eq > 0 && current) {
      current.set(line.slice(0, eq).trim().toUpperCase(), line.slice(eq + 1));
    }
  }
  return sections;
}

export interface ParseResult {
  matrix: Matrix;
  warnings: string[];
}

/** Parse an .ltg/.rtg file. Throws on files without a [Matrix] section. */
export function parseLtg(text: string): ParseResult {
  const warnings: string[] = [];
  const sections = parseIniSections(text);
  const head = sections.get('MATRIX');
  if (!head) throw new Error('Not a matrix grid: missing [Matrix] section');

  const matrix = createEmptyMatrix(head.get('DESCRIPTION') ?? 'Unnamed Matrix');
  const nodeCount = parseInt(head.get('NODES') ?? '0', 10);
  matrix.entry = parseInt(head.get('ENTRY') ?? '1', 10);
  matrix.range = parseInt(head.get('RANGE') ?? '2', 10);
  const alertRaw = (head.get('ALERT') ?? 'none').toLowerCase();
  matrix.alert = (['none', 'passive', 'active'].includes(alertRaw) ? alertRaw : 'none') as AlertLevel;
  const emergency = head.get('EMERGENCY');
  if (emergency) {
    const [perc, tics] = emergency.split('/').map((v) => parseFloat(v.trim()));
    if (Number.isFinite(perc) && Number.isFinite(tics)) matrix.emergency = { perc, tics };
  }
  matrix.shutdowntics = parseInt(head.get('SHUTDOWNTICS') ?? '0', 10) || 0;
  matrix.readonly = (head.get('READONLY') ?? 'No').trim().toUpperCase() === 'YES';
  matrix.ltgImagePath = head.get('LTGIMAGEPATH') ?? '';

  matrix.nodes = [];
  for (let i = 0; i <= nodeCount; i++) {
    const section = sections.get(`NODE${i}`);
    const node: MatrixNode = {
      kind: 'SPU', color: '', rating: 0, x: 0, y: 0, mesg: '', locked: 0, files: [], links: [], ice: [],
    };
    if (!section) {
      warnings.push(`Missing [Node${i}] section — empty node inserted.`);
      matrix.nodes.push(node);
      continue;
    }
    // --- Type line (StrToNode) ---
    const typeRaw = (section.get('TYPE') ?? '').trim();
    const words = typeRaw.split(/\s+/);
    node.kind = (words[0] ?? 'SPU').toUpperCase() as MatrixNode['kind'];
    if (node.kind === 'LNK') {
      node.mesg = `${words[1] ?? ''} ${words[2] ?? ''}`.trim();
      node.x = parseInt(words[3] ?? '0', 10) || 0;
      node.y = parseInt(words[4] ?? '0', 10) || 0;
    } else {
      const colorRating = words[1] ?? '';
      const dash = colorRating.indexOf('-');
      node.color = parseColor(dash >= 0 ? colorRating.slice(0, dash) : colorRating);
      if (node.color === '') warnings.push(`Node${i}: unknown color "${colorRating}".`);
      node.rating = parseInt(dash >= 0 ? colorRating.slice(dash + 1) : '0', 10) || 0;
      node.x = parseInt(words[2] ?? '0', 10) || 0;
      node.y = parseInt(words[3] ?? '0', 10) || 0;
      if ((words[4] ?? '').toUpperCase() === 'LOCKED') {
        node.locked = parseInt(words[5] ?? '0', 10) || 0;
      }
      const mesg = section.get('MESG');
      if (mesg) node.mesg = mesg;
    }
    // --- Files (StrToFiles): "name/size/value name/size/value" — names may contain spaces,
    // so scan sequentially like GetWord: up to '/', up to '/', up to ' '.
    let filesRaw = (section.get('FILES') ?? '').trim();
    let guard = 0;
    while (filesRaw.length > 0 && guard < 1000) {
      guard++;
      const slash1 = filesRaw.indexOf('/');
      if (slash1 < 0) break;
      const slash2 = filesRaw.indexOf('/', slash1 + 1);
      if (slash2 < 0) break;
      let space = filesRaw.indexOf(' ', slash2 + 1);
      if (space < 0) space = filesRaw.length;
      node.files.push({
        name: filesRaw.slice(0, slash1).trim(),
        sizeMp: parseFloat(filesRaw.slice(slash1 + 1, slash2)) || 0,
        value: parseFloat(filesRaw.slice(slash2 + 1, space)) || 0,
      });
      filesRaw = filesRaw.slice(space + 1).trim();
    }
    // --- ICE: ICEType= or ICEType1=..ICETypeN= ---
    const singleIce = section.get('ICETYPE');
    if (singleIce) {
      const ice = parseIceString(singleIce);
      if (ice) node.ice.push(ice);
    }
    for (let k = 1; k <= 100; k++) {
      const raw = section.get(`ICETYPE${k}`);
      if (!raw) break;
      const ice = parseIceString(raw);
      if (ice) node.ice.push(ice);
    }
    // --- Links (StrToLinks): "2/3/5" ---
    const linksRaw = (section.get('LINKS') ?? '').trim();
    if (linksRaw) {
      node.links = linksRaw
        .split('/')
        .map((v) => parseInt(v.trim(), 10))
        .filter((v) => Number.isFinite(v) && v >= 0 && v <= nodeCount);
    }
    const theme = parseTheme(section.get('THEME'));
    if (theme) node.theme = theme;
    matrix.nodes.push(node);
  }
  return { matrix, warnings };
}

/**
 * Port of GetLinkssavestr: order links by angle from 270° descending to -90°,
 * external matrix (MAT/CRA) always first, duplicates dropped.
 */
function sortedLinks(matrix: Matrix, nodeIndex: number): number[] {
  const node = matrix.nodes[nodeIndex];
  const entries = node.links.map((target) => {
    const other = matrix.nodes[target];
    let angle: number;
    if (other && (other.kind === 'MAT' || other.kind === 'CRA')) {
      angle = -Math.PI;
    } else if (other) {
      angle = Math.atan2(-(other.y - node.y), other.x - node.x);
    } else {
      angle = 0;
    }
    if (angle <= -0.5 * Math.PI) angle = 2 * Math.PI + angle;
    return { target, angle };
  });
  entries.sort((a, b) => a.angle - b.angle);
  const result: number[] = [];
  for (let i = entries.length - 1; i >= 0; i--) {
    if (!result.includes(entries[i].target)) result.push(entries[i].target);
  }
  return result;
}

/** Serialize to the legacy LTG text format (SaveLTG port). */
export function serializeLtg(matrix: Matrix): string {
  const lines: string[] = [];
  lines.push('[Matrix]');
  lines.push(`Description=${matrix.name}`);
  lines.push(`Nodes=${matrix.nodes.length - 1}`);
  lines.push(`Entry=${matrix.entry}`);
  lines.push(`Range=${matrix.range}`);
  lines.push(`Alert=${matrix.alert}`);
  if (matrix.emergency && matrix.emergency.perc <= 100 && matrix.emergency.tics >= 0) {
    lines.push(`Emergency=${matrix.emergency.perc}/${matrix.emergency.tics}`);
  }
  if (matrix.shutdowntics > 0) lines.push(`Shutdowntics=${matrix.shutdowntics}`);
  lines.push(`Readonly=${matrix.readonly ? 'Yes' : 'No'}`);
  if (matrix.ltgImagePath) lines.push(`LTGImagePath=${matrix.ltgImagePath}`);

  // Global save order of ICE = nodes ascending; triggers reference this order.
  const orderOf = (globalIndex: number) => globalIndex; // already stored in save order

  matrix.nodes.forEach((node, i) => {
    lines.push('');
    lines.push(`[Node${i}]`);
    if (node.kind === 'LNK') {
      lines.push(`Type=${node.kind} ${node.mesg.trim()} ${node.x} ${node.y}`);
    } else {
      let typeLine = `Type=${node.kind} ${node.color}-${node.rating} ${node.x} ${node.y}`;
      if (node.locked > 0) typeLine += ` locked ${node.locked}`;
      lines.push(typeLine);
      if (node.mesg.length > 0) lines.push(`Mesg=${node.mesg}`);
    }
    // App-only key; 1996 binaries query specific keys and ignore this one.
    if (node.theme && node.theme !== 'default') lines.push(`Theme=${node.theme}`);
    if (node.files.length > 0) {
      lines.push('Files=' + node.files.map((f) => `${f.name}/${f.sizeMp}/${f.value}`).join(' ') + ' ');
    }
    if (node.ice.length === 1) {
      lines.push(`ICEType=${serializeIce(node.ice[0], orderOf)}`);
    } else {
      node.ice.forEach((ice, k) => {
        lines.push(`ICEType${k + 1}=${serializeIce(ice, orderOf)}`);
      });
    }
    lines.push(`Links=${sortedLinks(matrix, i).join('/')}`);
  });
  return lines.join('\r\n') + '\r\n';
}
