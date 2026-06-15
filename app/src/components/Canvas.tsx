// SVG matrix grid: renders nodes as neon glyphs per kind, links, entry pulse,
// and handles place/select+drag/link/delete tool interactions.
import { ReactElement, useRef, useState } from 'react';
import { MatrixNode, NodeColor } from '../domain/types';
import { AppState, Action } from '../state';
import { addNode, deleteNode, moveNode, toggleLink } from '../domain/ops';

const CELL = 56;
const PAD = 1.5;

export function securityColor(color: NodeColor | ''): string {
  switch (color) {
    case 'Blue': return 'var(--sec-blue)';
    case 'Green': return 'var(--sec-green)';
    case 'Orange': return 'var(--sec-orange)';
    case 'Red': return 'var(--sec-red)';
    case 'Purple': return 'var(--sec-purple)';
    case 'Dark': return 'var(--sec-dark)';
    default: return 'var(--neon)';
  }
}

function px(v: number): number {
  return (v + PAD) * CELL;
}

function toCell(p: number): number {
  return Math.round(p / CELL - PAD);
}

/** Node glyph path per kind, centered on 0,0 with radius r. */
function kindShape(kind: MatrixNode['kind'], r: number): ReactElement {
  switch (kind) {
    case 'CPU': {
      const points = Array.from({ length: 6 }, (_, i) => {
        const a = (Math.PI / 3) * i - Math.PI / 6;
        return `${(r * 1.15 * Math.cos(a)).toFixed(1)},${(r * 1.15 * Math.sin(a)).toFixed(1)}`;
      }).join(' ');
      return <polygon points={points} />;
    }
    case 'SPU':
      return <polygon points={`0,${-r * 1.2} ${r * 1.2},0 0,${r * 1.2} ${-r * 1.2},0`} />;
    case 'DS':
      return <path d={`M ${-r} ${-r * 0.75} h ${2 * r - 6} l 6 6 v ${1.5 * r - 6} h ${-2 * r + 6} l -6 -6 Z`} />;
    case 'IOP':
      return (
        <>
          <circle r={r} />
          <circle r={r * 0.55} />
        </>
      );
    case 'SM':
    case 'SN':
      return <rect x={-r * 0.85} y={-r * 0.85} width={r * 1.7} height={r * 1.7} />;
    case 'SAN':
      return <polygon points={`0,${-r * 1.2} ${r},${-r * 0.3} ${r * 0.65},${r} ${-r * 0.65},${r} ${-r},${-r * 0.3}`} />;
    case 'DLJ':
      return <path d={`M ${-r * 0.4} ${-r * 1.1} h ${r * 0.8} v ${r * 0.7} h ${r * 0.7} v ${r * 0.8} h ${-r * 0.7} v ${r * 0.7} h ${-r * 0.8} v ${-r * 0.7} h ${-r * 0.7} v ${-r * 0.8} h ${r * 0.7} Z`} />;
    case 'LNK':
      return (
        <>
          <circle r={r} strokeDasharray="4 3" />
          <circle r={r * 0.5} />
        </>
      );
    case 'MAT':
    case 'CRA': {
      const points = Array.from({ length: 16 }, (_, i) => {
        const a = (Math.PI / 8) * i;
        const rr = i % 2 === 0 ? r * 1.35 : r * 0.65;
        return `${(rr * Math.cos(a)).toFixed(1)},${(rr * Math.sin(a)).toFixed(1)}`;
      }).join(' ');
      return <polygon points={points} />;
    }
    default:
      return <circle r={r} />;
  }
}

interface CanvasProps {
  state: AppState;
  dispatch: React.Dispatch<Action>;
}

export function Canvas({ state, dispatch }: CanvasProps) {
  const { matrix, tool } = state;
  const svgRef = useRef<SVGSVGElement | null>(null);
  const [drag, setDrag] = useState<{ index: number; x: number; y: number } | null>(null);
  const [cursor, setCursor] = useState<{ x: number; y: number } | null>(null);

  const maxX = Math.max(20, ...matrix.nodes.map((node) => node.x + 4));
  const maxY = Math.max(14, ...matrix.nodes.map((node) => node.y + 4));
  const width = (maxX + 2 * PAD) * CELL;
  const height = (maxY + 2 * PAD) * CELL;

  function eventPoint(e: React.PointerEvent): { x: number; y: number } {
    const rect = svgRef.current!.getBoundingClientRect();
    return { x: e.clientX - rect.left, y: e.clientY - rect.top };
  }

  function handleBackgroundClick(e: React.PointerEvent) {
    const point = eventPoint(e);
    const cellX = toCell(point.x);
    const cellY = toCell(point.y);
    if (tool === 'place') {
      if (cellX < 0 || cellY < 0) return;
      const next = addNode(matrix, state.placeKind, state.placeColor, state.placeRating, cellX, cellY, state.placeTheme);
      if (next === matrix) {
        dispatch({ type: 'log', text: 'Cannot place node there (occupied or limit reached).', kind: 'warn' });
      } else {
        dispatch({ type: 'mutate', matrix: next, log: `${state.placeKind} ${state.placeColor}-${state.placeRating} placed at ${cellX},${cellY}.` });
        dispatch({ type: 'select', index: next.nodes.length - 1 });
      }
    } else {
      dispatch({ type: 'select', index: null });
      dispatch({ type: 'linkFrom', index: null });
    }
  }

  function handleNodeDown(index: number, e: React.PointerEvent) {
    e.stopPropagation();
    if (tool === 'select') {
      dispatch({ type: 'select', index });
      if (index > 0) {
        const point = eventPoint(e);
        setDrag({ index, x: point.x, y: point.y });
        (e.target as Element).setPointerCapture?.(e.pointerId);
      }
    } else if (tool === 'link') {
      if (state.linkFrom === null) {
        dispatch({ type: 'linkFrom', index });
        dispatch({ type: 'log', text: `Link mode: node ${index} selected — click a second node to connect/disconnect.` });
      } else if (state.linkFrom !== index) {
        const next = toggleLink(matrix, state.linkFrom, index);
        const connected = next.nodes[state.linkFrom].links.includes(index);
        dispatch({ type: 'mutate', matrix: next, log: `Node ${state.linkFrom} ${connected ? 'connected with' : 'disconnected from'} node ${index}.` });
        dispatch({ type: 'linkFrom', index: null });
      } else {
        dispatch({ type: 'linkFrom', index: null });
      }
    } else if (tool === 'delete') {
      if (index === 0) {
        dispatch({ type: 'log', text: 'The external matrix cannot be deleted.', kind: 'warn' });
        return;
      }
      dispatch({ type: 'mutate', matrix: deleteNode(matrix, index), log: `Node ${index} deleted.` });
      dispatch({ type: 'select', index: null });
    }
  }

  function handleMove(e: React.PointerEvent) {
    const point = eventPoint(e);
    setCursor(point);
    if (drag) setDrag({ ...drag, x: point.x, y: point.y });
  }

  function handleUp() {
    if (drag) {
      const cellX = Math.max(0, toCell(drag.x));
      const cellY = Math.max(0, toCell(drag.y));
      const node = matrix.nodes[drag.index];
      if (node.x !== cellX || node.y !== cellY) {
        const next = moveNode(matrix, drag.index, cellX, cellY);
        if (next === matrix) {
          dispatch({ type: 'log', text: 'Target cell is occupied.', kind: 'warn' });
        } else {
          dispatch({ type: 'mutate', matrix: next });
        }
      }
      setDrag(null);
    }
  }

  function nodeCenter(index: number): { x: number; y: number } {
    if (drag && drag.index === index) return { x: drag.x, y: drag.y };
    const node = matrix.nodes[index];
    return { x: px(node.x), y: px(node.y) };
  }

  // Build unique link pairs.
  const pairs: [number, number][] = [];
  matrix.nodes.forEach((node, i) => {
    for (const target of node.links) {
      if (target > i && matrix.nodes[target]) pairs.push([i, target]);
      else if (!matrix.nodes[target]) pairs.push([i, target]); // dangling — skip render below
    }
  });

  return (
    <div className={`canvas-wrap tool-${tool}`}>
      <svg
        ref={svgRef}
        width={width}
        height={height}
        onPointerDown={handleBackgroundClick}
        onPointerMove={handleMove}
        onPointerUp={handleUp}
      >
        {pairs.map(([a, b]) =>
          matrix.nodes[b] ? (
            <g key={`${a}-${b}`}>
              <line className="link-line" x1={nodeCenter(a).x} y1={nodeCenter(a).y} x2={nodeCenter(b).x} y2={nodeCenter(b).y} />
              <line className="link-line flow" x1={nodeCenter(a).x} y1={nodeCenter(a).y} x2={nodeCenter(b).x} y2={nodeCenter(b).y} />
            </g>
          ) : null,
        )}
        {tool === 'link' && state.linkFrom !== null && cursor && (
          <line
            className="link-preview"
            x1={nodeCenter(state.linkFrom).x}
            y1={nodeCenter(state.linkFrom).y}
            x2={cursor.x}
            y2={cursor.y}
          />
        )}
        {matrix.nodes.map((node, i) => {
          const center = nodeCenter(i);
          const color = securityColor(node.color);
          const isEntry = i === matrix.entry;
          const selected = state.selected === i || state.linkFrom === i;
          return (
            <g
              key={i}
              className={`node-group${selected ? ' selected' : ''}`}
              transform={`translate(${center.x}, ${center.y})`}
              onPointerDown={(e) => handleNodeDown(i, e)}
            >
              {isEntry && <circle className="entry-ring" r={26} />}
              <g
                className="node-shape"
                style={{ color }}
                fill="rgba(4,10,14,0.88)"
                stroke={color}
                strokeWidth={1.6}
              >
                {kindShape(node.kind, 15)}
              </g>
              <text className="node-label" y={4}>
                {node.kind === 'LNK' ? 'LNK' : node.rating || ''}
              </text>
              <text className="node-sub" y={32}>
                {node.kind === 'MAT' || node.kind === 'CRA' ? 'EXT MATRIX' : `${node.kind} ${i}`}
              </text>
              {node.ice.length > 0 && (
                <text className="node-sub" y={-24} style={{ fill: 'var(--magenta)' }}>
                  {'◆'.repeat(Math.min(node.ice.length, 6))}
                </text>
              )}
              {node.files.length > 0 && (
                <text className="node-sub" x={24} y={4} style={{ fill: 'var(--amber)' }}>
                  {'▮'}
                </text>
              )}
            </g>
          );
        })}
      </svg>
    </div>
  );
}
