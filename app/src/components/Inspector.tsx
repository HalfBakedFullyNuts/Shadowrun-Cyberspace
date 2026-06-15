// Right panel: matrix settings (nothing selected) or node editor (node selected)
// with data files and full ICE attribute editing; analysis findings list.
import {
  Ice,
  ICE_CODES,
  ICE_TYPES,
  ICE_MOBILITIES,
  ICE_ACTIVITIES,
  NODE_COLORS,
  NODE_THEMES,
  NODE_THEME_LABELS,
  NodeColor,
  NodeTheme,
  allIce,
} from '../domain/types';
import { addIce, deleteIce, updateIce, updateMatrixMeta, updateNode } from '../domain/ops';
import { AppState, Action } from '../state';

function defaultIce(): Ice {
  return {
    code: 'White', type: 'Access', rating: 4, mobility: 'immobile', activity: 'ever',
    ptrigger: -1, atrigger: -1, damage: 0, freezemod: 0,
  };
}

export function Inspector({ state, dispatch }: { state: AppState; dispatch: React.Dispatch<Action> }) {
  const { matrix, selected } = state;
  const node = selected !== null ? matrix.nodes[selected] : null;

  function mutate(next: typeof matrix, log?: string) {
    dispatch({ type: 'mutate', matrix: next, log });
  }

  if (state.findings) {
    return (
      <aside className="inspector">
        <div className="panel-title">System Analysis</div>
        {state.findings.length === 0 && <div className="finding info">Grid checks out clean. Run it.</div>}
        {state.findings.map((finding, i) => (
          <div
            key={i}
            className={`finding ${finding.severity}${finding.nodeIndex !== undefined ? ' clickable' : ''}`}
            onClick={() => {
              if (finding.nodeIndex !== undefined) dispatch({ type: 'select', index: finding.nodeIndex });
            }}
          >
            {finding.message}
          </div>
        ))}
        <div style={{ marginTop: 10 }}>
          <button className="btn" onClick={() => dispatch({ type: 'findings', findings: null })}>
            Close Report
          </button>
        </div>
      </aside>
    );
  }

  if (!node || selected === null) {
    return (
      <aside className="inspector">
        <div className="panel-title">Matrix Parameters</div>
        <label>Alert Status</label>
        <select value={matrix.alert} onChange={(e) => mutate(updateMatrixMeta(matrix, { alert: e.target.value as typeof matrix.alert }))}>
          <option value="none">none</option>
          <option value="passive">passive alert</option>
          <option value="active">active alert</option>
        </select>
        <div className="field-row">
          <div>
            <label>Entry Node</label>
            <input
              type="number"
              min={1}
              max={matrix.nodes.length - 1}
              value={matrix.entry}
              onChange={(e) => mutate(updateMatrixMeta(matrix, { entry: parseInt(e.target.value, 10) || 1 }))}
            />
          </div>
          <div>
            <label>Entry Range</label>
            <select value={matrix.range} onChange={(e) => mutate(updateMatrixMeta(matrix, { range: parseInt(e.target.value, 10) }))}>
              <option value={0}>contact</option>
              <option value={1}>sensor</option>
              <option value={2}>observation</option>
            </select>
          </div>
        </div>
        <div className="field-row">
          <div>
            <label>Emergency %IC</label>
            <input
              type="number"
              min={0}
              max={100}
              value={matrix.emergency?.perc ?? ''}
              placeholder="off"
              onChange={(e) => {
                const perc = parseFloat(e.target.value);
                mutate(updateMatrixMeta(matrix, {
                  emergency: Number.isFinite(perc) ? { perc, tics: matrix.emergency?.tics ?? 10 } : null,
                }));
              }}
            />
          </div>
          <div>
            <label>React Tics</label>
            <input
              type="number"
              min={0}
              value={matrix.emergency?.tics ?? ''}
              placeholder="off"
              disabled={!matrix.emergency}
              onChange={(e) => {
                if (!matrix.emergency) return;
                mutate(updateMatrixMeta(matrix, {
                  emergency: { perc: matrix.emergency.perc, tics: parseInt(e.target.value, 10) || 0 },
                }));
              }}
            />
          </div>
        </div>
        <div className="field-row">
          <div>
            <label>Shutdown Tics</label>
            <input
              type="number"
              min={0}
              value={matrix.shutdowntics}
              onChange={(e) => mutate(updateMatrixMeta(matrix, { shutdowntics: parseInt(e.target.value, 10) || 0 }))}
            />
          </div>
          <div>
            <label>Read Only</label>
            <select value={matrix.readonly ? 'yes' : 'no'} onChange={(e) => mutate(updateMatrixMeta(matrix, { readonly: e.target.value === 'yes' }))}>
              <option value="no">No</option>
              <option value="yes">Yes</option>
            </select>
          </div>
        </div>
        <div className="workflow-guide">
          <div className="wf-label">QUICK START</div>
          <div className="wf-step"><span className="wf-n">①</span> Left panel — pick <b>+ Place</b></div>
          <div className="wf-step"><span className="wf-n">②</span> Choose node type, security color and rating</div>
          <div className="wf-step"><span className="wf-n">③</span> Click the canvas to drop the node</div>
          <div className="wf-step"><span className="wf-n">④</span> Switch to <b>▹ Select</b> — click a node to edit it here</div>
          <div className="wf-step"><span className="wf-n">⑤</span> Switch to <b>↔ Link</b> — click two nodes to connect them</div>
          <div className="wf-step"><span className="wf-n">⑥</span> Click <b>Analyze</b> (top bar) to check rules</div>
          <div className="wf-step"><span className="wf-n">⑦</span> Click <b>⚡ Jack In</b> to run the simulation</div>
        </div>
      </aside>
    );
  }

  const iceGlobalBase = allIce(matrix).findIndex((e) => e.nodeIndex === selected && e.iceIndex === 0);
  const flat = allIce(matrix);

  return (
    <aside className="inspector">
      <div className="panel-title">
        {node.kind === 'MAT' || node.kind === 'CRA' ? 'External Matrix' : `Node ${selected} — ${node.kind}`}
      </div>

      {node.kind !== 'LNK' && (
        <>
          <div className="field-row">
            <div>
              <label>Security</label>
              <select
                value={node.color || 'Green'}
                onChange={(e) => mutate(updateNode(matrix, selected, { color: e.target.value as NodeColor }))}
              >
                {NODE_COLORS.map((color) => (
                  <option key={color} value={color}>{color}</option>
                ))}
              </select>
            </div>
            <div>
              <label>Rating</label>
              <input
                type="number"
                min={1}
                max={15}
                value={node.rating}
                onChange={(e) => mutate(updateNode(matrix, selected, { rating: parseInt(e.target.value, 10) || 1 }))}
              />
            </div>
          </div>
          {node.kind !== 'MAT' && node.kind !== 'CRA' && (
            <>
              <label>3D Theme (visible in run view)</label>
              <select
                value={node.theme ?? 'default'}
                onChange={(e) => mutate(updateNode(matrix, selected, { theme: e.target.value as NodeTheme }))}
              >
                {NODE_THEMES.map((theme) => (
                  <option key={theme} value={theme}>{NODE_THEME_LABELS[theme]}</option>
                ))}
              </select>
            </>
          )}
          <label>Message (contact range)</label>
          <textarea
            rows={2}
            value={node.mesg}
            onChange={(e) => mutate(updateNode(matrix, selected, { mesg: e.target.value }))}
          />
          {node.kind === 'SAN' && (
            <>
              <label>Locked (tics)</label>
              <input
                type="number"
                min={0}
                value={node.locked}
                onChange={(e) => mutate(updateNode(matrix, selected, { locked: parseInt(e.target.value, 10) || 0 }))}
              />
            </>
          )}
        </>
      )}

      {node.kind === 'LNK' && (
        <>
          <label>Linked grid: "&lt;file.ltg&gt; &lt;entrynode&gt;"</label>
          <input
            type="text"
            value={node.mesg}
            onChange={(e) => mutate(updateNode(matrix, selected, { mesg: e.target.value }))}
          />
        </>
      )}

      {node.kind !== 'LNK' && node.kind !== 'MAT' && node.kind !== 'CRA' && (
        <>
          <div className="panel-title" style={{ marginTop: 12 }}>
            Data Files ({node.files.length})
          </div>
          {node.files.map((file, fi) => (
            <div className="file-card" key={fi}>
              <div className="field-row">
                <div style={{ flex: 2 }}>
                  <label>Filename</label>
                  <input
                    type="text"
                    value={file.name}
                    onChange={(e) => {
                      const files = node.files.map((f, k) => (k === fi ? { ...f, name: e.target.value } : f));
                      mutate(updateNode(matrix, selected, { files }));
                    }}
                  />
                </div>
                <div>
                  <label>Mp</label>
                  <input
                    type="number"
                    value={file.sizeMp}
                    onChange={(e) => {
                      const files = node.files.map((f, k) => (k === fi ? { ...f, sizeMp: parseFloat(e.target.value) || 0 } : f));
                      mutate(updateNode(matrix, selected, { files }));
                    }}
                  />
                </div>
                <div>
                  <label>Value ¥</label>
                  <input
                    type="number"
                    value={file.value}
                    onChange={(e) => {
                      const files = node.files.map((f, k) => (k === fi ? { ...f, value: parseFloat(e.target.value) || 0 } : f));
                      mutate(updateNode(matrix, selected, { files }));
                    }}
                  />
                </div>
              </div>
              <button
                className="mini-btn"
                style={{ marginTop: 6 }}
                onClick={() => {
                  const files = node.files.filter((_, k) => k !== fi);
                  mutate(updateNode(matrix, selected, { files }), `File "${file.name}" erased.`);
                }}
              >
                Erase File
              </button>
            </div>
          ))}
          <button
            className="btn"
            style={{ marginTop: 6 }}
            onClick={() =>
              mutate(updateNode(matrix, selected, {
                files: [...node.files, { name: 'Paydata', sizeMp: 10, value: 1000 }],
              }))
            }
          >
            + Add File
          </button>

          <div className="panel-title" style={{ marginTop: 12 }}>
            IC ({node.ice.length})
          </div>
          {node.ice.map((ice, ii) => (
            <div className={`ice-card ${ice.code.toLowerCase()}`} key={ii}>
              <div className="ice-head">
                <span className="ice-name">
                  {ice.code} {ice.type}-{ice.rating}
                </span>
                <button
                  className="mini-btn"
                  onClick={() => mutate(deleteIce(matrix, selected, ii), `${ice.code} ${ice.type}-${ice.rating} deleted.`)}
                >
                  ✕
                </button>
              </div>
              <div className="field-row">
                <div>
                  <label>Code</label>
                  <select value={ice.code} onChange={(e) => mutate(updateIce(matrix, selected, ii, { code: e.target.value as Ice['code'] }))}>
                    {ICE_CODES.map((code) => <option key={code}>{code}</option>)}
                  </select>
                </div>
                <div>
                  <label>Rating</label>
                  <input
                    type="number"
                    min={1}
                    max={15}
                    value={ice.rating}
                    onChange={(e) => mutate(updateIce(matrix, selected, ii, { rating: parseInt(e.target.value, 10) || 1 }))}
                  />
                </div>
              </div>
              <label>Type</label>
              <select value={ice.type} onChange={(e) => mutate(updateIce(matrix, selected, ii, { type: e.target.value }))}>
                {!ICE_TYPES.includes(ice.type as (typeof ICE_TYPES)[number]) && <option value={ice.type}>{ice.type}</option>}
                {ICE_TYPES.map((t) => <option key={t}>{t}</option>)}
              </select>
              <div className="field-row">
                <div>
                  <label>Mobility</label>
                  <select value={ice.mobility} onChange={(e) => mutate(updateIce(matrix, selected, ii, { mobility: e.target.value as Ice['mobility'] }))}>
                    {ICE_MOBILITIES.map((m) => <option key={m}>{m}</option>)}
                  </select>
                </div>
                <div>
                  <label>Activity</label>
                  <select value={ice.activity} onChange={(e) => mutate(updateIce(matrix, selected, ii, { activity: e.target.value as Ice['activity'] }))}>
                    {ICE_ACTIVITIES.map((a) => <option key={a}>{a}</option>)}
                  </select>
                </div>
              </div>
              <div className="field-row">
                <div>
                  <label>Damage</label>
                  <input
                    type="number"
                    min={0}
                    max={10}
                    value={ice.damage}
                    onChange={(e) => mutate(updateIce(matrix, selected, ii, { damage: parseInt(e.target.value, 10) || 0 }))}
                  />
                </div>
                <div>
                  <label>Trigger (susp)</label>
                  <select
                    value={ice.ptrigger}
                    onChange={(e) => mutate(updateIce(matrix, selected, ii, { ptrigger: parseInt(e.target.value, 10) }))}
                  >
                    <option value={-1}>none</option>
                    <option value={-2}>all triggered IC</option>
                    {flat.map((entry, gi) =>
                      gi !== iceGlobalBase + ii ? (
                        <option key={gi} value={gi}>
                          #{gi} {entry.ice.type}-{entry.ice.rating} (n{entry.nodeIndex})
                        </option>
                      ) : null,
                    )}
                  </select>
                </div>
              </div>
            </div>
          ))}
          <button
            className="btn"
            style={{ marginTop: 6 }}
            onClick={() => mutate(addIce(matrix, selected, defaultIce()))}
          >
            + Add IC
          </button>
        </>
      )}
    </aside>
  );
}
