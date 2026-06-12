// Pure editor operations over Matrix. Every function returns a new Matrix.
// Index bookkeeping (links, ICE trigger references) ports MATED1.BAS DeleteICE/DelTriggerICEnr.
import { Matrix, MatrixNode, Ice, NodeKind, NodeColor, MAX_NODES, MAX_LINKS, allIce } from './types';

function cloneMatrix(matrix: Matrix): Matrix {
  return structuredClone(matrix);
}

export function addNode(
  matrix: Matrix,
  kind: NodeKind,
  color: NodeColor,
  rating: number,
  x: number,
  y: number,
): Matrix {
  if (matrix.nodes.length - 1 >= MAX_NODES) return matrix;
  if (matrix.nodes.some((node, i) => i > 0 && node.x === x && node.y === y)) return matrix;
  const next = cloneMatrix(matrix);
  const node: MatrixNode = {
    kind, color, rating, x, y, mesg: '', locked: 0, files: [], links: [], ice: [],
  };
  next.nodes.push(node);
  return next;
}

/** Delete node and renumber all links and ICE triggers. Node 0 (external matrix) is undeletable. */
export function deleteNode(matrix: Matrix, index: number): Matrix {
  if (index <= 0 || index >= matrix.nodes.length) return matrix;
  const next = cloneMatrix(matrix);

  // Global ICE order before deletion → mark ICE of the dying node as deleted.
  const flatBefore = allIce(next);
  const removedGlobal = new Set<number>();
  flatBefore.forEach((entry, globalIdx) => {
    if (entry.nodeIndex === index) removedGlobal.add(globalIdx);
  });

  next.nodes.splice(index, 1);
  next.nodes.forEach((node) => {
    node.links = node.links
      .filter((target) => target !== index)
      .map((target) => (target > index ? target - 1 : target));
  });
  if (next.entry === index) next.entry = 1;
  else if (next.entry > index) next.entry -= 1;

  remapTriggers(next, (oldGlobal) => {
    if (removedGlobal.has(oldGlobal)) return -1;
    let shift = 0;
    for (const r of removedGlobal) if (r < oldGlobal) shift++;
    return oldGlobal - shift;
  });
  return next;
}

export function moveNode(matrix: Matrix, index: number, x: number, y: number): Matrix {
  if (index <= 0 || index >= matrix.nodes.length) return matrix;
  if (matrix.nodes.some((node, i) => i > 0 && i !== index && node.x === x && node.y === y)) return matrix;
  const next = cloneMatrix(matrix);
  next.nodes[index].x = x;
  next.nodes[index].y = y;
  return next;
}

/** Toggle a bidirectional link between two nodes (Addlink port, both directions). */
export function toggleLink(matrix: Matrix, a: number, b: number): Matrix {
  if (a === b || !matrix.nodes[a] || !matrix.nodes[b]) return matrix;
  const next = cloneMatrix(matrix);
  const nodeA = next.nodes[a];
  const nodeB = next.nodes[b];
  if (nodeA.links.includes(b)) {
    nodeA.links = nodeA.links.filter((t) => t !== b);
    nodeB.links = nodeB.links.filter((t) => t !== a);
  } else {
    if (nodeA.links.length >= MAX_LINKS || nodeB.links.length >= MAX_LINKS) return matrix;
    nodeA.links.push(b);
    nodeB.links.push(a);
  }
  return next;
}

export function updateNode(matrix: Matrix, index: number, patch: Partial<MatrixNode>): Matrix {
  if (!matrix.nodes[index]) return matrix;
  const next = cloneMatrix(matrix);
  Object.assign(next.nodes[index], patch);
  return next;
}

export function updateMatrixMeta(matrix: Matrix, patch: Partial<Omit<Matrix, 'nodes'>>): Matrix {
  const next = cloneMatrix(matrix);
  Object.assign(next, patch);
  return next;
}

export function addIce(matrix: Matrix, nodeIndex: number, ice: Ice): Matrix {
  if (!matrix.nodes[nodeIndex]) return matrix;
  const next = cloneMatrix(matrix);
  next.nodes[nodeIndex].ice.push(ice);
  return next;
}

export function updateIce(matrix: Matrix, nodeIndex: number, iceIndex: number, patch: Partial<Ice>): Matrix {
  const node = matrix.nodes[nodeIndex];
  if (!node || !node.ice[iceIndex]) return matrix;
  const next = cloneMatrix(matrix);
  Object.assign(next.nodes[nodeIndex].ice[iceIndex], patch);
  return next;
}

/** Delete one ICE and fix all global trigger indices (DeleteICE port). */
export function deleteIce(matrix: Matrix, nodeIndex: number, iceIndex: number): Matrix {
  const node = matrix.nodes[nodeIndex];
  if (!node || !node.ice[iceIndex]) return matrix;
  const next = cloneMatrix(matrix);

  const flat = allIce(next);
  const deletedGlobal = flat.findIndex((e) => e.nodeIndex === nodeIndex && e.iceIndex === iceIndex);
  next.nodes[nodeIndex].ice.splice(iceIndex, 1);

  remapTriggers(next, (oldGlobal) => {
    if (oldGlobal === deletedGlobal) return -1;
    return oldGlobal > deletedGlobal ? oldGlobal - 1 : oldGlobal;
  });
  return next;
}

function remapTriggers(matrix: Matrix, remap: (oldGlobal: number) => number): void {
  for (const node of matrix.nodes) {
    for (const ice of node.ice) {
      if (ice.ptrigger >= 0) ice.ptrigger = remap(ice.ptrigger);
      if (ice.atrigger >= 0) ice.atrigger = remap(ice.atrigger);
    }
  }
}
