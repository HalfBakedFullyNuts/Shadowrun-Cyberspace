// Run mode: Three.js scene + HUD overlay. Owns the RunSession lifecycle.
import { useEffect, useRef, useState, useCallback } from 'react';
import { Matrix } from '../domain/types';
import { RunSession, RunEvent, RANGE_CONTACT } from '../domain/run/session';
import { Decker, Cyberdeck } from '../domain/run/persona';
import { Sr2Rules } from '../domain/run/rules';
import { createRng } from '../domain/run/rng';
import { MatrixScene } from './scene3d';

function Monitor({ label, value, max = 10, danger }: { label: string; value: number; max?: number; danger: boolean }) {
  return (
    <div className="monitor">
      <span className="monitor-label">{label}</span>
      <div className="monitor-boxes">
        {Array.from({ length: max }, (_, i) => (
          <span key={i} className={`mbox${i < value ? (danger ? ' hit-danger' : ' hit') : ''}`} />
        ))}
      </div>
    </div>
  );
}

interface RunViewProps {
  matrix: Matrix;
  decker: Decker;
  deck: Cyberdeck;
  seed: number;
  onExit: () => void;
}

export function RunView({ matrix, decker, deck, seed, onExit }: RunViewProps) {
  const mountRef = useRef<HTMLDivElement | null>(null);
  const sceneRef = useRef<MatrixScene | null>(null);
  const sessionRef = useRef<RunSession | null>(null);
  const [, setVersion] = useState(0);
  const [shownEvents, setShownEvents] = useState<RunEvent[]>([]);
  const logRef = useRef<HTMLDivElement | null>(null);

  if (!sessionRef.current) {
    const rng = createRng(seed);
    sessionRef.current = new RunSession(matrix, decker, deck, new Sr2Rules(rng), rng);
  }
  const session = sessionRef.current;

  const refresh = useCallback(() => {
    setVersion((v) => v + 1);
    setShownEvents([...session.events]);
    sceneRef.current?.sync(session);
  }, [session]);

  useEffect(() => {
    if (!mountRef.current) return;
    const scene = new MatrixScene(mountRef.current);
    scene.buildMatrix(matrix);
    scene.focusEntry(matrix);
    scene.sync(session);
    sceneRef.current = scene;
    setShownEvents([...session.events]);
    return () => scene.dispose();
    // eslint-disable-next-line react-hooks/exhaustive-deps
  }, []);

  useEffect(() => {
    logRef.current?.scrollTo({ top: logRef.current.scrollHeight });
  }, [shownEvents]);

  const act = (fn: () => void) => () => {
    fn();
    refresh();
  };

  const node = matrix.nodes[session.curnode];
  const runtime = session.nodes[session.curnode];
  const engaged = session.engagedIce();
  const visibleIce = engaged.filter((ice) => ice.known);
  const alertName = ['NONE', 'PASSIVE', 'ACTIVE'][session.combat.alert];
  const ended = session.outcome !== 'running';
  const busy = session.busyTics > 0;
  const lootValue = session.loot.reduce((sum, f) => sum + f.value, 0);

  const sysOps: { id: string; label: string; arg?: number }[] = [];
  if (session.range === RANGE_CONTACT) {
    switch (node.kind) {
      case 'CPU':
        sysOps.push(
          { id: 'cancel-alert', label: 'Cancel Alert' },
          { id: 'display-map', label: 'Display Map' },
          { id: 'shutdown', label: 'Shutdown' },
        );
        break;
      case 'SAN':
        sysOps.push({ id: 'lockout', label: 'Lockout' }, { id: 'see-system', label: 'See System' });
        break;
      case 'SM': case 'SN':
        sysOps.push({ id: 'control', label: 'Control' }, { id: 'sensor-readout', label: 'Sensor Readout' });
        break;
      case 'IOP':
        sysOps.push({ id: 'display-message', label: 'Display Message' });
        break;
      default:
        break;
    }
  }

  return (
    <div className="runview">
      <div className="run-canvas" ref={mountRef} />

      <div className="hud hud-top">
        <div className="hud-panel">
          <div className="hud-title">{session.nodeLabel(session.curnode)}</div>
          <div className="hud-sub">
            {node.kind !== 'MAT' && runtime.visited === -2 ? `${node.color}-${node.rating} · ` : ''}
            range <b>{session.rangeName()}</b> · round <b>{session.round}</b>
          </div>
          {node.mesg && runtime.visited === -2 && <div className="hud-mesg">“{node.mesg}”</div>}
        </div>
        <div className={`hud-panel alert-lamp alert-${session.combat.alert}`}>
          ALERT: {alertName}
          {session.istraced && <span className="traced"> · TRACED</span>}
        </div>
        <div className="hud-panel">
          <button className="btn danger" onClick={ended ? onExit : act(() => session.jackOut())}>
            {ended ? 'Return to Editor' : 'Jack Out'}
          </button>
        </div>
      </div>

      <div className="hud hud-right">
        <div className="hud-panel">
          <div className="panel-title">Condition</div>
          <Monitor label="DECK" value={session.combat.deckDamage} danger />
          <Monitor label="STUN" value={session.combat.stunDamage} danger />
          <Monitor label="PHYS" value={session.combat.physDamage} danger />
          <div className="attr-row">
            <span>BOD {Math.max(0, deck.bod + session.combat.addBod - session.combat.damBod)}</span>
            <span>EVA {Math.max(0, deck.evasion + session.combat.addEva - session.combat.damEva)}</span>
            <span>MASK {Math.max(0, deck.masking + session.combat.addMask - session.combat.damMask)}</span>
            <span>SENS {Math.max(0, deck.sensor - session.combat.damSens)}</span>
          </div>
          <div className="attr-row dim">
            <span>MPCP {deck.mpcp}</span>
            <span>HARD {deck.hardening}</span>
            <span>HACK {session.combat.leftHacking}/{decker.hackingPool}</span>
          </div>
        </div>

        {visibleIce.length > 0 && (
          <div className="hud-panel">
            <div className="panel-title">IC Engaged</div>
            {visibleIce.map((ice) => (
              <div key={ice.id} className={`ice-row ice-${ice.code.toLowerCase()}`}>
                <span>{session.iceLabel(ice)}</span>
                <span className="dim">{ice.damage > 0 ? `dmg ${ice.damage}` : ''}{ice.freezemod > 0 ? ` frz ${ice.freezemod}` : ''}</span>
              </div>
            ))}
          </div>
        )}

        {session.loot.length > 0 && (
          <div className="hud-panel">
            <div className="panel-title">Paydata ({lootValue}¥)</div>
            {session.loot.map((file, i) => (
              <div key={i} className="loot-row">
                “{file.name}” <span className="dim">{file.sizeMp} Mp · {file.value}¥</span>
              </div>
            ))}
          </div>
        )}
      </div>

      <div className="hud hud-bottom">
        <div className="run-log" ref={logRef}>
          {shownEvents.slice(-60).map((event, i) => (
            <div key={i} className={`line ${event.kind}`}>{event.text}</div>
          ))}
        </div>

        {!ended && !busy && session.isDeckerTurn && (
          <div className="action-bar">
            <div className="action-group">
              <span className="action-label">MOVE</span>
              {session.range > 0 && <button className="btn" onClick={act(() => session.approach())}>Approach</button>}
              {session.range < 2 && <button className="btn" onClick={act(() => session.withdraw())}>Withdraw</button>}
              {node.links.map((target, idx) =>
                matrix.nodes[target] ? (
                  <button
                    key={idx}
                    className="btn"
                    title={`Exit ${idx + 1}`}
                    onClick={act(() => session.moveForward(idx))}
                  >
                    → {session.nodes[target]?.visited !== 0 || target === 0 ? session.nodeLabel(target) : '???'}
                  </button>
                ) : null,
              )}
            </div>
            <div className="action-group">
              <span className="action-label">SENSOR</span>
              <button className="btn" onClick={act(() => session.analyze())}>Analyze</button>
              <button className="btn" onClick={act(() => session.browse())}>Browse</button>
              {runtime.filesKnown &&
                runtime.files.map((file, i) => (
                  <button key={i} className="btn" onClick={act(() => session.download(i))}>
                    ↓ {file.name}
                  </button>
                ))}
            </div>
            <div className="action-group">
              <span className="action-label">MASK</span>
              <button className="btn" onClick={act(() => session.sleaze())}>Sleaze</button>
              <button className="btn" onClick={act(() => session.deception())}>Deception</button>
            </div>
            {visibleIce.length > 0 && (
              <div className="action-group">
                <span className="action-label">COMBAT</span>
                {visibleIce.map((ice) => (
                  <button key={ice.id} className="btn danger" onClick={act(() => session.attack(ice.id))}>
                    ⚔ {ice.type}-{ice.rating}
                  </button>
                ))}
                {session.program('slow') && visibleIce[0] && (
                  <button className="btn" onClick={act(() => session.slow(visibleIce[0].id))}>❄ Slow</button>
                )}
              </div>
            )}
            <div className="action-group">
              <span className="action-label">DECK</span>
              {(['armor', 'cloak', 'mirrors', 'shield', 'smoke', 'medic'] as const)
                .filter((name) => session.program(name === 'mirrors' ? 'mirror' : name))
                .map((name) => (
                  <button key={name} className="btn" onClick={act(() => session.runDefense(name))}>
                    {name}
                  </button>
                ))}
            </div>
            {sysOps.length > 0 && (
              <div className="action-group">
                <span className="action-label">SYSOP</span>
                {sysOps.map((op) => (
                  <button key={op.id} className="btn" onClick={act(() => session.systemOp(op.id, op.arg))}>
                    {op.label}
                  </button>
                ))}
              </div>
            )}
            <div className="action-group">
              <button className="btn" onClick={act(() => session.pass())}>Pass</button>
            </div>
          </div>
        )}
        {busy && <div className="action-bar busy">{session.busyLabel}… ({session.busyTics} turns)</div>}
      </div>

      {ended && (
        <div className="run-end">
          <div className="run-end-card">
            <div className="run-end-title">
              {session.outcome === 'jacked-out' && 'RUN COMPLETE'}
              {session.outcome === 'dumped' && 'DUMPED'}
              {session.outcome === 'deck-fried' && 'DECK FRIED'}
              {session.outcome === 'unconscious' && 'BLACKOUT'}
              {session.outcome === 'dying' && 'FLATLINED'}
            </div>
            <div className="run-end-body">
              Paydata: {session.loot.length} files · {lootValue}¥
              {session.istraced && <div className="traced">Your meat location was traced.</div>}
            </div>
            <button className="btn primary" onClick={onExit}>Return to Editor</button>
          </div>
        </div>
      )}
    </div>
  );
}
