// Domain model ported from CYBER0.BAS (nodetype, icetype, filetype) — framework-free.

export const NODE_KINDS = ['CPU', 'SPU', 'DS', 'IOP', 'SM', 'SAN', 'DLJ', 'LNK'] as const;
export type NodeKind = (typeof NODE_KINDS)[number] | 'MAT' | 'SN' | 'CRA';

export const NODE_COLORS = ['Blue', 'Green', 'Orange', 'Red', 'Purple', 'Dark'] as const;
export type NodeColor = (typeof NODE_COLORS)[number];

export const ICE_CODES = ['White', 'Gray', 'Black'] as const;
export type IceCode = (typeof ICE_CODES)[number];

// The 15 canonical SR2 / VR1.0 ICE types (icetypes() in MATED.FRM).
export const ICE_TYPES = [
  'Access',
  'Barrier',
  'Scramble',
  'Probe',
  'Killer',
  'Blaster',
  'Acid',
  'Binder',
  'Jammer',
  'Marker',
  'Tar Baby',
  'Tar Pit',
  'Trace and Report',
  'Trace and Dump',
  'Trace and Burn',
] as const;

export const ICE_MOBILITIES = ['mobile', 'pmobile', 'amobile', 'immobile'] as const;
export type IceMobility = (typeof ICE_MOBILITIES)[number];

export const ICE_ACTIVITIES = ['ever', 'passive', 'active', 'triggered'] as const;
export type IceActivity = (typeof ICE_ACTIVITIES)[number];

export type AlertLevel = 'none' | 'passive' | 'active';

export interface DataFile {
  name: string;
  sizeMp: number;
  value: number;
}

export interface Ice {
  code: IceCode;
  /** Free-form description, usually one of ICE_TYPES, may carry a damage suffix e.g. "Killer (M)". */
  type: string;
  rating: number;
  mobility: IceMobility;
  activity: IceActivity;
  /** Global ICE save-order index triggered on suspicion; -1 none, -2 all 'triggered' ICE. */
  ptrigger: number;
  /** Global ICE save-order index triggered on alarm; -1 none, -2 all 'triggered' ICE. */
  atrigger: number;
  damage: number;
  freezemod: number;
}

export interface MatrixNode {
  kind: NodeKind;
  /** Security color; empty string for LNK pseudo-nodes. */
  color: NodeColor | '';
  rating: number;
  x: number;
  y: number;
  /** Free message; for LNK nodes holds "<file.ltg> <entrynode>". */
  mesg: string;
  /** Combat tics for which a SAN stays locked. */
  locked: number;
  files: DataFile[];
  /** Indices into Matrix.nodes (bidirectional by convention; validator repairs). */
  links: number[];
  ice: Ice[];
}

export interface Matrix {
  name: string;
  /** Entry node index (1-based into nodes; node 0 is the external matrix). */
  entry: number;
  /** 0 = contact, 1 = sensor, 2 = observation. */
  range: number;
  alert: AlertLevel;
  emergency: { perc: number; tics: number } | null;
  shutdowntics: number;
  readonly: boolean;
  ltgImagePath: string;
  /** nodes[0] is always the external matrix (MAT). */
  nodes: MatrixNode[];
}

export const MAX_NODES = 100;
export const MAX_ICE = 100;
export const MAX_LINKS = 30;
export const MAX_FILES = 20;

export function createExternalMatrixNode(): MatrixNode {
  return { kind: 'MAT', color: 'Green', rating: 4, x: 0, y: 0, mesg: '', locked: 0, files: [], links: [], ice: [] };
}

export function createEmptyMatrix(name = 'New Matrix'): Matrix {
  return {
    name,
    entry: 1,
    range: 2,
    alert: 'none',
    emergency: null,
    shutdowntics: 0,
    readonly: false,
    ltgImagePath: '',
    nodes: [createExternalMatrixNode()],
  };
}

/** colnr from CYBER0: 1=Blue 2=Green 3=Orange 4=Red 5=Purple 6=Dark. 0 for colorless. */
export function colorNumber(color: NodeColor | ''): number {
  switch (color) {
    case 'Blue': return 1;
    case 'Green': return 2;
    case 'Orange': return 3;
    case 'Red': return 4;
    case 'Purple': return 5;
    case 'Dark': return 6;
    default: return 0;
  }
}

/** Flattened ICE list in legacy save order (nodes ascending, ICE order within node). */
export function allIce(matrix: Matrix): { nodeIndex: number; iceIndex: number; ice: Ice }[] {
  const out: { nodeIndex: number; iceIndex: number; ice: Ice }[] = [];
  matrix.nodes.forEach((node, nodeIndex) => {
    node.ice.forEach((ice, iceIndex) => out.push({ nodeIndex, iceIndex, ice }));
  });
  return out;
}
