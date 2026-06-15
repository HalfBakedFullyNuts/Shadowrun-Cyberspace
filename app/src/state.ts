// App state: matrix document + editor UI state with bounded undo history.
import { Matrix, NodeColor, NodeKind, NodeTheme, createEmptyMatrix } from './domain/types';
import { Finding } from './domain/validate';

export type Tool = 'select' | 'place' | 'link' | 'delete';

export interface AppState {
  matrix: Matrix;
  history: Matrix[];
  future: Matrix[];
  filePath: string | null;
  dirty: boolean;
  tool: Tool;
  /** Palette selection used by the place tool. */
  placeKind: NodeKind;
  placeColor: NodeColor;
  placeRating: number;
  placeTheme: NodeTheme;
  /** Selected node index, or null. */
  selected: number | null;
  /** First node clicked in link mode, or null. */
  linkFrom: number | null;
  console: { text: string; kind: 'info' | 'warn' | 'error' }[];
  findings: Finding[] | null;
}

const MAX_HISTORY = 100;

export function initialState(): AppState {
  return {
    matrix: createEmptyMatrix(),
    history: [],
    future: [],
    filePath: null,
    dirty: false,
    tool: 'select',
    placeKind: 'SPU',
    placeColor: 'Green',
    placeRating: 4,
    placeTheme: 'default',
    selected: null,
    linkFrom: null,
    console: [{ text: 'MATRIX CONSTRUCTION SET // online. Place nodes, jack in, stay safe.', kind: 'info' }],
    findings: null,
  };
}

export type Action =
  | { type: 'mutate'; matrix: Matrix; log?: string }
  | { type: 'replace'; matrix: Matrix; filePath: string | null; log?: string }
  | { type: 'saved'; filePath: string }
  | { type: 'undo' }
  | { type: 'redo' }
  | { type: 'tool'; tool: Tool }
  | { type: 'palette'; kind?: NodeKind; color?: NodeColor; rating?: number; theme?: NodeTheme }
  | { type: 'select'; index: number | null }
  | { type: 'linkFrom'; index: number | null }
  | { type: 'log'; text: string; kind?: 'info' | 'warn' | 'error' }
  | { type: 'findings'; findings: Finding[] | null };

export function reducer(state: AppState, action: Action): AppState {
  switch (action.type) {
    case 'mutate': {
      if (action.matrix === state.matrix) return state; // op was rejected
      const entry = action.log ? [{ text: action.log, kind: 'info' as const }] : [];
      return {
        ...state,
        matrix: action.matrix,
        history: [...state.history.slice(-MAX_HISTORY + 1), state.matrix],
        future: [],
        dirty: true,
        findings: null,
        console: [...state.console.slice(-200), ...entry],
      };
    }
    case 'replace':
      return {
        ...initialState(),
        matrix: action.matrix,
        filePath: action.filePath,
        tool: state.tool,
        placeKind: state.placeKind,
        placeColor: state.placeColor,
        placeRating: state.placeRating,
        placeTheme: state.placeTheme,
        console: [
          ...state.console.slice(-200),
          ...(action.log ? [{ text: action.log, kind: 'info' as const }] : []),
        ],
      };
    case 'saved':
      return { ...state, filePath: action.filePath, dirty: false };
    case 'undo': {
      const prev = state.history[state.history.length - 1];
      if (!prev) return state;
      return {
        ...state,
        matrix: prev,
        history: state.history.slice(0, -1),
        future: [state.matrix, ...state.future],
        dirty: true,
        selected: null,
        linkFrom: null,
        findings: null,
      };
    }
    case 'redo': {
      const next = state.future[0];
      if (!next) return state;
      return {
        ...state,
        matrix: next,
        history: [...state.history, state.matrix],
        future: state.future.slice(1),
        dirty: true,
        selected: null,
        linkFrom: null,
        findings: null,
      };
    }
    case 'tool':
      return { ...state, tool: action.tool, linkFrom: null };
    case 'palette':
      return {
        ...state,
        placeKind: action.kind ?? state.placeKind,
        placeColor: action.color ?? state.placeColor,
        placeRating: action.rating ?? state.placeRating,
        placeTheme: action.theme ?? state.placeTheme,
        tool: 'place',
      };
    case 'select':
      return { ...state, selected: action.index };
    case 'linkFrom':
      return { ...state, linkFrom: action.index };
    case 'log':
      return {
        ...state,
        console: [...state.console.slice(-200), { text: action.text, kind: action.kind ?? 'info' }],
      };
    case 'findings':
      return { ...state, findings: action.findings };
  }
}
