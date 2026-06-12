// Consistency checks and SR2/VR1.0 rules audit — port of TestMatrix and
// MatrixStatistic (MATED0.BAS) with NODELIM.DAT tables embedded as data.
import { Matrix, NodeKind, allIce, colorNumber } from './types';

export interface Finding {
  severity: 'error' | 'warning' | 'info';
  message: string;
  nodeIndex?: number;
}

const SECURITY_NAMES = [
  'no security',
  'low security (libraries, telecom)',
  'med security (government, underworld, most corporate)',
  'high security (Megacorps, financial, major crime)',
  'ultra security (most vital Megacorps, military systems)',
];

// NODELIM.DAT block 1 — [min,max] of m=(colnr-1)*10+rating per security tier (rows)
// and node category (cols: DLJ/SM, IOP, CPU/SAN, DS/SPU, LNK).
const NODE_LIMITS: [number, number][][] = [
  [[1, 2], [4, 4], [12, 14], [13, 21], [21, 24]],
  [[3, 3], [11, 13], [15, 25], [22, 31], [25, 32]],
  [[4, 4], [14, 15], [26, 27], [32, 35], [33, 37]],
  [[3, 4], [11, 15], [15, 27], [22, 35], [25, 37]],
  [[0, 0], [0, 0], [0, 0], [0, 0], [0, 0]],
];

// NODELIM.DAT block 2 — legal connections, order: CPU DS IOP SM SPU SAN MAT DLJ LNK.
const CONNECTION_ORDER = ['CPU', 'DS', 'IOP', 'SM', 'SPU', 'SAN', 'MAT', 'DLJ', 'LNK'];
const LEGAL_CONNECTIONS: number[][] = [
  [0, 1, 1, 1, 1, 1, 0, 1, 0],
  [1, 1, 0, 0, 1, 0, 0, 1, 0],
  [1, 0, 0, 0, 1, 0, 1, 1, 1],
  [1, 0, 0, 0, 1, 0, 0, 1, 0],
  [1, 1, 1, 1, 1, 1, 0, 1, 0],
  [1, 1, 0, 0, 1, 0, 1, 1, 1],
  [0, 0, 1, 0, 0, 1, 0, 0, 0],
  [1, 1, 1, 1, 1, 1, 1, 1, 0],
  [0, 0, 1, 0, 0, 1, 0, 0, 0],
];

function connectionIndex(kind: NodeKind): number {
  switch (kind) {
    case 'CPU': return 0;
    case 'DS': return 1;
    case 'IOP': return 2;
    case 'SM': case 'SN': return 3;
    case 'SPU': return 4;
    case 'SAN': return 5;
    case 'MAT': case 'CRA': return 6;
    case 'DLJ': return 7;
    case 'LNK': return 8;
    default: return -1;
  }
}

/** Category column for the security tier table (MatrixStatistic idx). */
function limitCategory(kind: NodeKind): number {
  switch (kind) {
    case 'DLJ': case 'SM': case 'SN': return 0;
    case 'IOP': return 1;
    case 'CPU': case 'SAN': return 2;
    case 'DS': case 'SPU': return 3;
    case 'LNK': return 4;
    default: return -1;
  }
}

/** Structural checks (TestMatrix). Mutates nothing; reports repairs the original would auto-apply. */
export function checkStructure(matrix: Matrix): Finding[] {
  const findings: Finding[] = [];
  const n = matrix.nodes.length - 1;

  if (n <= 0) {
    findings.push({ severity: 'error', message: 'No grid at all. Zero nodes.' });
    return findings;
  }
  if (matrix.entry > n || matrix.entry < 1) {
    findings.push({ severity: 'error', message: 'Entry node is not in this Matrix.' });
  } else if (matrix.nodes[matrix.entry].kind === 'LNK') {
    findings.push({ severity: 'error', message: 'Entry node is a LinkLoad node. This does not make sense.', nodeIndex: matrix.entry });
  }

  matrix.nodes.forEach((node, i) => {
    if (node.links.length === 0) {
      findings.push({ severity: 'error', message: `${node.kind}${i} has no connection at all!`, nodeIndex: i });
      return;
    }
    for (const target of node.links) {
      const other = matrix.nodes[target];
      if (!other) {
        findings.push({ severity: 'error', message: `Node${i}: link to ${target} is out of this grid!`, nodeIndex: i });
      } else if (!other.links.includes(i) && target > 0 && other.kind !== 'MAT') {
        findings.push({ severity: 'warning', message: `Back link from ${other.kind}${target} to ${node.kind}${i} is missing.`, nodeIndex: target });
      }
    }
  });

  for (let i = 1; i < matrix.nodes.length - 1; i++) {
    for (let k = i + 1; k < matrix.nodes.length; k++) {
      if (matrix.nodes[i].x === matrix.nodes[k].x && matrix.nodes[i].y === matrix.nodes[k].y) {
        findings.push({ severity: 'error', message: `Nodes ${i} and ${k} have the same position!`, nodeIndex: i });
      }
    }
  }
  return findings;
}

/** Rules audit (MatrixStatistic). */
export function auditRules(matrix: Matrix): Finding[] {
  const findings: Finding[] = [];
  const tierCounts = [0, 0, 0, 0, 0];
  const n = matrix.nodes.length - 1;

  for (let i = 1; i <= n; i++) {
    const node = matrix.nodes[i];
    if (node.kind === 'MAT' || node.kind === 'CRA') continue;
    const m = (colorNumber(node.color) - 1) * 10 + node.rating;
    if (node.kind !== 'LNK') {
      if (m >= 5 && m <= 10) {
        findings.push({ severity: 'warning', message: `Node ${i}: only Blue 1-4 possible.`, nodeIndex: i });
        continue;
      } else if (m >= 16 && m <= 20) {
        findings.push({ severity: 'warning', message: `Node ${i}: only Green 1-5 possible.`, nodeIndex: i });
        continue;
      } else if (m >= 28 && m <= 30) {
        findings.push({ severity: 'warning', message: `Node ${i}: only Orange 1-7 possible.`, nodeIndex: i });
        continue;
      } else if (m >= 38) {
        findings.push({ severity: 'warning', message: `Node ${i}: Red 8 or higher is exaggerated.`, nodeIndex: i });
        continue;
      } else if (node.rating >= 10) {
        findings.push({ severity: 'warning', message: `Node ${i}: system rating is extremely exaggerated.`, nodeIndex: i });
        continue;
      }
    }
    const category = limitCategory(node.kind);
    if (category < 0) continue;
    let fits = false;
    for (let tier = 0; tier < 5; tier++) {
      const [lo, hi] = NODE_LIMITS[tier][category];
      if (lo > 0 && m >= lo && m <= hi) {
        tierCounts[tier]++;
        fits = true;
      }
    }
    if (!fits) {
      findings.push({ severity: 'warning', message: `Node ${i} does not fit the color/rate scheme.`, nodeIndex: i });
    }
  }
  findings.push({
    severity: 'info',
    message: `${tierCounts.join('/')} of ${n} nodes with no/low/med/high/ultra security.`,
  });
  const dominant = Math.max(...tierCounts);
  if (dominant > 0) {
    findings.push({ severity: 'info', message: `Dominant profile: ${SECURITY_NAMES[tierCounts.indexOf(dominant)]}.` });
  }

  // Illegal connection types
  matrix.nodes.forEach((node, i) => {
    const a = connectionIndex(node.kind);
    for (const target of node.links) {
      const other = matrix.nodes[target];
      if (!other) continue;
      const b = connectionIndex(other.kind);
      if (a >= 0 && b >= 0 && LEGAL_CONNECTIONS[a][b] === 0) {
        findings.push({
          severity: 'warning',
          message: `Connection ${node.kind}(${i}) <-> ${CONNECTION_ORDER[b]}(${target}) is illegal.`,
          nodeIndex: i,
        });
      }
    }
  });

  // Colors above Red
  const exotic = matrix.nodes.filter((node, i) => i > 0 && colorNumber(node.color) > 4).length;
  if (exotic > 0) {
    findings.push({ severity: 'warning', message: `System has ${exotic} nodes with color above Red!` });
  }

  // CPU presence + ICE budget (VR 1.0 p. 23)
  let cpuBudget = 0;
  for (let i = 1; i <= n; i++) {
    const node = matrix.nodes[i];
    if (node.kind === 'CPU') cpuBudget += 2 * node.rating * colorNumber(node.color);
  }
  if (cpuBudget === 0) {
    findings.push({ severity: 'error', message: 'System has no CPU!' });
  }
  const ice = allIce(matrix);
  const whiteGraySum = ice.filter((e) => e.ice.code !== 'Black').reduce((sum, e) => sum + e.ice.rating, 0);
  if (cpuBudget < whiteGraySum) {
    findings.push({
      severity: 'warning',
      message: `Too much White+Gray ICE for the system! Sum of ratings is ${whiteGraySum}, maximum is ${cpuBudget}.`,
    });
  }

  const everSum = ice.filter((e) => e.ice.activity === 'ever').reduce((sum, e) => sum + e.ice.rating, 0);
  if (whiteGraySum === 0 && ice.length === 0) {
    findings.push({ severity: 'info', message: 'There is no ICE at all.' });
  } else if (whiteGraySum > 0) {
    findings.push({
      severity: 'info',
      message: `${Math.round((100 * everSum) / whiteGraySum)}% of all ICE ratings are normally active (should be ~25%).`,
    });
  }
  if (ice.some((e) => e.ice.rating > 12)) {
    findings.push({ severity: 'warning', message: 'Some ICE has rating higher than 12.' });
  }
  if (ice.some((e) => colorNumber(matrix.nodes[e.nodeIndex].color) === 1)) {
    findings.push({ severity: 'warning', message: 'Some ICE in a Blue node.' });
  }
  if (ice.some((e) => matrix.nodes[e.nodeIndex].kind === 'LNK')) {
    findings.push({ severity: 'warning', message: 'Some ICE in a LinkLoad pseudo node.' });
  }
  return findings;
}

export function validateMatrix(matrix: Matrix): Finding[] {
  return [...checkStructure(matrix), ...auditRules(matrix)];
}
