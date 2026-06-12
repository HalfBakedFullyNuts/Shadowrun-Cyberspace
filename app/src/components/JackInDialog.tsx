// Pre-run configuration: decker + deck summary, original .DEK/.NPC loading, seed.
import { useState } from 'react';
import { Decker, Cyberdeck, defaultDeck, defaultDecker, parseDek, parseNpc } from '../domain/run/persona';
import { bridge } from '../bridge';

interface JackInDialogProps {
  onStart: (decker: Decker, deck: Cyberdeck, seed: number) => void;
  onCancel: () => void;
}

export function JackInDialog({ onStart, onCancel }: JackInDialogProps) {
  const [decker, setDecker] = useState<Decker>(defaultDecker);
  const [deck, setDeck] = useState<Cyberdeck>(defaultDeck);
  const [seed, setSeed] = useState(() => Math.floor(Math.random() * 1_000_000));

  async function loadDek() {
    const file = await bridge().openFile({ name: 'Cyberdeck (*.dek)', extensions: ['dek'] });
    if (file) setDeck(parseDek(file.content));
  }

  async function loadNpc() {
    const file = await bridge().openFile({ name: 'Decker (*.npc)', extensions: ['npc'] });
    if (file) setDecker(parseNpc(file.content));
  }

  return (
    <div className="run-end">
      <div className="run-end-card jackin">
        <div className="run-end-title">JACK IN</div>
        <div className="jack-cols">
          <div className="hud-panel">
            <div className="panel-title">Decker</div>
            <div className="jack-name">{decker.name}</div>
            <div className="attr-row">
              <span>WIL {decker.willpower}</span>
              <span>INT {decker.intelligence}</span>
              <span>CMP {decker.computer}</span>
            </div>
            <div className="attr-row dim">
              <span>REA {decker.reaction}+{decker.reactDice}D6</span>
              <span>HACK {decker.hackingPool}</span>
              <span>KARMA {decker.karma}</span>
            </div>
            <button className="btn" onClick={() => void loadNpc()}>Load .NPC…</button>
          </div>
          <div className="hud-panel">
            <div className="panel-title">Cyberdeck</div>
            <div className="jack-name">{deck.model}</div>
            <div className="attr-row">
              <span>MPCP {deck.mpcp}</span>
              <span>B/E/M/S {deck.bod}/{deck.evasion}/{deck.masking}/{deck.sensor}</span>
            </div>
            <div className="attr-row dim">
              <span>HARD {deck.hardening}</span>
              <span>I/O {deck.io}</span>
              <span>{deck.programs.length} programs</span>
            </div>
            <div className="jack-programs">
              {deck.programs.map((p, i) => (
                <span key={i} className="prog-chip">{p.name}-{p.rating}</span>
              ))}
            </div>
            <button className="btn" onClick={() => void loadDek()}>Load .DEK…</button>
          </div>
        </div>
        <div className="jack-seed">
          <label>RNG Seed</label>
          <input type="number" value={seed} onChange={(e) => setSeed(parseInt(e.target.value, 10) || 0)} />
        </div>
        <div className="jack-actions">
          <button className="btn" onClick={onCancel}>Cancel</button>
          <button className="btn primary" onClick={() => onStart(decker, deck, seed)}>⚡ Jack In</button>
        </div>
      </div>
    </div>
  );
}
