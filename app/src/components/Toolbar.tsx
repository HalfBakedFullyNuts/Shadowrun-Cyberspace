// Left rail: tool modes + node palette (kind, security color, rating, 3D theme).
import { NODE_COLORS, NODE_THEMES, NODE_THEME_LABELS, NodeColor, NodeKind, NodeTheme } from '../domain/types';
import { AppState, Action, Tool } from '../state';
import { securityColor } from './Canvas';

const TOOLS: { id: Tool; label: string }[] = [
  { id: 'select', label: 'Select' },
  { id: 'place', label: 'Place' },
  { id: 'link', label: 'Link' },
  { id: 'delete', label: 'Delete' },
];

const PLACE_KINDS: NodeKind[] = ['CPU', 'SPU', 'DS', 'IOP', 'SM', 'SAN', 'DLJ', 'LNK'];

export function Toolbar({ state, dispatch }: { state: AppState; dispatch: React.Dispatch<Action> }) {
  return (
    <aside className="toolbar">
      <div className="panel-title">Tools</div>
      <div className="tool-grid">
        {TOOLS.map((tool) => (
          <button
            key={tool.id}
            className={`btn${state.tool === tool.id ? ' active' : ''}${tool.id === 'delete' ? ' danger' : ''}`}
            onClick={() => dispatch({ type: 'tool', tool: tool.id })}
          >
            {tool.label}
          </button>
        ))}
      </div>

      <div className="panel-title">Node Design</div>
      <div className="kind-grid">
        {PLACE_KINDS.map((kind) => (
          <button
            key={kind}
            className={`btn${state.placeKind === kind ? ' active' : ''}`}
            onClick={() => dispatch({ type: 'palette', kind })}
          >
            {kind}
          </button>
        ))}
      </div>

      <div className="panel-title">Security Code</div>
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

      <div className="panel-title">3D Sculpt</div>
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
