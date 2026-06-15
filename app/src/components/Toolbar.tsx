// Left rail: tool modes + node palette (kind, security color, rating, 3D theme).
import { NODE_COLORS, NODE_THEMES, NODE_THEME_LABELS, NodeColor, NodeKind, NodeTheme } from '../domain/types';
import { AppState, Action, Tool } from '../state';
import { securityColor } from './Canvas';

const TOOL_ITEMS: { id: Tool; label: string; hint: string }[] = [
  { id: 'select', label: '▹ Select', hint: 'Click a node to select and inspect it. Drag to reposition.' },
  { id: 'place', label: '+ Place', hint: 'Configure a node below, then click any empty cell to drop it.' },
  { id: 'link', label: '↔ Link', hint: 'Click a node, then click another — adds or removes a datatrail.' },
  { id: 'delete', label: '✕ Delete', hint: 'Click a node to permanently remove it from the grid.' },
];

const PLACE_KINDS: NodeKind[] = ['CPU', 'SPU', 'DS', 'IOP', 'SM', 'SAN', 'DLJ', 'LNK'];

const KIND_FULL: Record<string, string> = {
  CPU: 'CPU — Central Processing Unit (one required)',
  SPU: 'SPU — Sub Processing Unit',
  DS: 'DS — Datastore (holds data files)',
  IOP: 'IOP — I/O Port',
  SM: 'SM — Slave Module',
  SAN: 'SAN — System Access Node (entry point)',
  DLJ: 'DLJ — Dataline Junction',
  LNK: 'LNK — Link to another grid',
};

export function Toolbar({ state, dispatch }: { state: AppState; dispatch: React.Dispatch<Action> }) {
  const activeHint = TOOL_ITEMS.find((t) => t.id === state.tool)?.hint ?? '';

  return (
    <aside className="toolbar">
      <div className="panel-title">Tool</div>
      <div className="tool-grid">
        {TOOL_ITEMS.map((tool) => (
          <button
            key={tool.id}
            className={`btn${state.tool === tool.id ? ' active' : ''}${tool.id === 'delete' ? ' danger' : ''}`}
            title={tool.hint}
            onClick={() => dispatch({ type: 'tool', tool: tool.id })}
          >
            {tool.label}
          </button>
        ))}
      </div>
      <div className="tool-hint-bar">{activeHint}</div>

      <div className="panel-title">Node Type</div>
      <div className="kind-grid">
        {PLACE_KINDS.map((kind) => (
          <button
            key={kind}
            className={`btn${state.placeKind === kind ? ' active' : ''}`}
            title={KIND_FULL[kind]}
            onClick={() => dispatch({ type: 'palette', kind })}
          >
            {kind}
          </button>
        ))}
      </div>

      <div className="panel-title">Security Color</div>
      <div className="color-row">
        {NODE_COLORS.map((color: NodeColor) => (
          <div
            key={color}
            title={color}
            className={`color-swatch${state.placeColor === color ? ' active' : ''}`}
            style={{ background: securityColor(color), color: securityColor(color) }}
            onClick={() => dispatch({ type: 'palette', color })}
          />
        ))}
      </div>
      <div className="color-label">{state.placeColor}</div>

      <div className="panel-title">System Rating</div>
      <div className="rating-row">
        <input
          type="range"
          min={1}
          max={12}
          value={state.placeRating}
          onChange={(e) => dispatch({ type: 'palette', rating: parseInt(e.target.value, 10) })}
        />
        <span className="rating-value">{state.placeRating}</span>
      </div>

      <div className="panel-title">3D Theme</div>
      <select
        className="theme-select"
        value={state.placeTheme}
        onChange={(e) => dispatch({ type: 'palette', theme: e.target.value as NodeTheme })}
      >
        {NODE_THEMES.map((theme) => (
          <option key={theme} value={theme}>{NODE_THEME_LABELS[theme]}</option>
        ))}
      </select>
    </aside>
  );
}
