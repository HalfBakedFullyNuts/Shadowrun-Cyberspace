// App shell: header (file ops, analyze, undo/redo), toolbar, canvas, inspector,
// console pad, status bar. Keyboard: Ctrl+S/O/Z/Y, Delete.
import { useEffect, useReducer, useRef, useState } from 'react';
import { initialState, reducer } from './state';
import { Canvas } from './components/Canvas';
import { Toolbar } from './components/Toolbar';
import { Inspector } from './components/Inspector';
import { JackInDialog } from './components/JackInDialog';
import { RunView } from './run3d/RunView';
import { parseLtg, serializeLtg } from './domain/ltg';
import { validateMatrix } from './domain/validate';
import { checkStructure } from './domain/validate';
import { deleteNode, updateMatrixMeta } from './domain/ops';
import { allIce } from './domain/types';
import { Decker, Cyberdeck } from './domain/run/persona';
import { bridge } from './bridge';

const TOOL_HINTS: Record<string, string> = {
  select: 'Click node to inspect — drag to move.',
  place: 'Click an empty cell to place the configured node.',
  link: 'Click two nodes to connect/disconnect them.',
  delete: 'Click a node to delete it.',
};

export default function App() {
  const [state, dispatch] = useReducer(reducer, undefined, initialState);
  const [examples, setExamples] = useState<{ name: string; path: string }[]>([]);
  const [examplesOpen, setExamplesOpen] = useState(false);
  const [jackInOpen, setJackInOpen] = useState(false);
  const [run, setRun] = useState<{ decker: Decker; deck: Cyberdeck; seed: number } | null>(null);
  const consoleRef = useRef<HTMLDivElement | null>(null);

  useEffect(() => {
    bridge().listExamples().then(setExamples).catch(() => setExamples([]));
  }, []);

  useEffect(() => {
    consoleRef.current?.scrollTo({ top: consoleRef.current.scrollHeight });
  }, [state.console]);

  async function openFile() {
    const file = await bridge().openLtg();
    if (!file) return;
    loadContent(file.content, file.path);
  }

  function loadContent(content: string, path: string | null) {
    try {
      const { matrix, warnings } = parseLtg(content);
      dispatch({ type: 'replace', matrix, filePath: path, log: `Loaded "${matrix.name}" (${matrix.nodes.length - 1} nodes, ${allIce(matrix).length} IC).` });
      for (const warning of warnings) dispatch({ type: 'log', text: warning, kind: 'warn' });
    } catch (err) {
      dispatch({ type: 'log', text: `Load failed: ${err instanceof Error ? err.message : String(err)}`, kind: 'error' });
    }
  }

  async function saveFile(saveAs: boolean) {
    // Mirror SaveLTG: warn when structure checks fail, but allow saving anyway.
    const errors = checkStructure(state.matrix).filter((f) => f.severity === 'error');
    if (errors.length > 0) {
      dispatch({ type: 'log', text: `Saving with ${errors.length} consistency error(s) — run ANALYZE for details.`, kind: 'warn' });
    }
    const content = serializeLtg(state.matrix);
    const suggested = (state.matrix.name.replace(/[^A-Za-z0-9_-]+/g, '_').slice(0, 24) || 'matrix') + '.ltg';
    const result = await bridge().saveLtg({
      path: saveAs ? null : state.filePath,
      content,
      suggestedName: suggested,
    });
    if (result) {
      dispatch({ type: 'saved', filePath: result.path });
      dispatch({ type: 'log', text: `Saved to ${result.path}` });
    }
  }

  function analyze() {
    const findings = validateMatrix(state.matrix);
    dispatch({ type: 'findings', findings });
    dispatch({
      type: 'log',
      text: `Analysis: ${findings.filter((f) => f.severity === 'error').length} errors, ${findings.filter((f) => f.severity === 'warning').length} warnings.`,
    });
  }

  function newMatrix() {
    dispatch({ type: 'replace', matrix: initialState().matrix, filePath: null, log: 'New empty grid.' });
  }

  useEffect(() => {
    function onKey(e: KeyboardEvent) {
      const inField = /INPUT|TEXTAREA|SELECT/.test((e.target as HTMLElement).tagName);
      if (e.ctrlKey && e.key.toLowerCase() === 's') {
        e.preventDefault();
        void saveFile(e.shiftKey);
      } else if (e.ctrlKey && e.key.toLowerCase() === 'o') {
        e.preventDefault();
        void openFile();
      } else if (e.ctrlKey && e.key.toLowerCase() === 'z' && !inField) {
        e.preventDefault();
        dispatch({ type: 'undo' });
      } else if (e.ctrlKey && e.key.toLowerCase() === 'y' && !inField) {
        e.preventDefault();
        dispatch({ type: 'redo' });
      } else if (e.key === 'Delete' && !inField && state.selected !== null && state.selected > 0) {
        dispatch({ type: 'mutate', matrix: deleteNode(state.matrix, state.selected), log: `Node ${state.selected} deleted.` });
        dispatch({ type: 'select', index: null });
      }
    }
    window.addEventListener('keydown', onKey);
    return () => window.removeEventListener('keydown', onKey);
  });

  const iceCount = allIce(state.matrix).length;

  function tryJackIn() {
    const errors = checkStructure(state.matrix).filter((f) => f.severity === 'error');
    if (errors.length > 0) {
      dispatch({ type: 'log', text: `Cannot jack in: ${errors[0].message}`, kind: 'error' });
      dispatch({ type: 'findings', findings: validateMatrix(state.matrix) });
      return;
    }
    setJackInOpen(true);
  }

  if (run) {
    return (
      <RunView
        matrix={state.matrix}
        decker={run.decker}
        deck={run.deck}
        seed={run.seed}
        onExit={() => setRun(null)}
      />
    );
  }

  return (
    <div className="app crt">
      <header className="header">
        <div className="logo">
          MATRIX<span className="ghost">//</span>CONSTRUCTION SET
        </div>
        <input
          className="matrix-name"
          value={state.matrix.name}
          spellCheck={false}
          onChange={(e) => dispatch({ type: 'mutate', matrix: updateMatrixMeta(state.matrix, { name: e.target.value }) })}
        />
        <button className="btn" onClick={newMatrix}>New</button>
        <button className="btn" onClick={() => void openFile()}>Open</button>
        <button className="btn primary" onClick={() => void saveFile(false)}>Save</button>
        <button className="btn" onClick={() => void saveFile(true)}>Save As</button>
        {examples.length > 0 && (
          <div className="menu-anchor">
            <button className="btn" onClick={() => setExamplesOpen((open) => !open)}>Examples ▾</button>
            {examplesOpen && (
              <div className="menu-pop" onPointerLeave={() => setExamplesOpen(false)}>
                {examples.map((example) => (
                  <button
                    key={example.path}
                    onClick={async () => {
                      setExamplesOpen(false);
                      const file = await bridge().readLtg(example.path);
                      loadContent(file.content, null);
                    }}
                  >
                    {example.name}
                  </button>
                ))}
              </div>
            )}
          </div>
        )}
        <button className="btn primary" onClick={analyze}>Analyze</button>
        <button className="btn primary" onClick={tryJackIn}>⚡ Jack In</button>
        <button className="btn" disabled={state.history.length === 0} onClick={() => dispatch({ type: 'undo' })}>↶</button>
        <button className="btn" disabled={state.future.length === 0} onClick={() => dispatch({ type: 'redo' })}>↷</button>
        <div className="spacer" />
        <div className="file-label">
          {state.dirty && <span className="dirty-dot">● </span>}
          {state.filePath ?? 'unsaved grid'}
        </div>
      </header>

      <Toolbar state={state} dispatch={dispatch} />
      <Canvas state={state} dispatch={dispatch} />
      <Inspector state={state} dispatch={dispatch} />

      <div className="console" ref={consoleRef}>
        {state.console.map((line, i) => (
          <div key={i} className={`line ${line.kind}`}>{line.text}</div>
        ))}
      </div>

      <footer className="status">
        <span className="stat">NODES <b>{state.matrix.nodes.length - 1}</b></span>
        <span className="stat">IC <b>{iceCount}</b></span>
        <span className="stat">ENTRY <b>{state.matrix.entry}</b></span>
        <span className="stat">ALERT <b>{state.matrix.alert.toUpperCase()}</b></span>
        <span className="hint">{TOOL_HINTS[state.tool]}</span>
      </footer>

      {jackInOpen && (
        <JackInDialog
          onCancel={() => setJackInOpen(false)}
          onStart={(decker, deck, seed) => {
            setJackInOpen(false);
            setRun({ decker, deck, seed });
          }}
        />
      )}
    </div>
  );
}
