// Bespoke procedural "sculpts" for nodes in the 3D run view. Each theme fully
// replaces a node's look (SR "sculpted host" idea); node kind is shown by a badge.
// Builders return a THREE.Group sitting on the grid floor; materials carry
// emissive so the scene's bloom + fog-of-war dimming work unchanged.
import * as THREE from 'three';
import { NodeTheme } from '../domain/types';

const FLOOR = -1.3;

function std(color: number, emissive: number, ei = 0.6, rough = 0.5, metal = 0.4, flat = false): THREE.MeshStandardMaterial {
  return new THREE.MeshStandardMaterial({
    color, emissive, emissiveIntensity: ei, roughness: rough, metalness: metal,
    transparent: true, opacity: 1, flatShading: flat,
  });
}

function put(group: THREE.Group, geo: THREE.BufferGeometry, mat: THREE.Material, x = 0, y = 0, z = 0): THREE.Mesh {
  const mesh = new THREE.Mesh(geo, mat);
  mesh.position.set(x, y, z);
  group.add(mesh);
  return mesh;
}

function wire(group: THREE.Group, geo: THREE.BufferGeometry, color: number, op = 0.95): THREE.LineSegments {
  const seg = new THREE.LineSegments(
    new THREE.EdgesGeometry(geo),
    new THREE.LineBasicMaterial({ color, transparent: true, opacity: op }),
  );
  group.add(seg);
  return seg;
}

function zen(accent: number): THREE.Group {
  const g = new THREE.Group();
  put(g, new THREE.CylinderGeometry(1.5, 1.5, 0.16, 36), std(0xd8c89a, 0x2a2616, 0.15, 1, 0), 0, FLOOR + 0.08, 0);
  const rim = put(g, new THREE.TorusGeometry(1.5, 0.05, 8, 44), std(0x3a352a, accent, 0.25, 0.8, 0.1), 0, FLOOR + 0.1, 0);
  rim.rotation.x = Math.PI / 2;
  const stone = std(0x55504a, 0x100f0d, 0.1, 1, 0);
  put(g, new THREE.DodecahedronGeometry(0.26), stone, -0.5, FLOOR + 0.22, 0.4);
  put(g, new THREE.DodecahedronGeometry(0.18), stone, -0.2, FLOOR + 0.16, 0.7);
  put(g, new THREE.DodecahedronGeometry(0.2), stone, 0.6, FLOOR + 0.18, -0.5);
  const torii = std(0xc0392b, 0xc0392b, 0.45, 0.6, 0.2);
  put(g, new THREE.CylinderGeometry(0.07, 0.08, 1.1, 8), torii, -0.55, FLOOR + 0.55, -0.1);
  put(g, new THREE.CylinderGeometry(0.07, 0.08, 1.1, 8), torii, 0.55, FLOOR + 0.55, -0.1);
  put(g, new THREE.BoxGeometry(1.5, 0.12, 0.14), torii, 0, FLOOR + 1.18, -0.1);
  put(g, new THREE.BoxGeometry(1.25, 0.1, 0.12), torii, 0, FLOOR + 0.98, -0.1);
  return g;
}

function aztec(accent: number): THREE.Group {
  const g = new THREE.Group();
  const stone = (w: number, y: number) => put(g, new THREE.BoxGeometry(w, 0.4, w), std(0xb5651d, 0x3a1d08, 0.22, 0.95, 0.05), 0, y, 0);
  stone(2.0, FLOOR + 0.2);
  stone(1.55, FLOOR + 0.6);
  stone(1.1, FLOOR + 1.0);
  put(g, new THREE.BoxGeometry(0.7, 0.5, 0.7), std(0x2f7d5b, 0x0c2c20, 0.3, 0.8, 0.1), 0, FLOOR + 1.45, 0);
  put(g, new THREE.BoxGeometry(0.5, 0.9, 0.18), std(0xd9a441, 0x3a2604, 0.25, 0.9, 0.1), 0, FLOOR + 0.45, 1.0);
  const sun = put(g, new THREE.CylinderGeometry(0.34, 0.34, 0.07, 24), std(0xffcf40, 0xffcf40, 1.1, 0.4, 0.3), 0, FLOOR + 1.95, 0);
  sun.rotation.x = Math.PI / 2;
  put(g, new THREE.TorusGeometry(0.46, 0.04, 6, 24), std(accent, accent, 0.8, 0.5, 0.3), 0, FLOOR + 1.95, 0).rotation.x = Math.PI / 2;
  return g;
}

function wasteland(accent: number): THREE.Group {
  const g = new THREE.Group();
  put(g, new THREE.IcosahedronGeometry(0.85, 0), std(0x4a4036, 0x0a0805, 0.08, 1, 0, true), 0, FLOOR + 0.4, 0);
  const scrap = [0x7a3b1f, 0x5a5048, 0x3a3330, 0x6b4a2a];
  const place = (s: number, x: number, y: number, z: number, r: number, c: number) => {
    const m = put(g, new THREE.BoxGeometry(s, s * 0.7, s * 0.8), std(c, 0x100805, 0.12, 0.85, 0.25, true), x, y, z);
    m.rotation.set(r, r * 1.7, r * 0.5);
  };
  place(0.6, -0.4, FLOOR + 0.7, 0.3, 0.4, scrap[0]);
  place(0.5, 0.5, FLOOR + 0.85, -0.2, -0.6, scrap[1]);
  place(0.45, 0.1, FLOOR + 1.15, 0.4, 0.9, scrap[2]);
  place(0.4, -0.5, FLOOR + 1.1, -0.4, 1.3, scrap[3]);
  const pole = put(g, new THREE.CylinderGeometry(0.04, 0.05, 1.6, 6), std(0x2a2622, 0, 0, 1, 0.4), 0.7, FLOOR + 0.9, 0.5);
  pole.rotation.z = 0.3;
  put(g, new THREE.ConeGeometry(0.18, 0.5, 6), std(0x55504a, 0, 0, 1, 0.3, true), 0.1, FLOOR + 1.5, 0.1);
  put(g, new THREE.SphereGeometry(0.09, 8, 6), std(0x401505, accent, 2.4, 0.6, 0.2), -0.3, FLOOR + 0.55, 0.45);
  return g;
}

function urban(accent: number): THREE.Group {
  const g = new THREE.Group();
  const tower = (w: number, h: number, x: number, z: number, win: number) =>
    put(g, new THREE.BoxGeometry(w, h, w), std(0x2b3038, win, 0.3, 0.7, 0.3), x, FLOOR + h / 2, z);
  tower(0.55, 2.4, 0, 0, accent);
  tower(0.5, 1.5, -0.7, 0.2, 0x335577);
  tower(0.45, 1.1, 0.6, -0.3, 0x335577);
  tower(0.4, 1.8, 0.5, 0.6, 0x446688);
  tower(0.42, 0.9, -0.5, -0.6, 0x335577);
  put(g, new THREE.BoxGeometry(2.0, 0.1, 2.0), std(0x1a1d22, 0x05080c, 0.1, 0.9, 0.2), 0, FLOOR + 0.05, 0);
  return g;
}

function underwater(accent: number): THREE.Group {
  const g = new THREE.Group();
  put(g, new THREE.IcosahedronGeometry(0.7, 0), std(0x33424f, 0x0a1a22, 0.1, 1, 0, true), 0, FLOOR + 0.35, 0);
  const coral = (h: number, x: number, z: number, tilt: number, c: number) => {
    const m = put(g, new THREE.ConeGeometry(0.12, h, 6), std(c, c, 0.65, 0.6, 0.1), x, FLOOR + 0.4 + h / 2, z);
    m.rotation.set(tilt, 0, tilt * 0.7);
  };
  coral(0.9, -0.3, 0.2, 0.25, 0x18b0a0);
  coral(1.1, 0.25, -0.1, -0.2, 0x16d6b0);
  coral(0.7, 0.1, 0.4, 0.1, accent);
  put(g, new THREE.TorusGeometry(0.3, 0.08, 8, 16), std(0x2fd0c0, 0x2fd0c0, 0.5, 0.5, 0.1), -0.4, FLOOR + 0.6, -0.3);
  const bub = std(0xbfefff, 0xbfefff, 0.4, 0.2, 0.1); bub.opacity = 0.45;
  put(g, new THREE.SphereGeometry(0.1, 8, 6), bub, 0.2, FLOOR + 1.4, 0.1);
  put(g, new THREE.SphereGeometry(0.07, 8, 6), bub, -0.1, FLOOR + 1.7, -0.1);
  return g;
}

function forest(accent: number): THREE.Group {
  const g = new THREE.Group();
  put(g, new THREE.CylinderGeometry(0.18, 0.26, 1.2, 8), std(0x5b3a22, 0x1a0f06, 0.1, 1, 0), 0, FLOOR + 0.6, 0);
  const leaf = std(0x2e7d32, 0x123d18, 0.28, 0.9, 0);
  put(g, new THREE.IcosahedronGeometry(0.6, 0), leaf, 0, FLOOR + 1.35, 0);
  put(g, new THREE.IcosahedronGeometry(0.45, 0), leaf, -0.3, FLOOR + 1.1, 0.2);
  put(g, new THREE.IcosahedronGeometry(0.4, 0), std(0x3aa043, accent, 0.3, 0.9, 0), 0.3, FLOOR + 1.15, -0.15);
  put(g, new THREE.IcosahedronGeometry(0.3, 0), leaf, 0.5, FLOOR + 0.3, 0.4);
  return g;
}

function space(accent: number): THREE.Group {
  const g = new THREE.Group();
  put(g, new THREE.SphereGeometry(0.7, 24, 18), std(0x223a6a, accent, 0.35, 0.6, 0.2), 0, FLOOR + 0.95, 0);
  const ring = put(g, new THREE.TorusGeometry(1.05, 0.06, 8, 48), std(0xd9b15a, 0xd9b15a, 0.55, 0.4, 0.4), 0, FLOOR + 0.95, 0);
  ring.rotation.set(1.2, 0.3, 0);
  put(g, new THREE.SphereGeometry(0.16, 12, 10), std(0x8892a6, 0x2a2f3a, 0.2, 0.8, 0.1), 1.1, FLOOR + 1.4, 0.3);
  const star = std(0xffffff, 0xffffff, 2.0, 0.2, 0.1);
  put(g, new THREE.SphereGeometry(0.04, 6, 6), star, -0.9, FLOOR + 1.8, -0.6);
  put(g, new THREE.SphereGeometry(0.03, 6, 6), star, 0.7, FLOOR + 2.0, 0.5);
  return g;
}

function castle(accent: number): THREE.Group {
  const g = new THREE.Group();
  const stone = std(0x8a8f98, 0x1a1d22, 0.12, 0.9, 0.1);
  put(g, new THREE.BoxGeometry(1.0, 1.3, 1.0), stone, 0, FLOOR + 0.65, 0);
  for (let i = 0; i < 4; i++) {
    const a = (Math.PI / 2) * i + Math.PI / 4;
    put(g, new THREE.BoxGeometry(0.22, 0.22, 0.22), stone, Math.cos(a) * 0.42, FLOOR + 1.4, Math.sin(a) * 0.42);
  }
  const turret = std(0x9aa0a8, 0x1a1d22, 0.12, 0.9, 0.1);
  const roof = std(0xb33529, accent, 0.35, 0.7, 0.1);
  const corners: [number, number][] = [[-0.5, -0.5], [0.5, 0.5]];
  for (const [x, z] of corners) {
    put(g, new THREE.CylinderGeometry(0.18, 0.18, 1.5, 10), turret, x, FLOOR + 0.75, z);
    put(g, new THREE.ConeGeometry(0.24, 0.45, 10), roof, x, FLOOR + 1.7, z);
  }
  put(g, new THREE.BoxGeometry(0.02, 0.4, 0.3), std(accent, accent, 0.6, 0.6, 0.1), 0, FLOOR + 1.85, 0);
  return g;
}

function abstract(accent: number): THREE.Group {
  const g = new THREE.Group();
  const palette = [0xff2d6f, 0x2bff7e, 0x3b9eff, 0xffcf40, accent];
  put(g, new THREE.OctahedronGeometry(0.6), std(accent, accent, 1.2, 0.3, 0.5), 0, FLOOR + 1.0, 0);
  put(g, new THREE.TetrahedronGeometry(0.35), std(palette[0], palette[0], 1.0, 0.3, 0.4), 0.9, FLOOR + 0.6, 0.2);
  put(g, new THREE.BoxGeometry(0.4, 0.4, 0.4), std(palette[1], palette[1], 1.0, 0.3, 0.4), -0.8, FLOOR + 1.4, -0.3);
  put(g, new THREE.TorusGeometry(0.3, 0.09, 10, 20), std(palette[2], palette[2], 1.0, 0.3, 0.4), 0.3, FLOOR + 1.7, 0.5);
  put(g, new THREE.IcosahedronGeometry(0.22, 0), std(palette[3], palette[3], 1.0, 0.3, 0.4), -0.6, FLOOR + 0.5, 0.6);
  return g;
}

function pixel(accent: number): THREE.Group {
  const g = new THREE.Group();
  const pal = [0x55ff55, 0x5599ff, 0xffe055, 0xff5577, accent];
  const s = 0.34;
  const cube = (x: number, y: number, z: number, c: number) =>
    put(g, new THREE.BoxGeometry(s, s, s), std(c, c, 0.35, 1, 0, true), x * s, FLOOR + 0.2 + y * s, z * s);
  for (let x = -1; x <= 1; x++) for (let z = -1; z <= 1; z++) cube(x, 0, z, pal[(x + z + 4) % pal.length]);
  cube(-1, 1, 0, pal[1]); cube(0, 1, 0, pal[0]); cube(1, 1, 0, pal[2]);
  cube(0, 1, -1, pal[3]); cube(0, 2, 0, accent);
  return g;
}

function retrofuture(accent: number): THREE.Group {
  const g = new THREE.Group();
  const chrome = std(0xb8c4cc, 0x2a3640, 0.2, 0.15, 0.95);
  const body = put(g, new THREE.SphereGeometry(0.8, 24, 16), chrome, 0, FLOOR + 0.8, 0);
  body.scale.set(1, 0.42, 1);
  const dome = std(0x2fd6d6, 0x2fd6d6, 0.45, 0.2, 0.6); dome.opacity = 0.75;
  put(g, new THREE.SphereGeometry(0.4, 20, 12, 0, Math.PI * 2, 0, Math.PI / 2), dome, 0, FLOOR + 0.95, 0);
  put(g, new THREE.TorusGeometry(0.82, 0.07, 10, 36), chrome, 0, FLOOR + 0.8, 0).rotation.x = Math.PI / 2;
  const fin = std(0xff7733, 0xff7733, 0.6, 0.4, 0.5);
  for (let i = 0; i < 3; i++) {
    const a = (Math.PI * 2 / 3) * i;
    const f = put(g, new THREE.ConeGeometry(0.12, 0.5, 4), fin, Math.cos(a) * 0.6, FLOOR + 0.55, Math.sin(a) * 0.6);
    f.rotation.set(Math.PI, a, 0.4);
  }
  put(g, new THREE.CylinderGeometry(0.02, 0.02, 0.5, 6), chrome, 0, FLOOR + 1.4, 0);
  put(g, new THREE.SphereGeometry(0.08, 10, 8), std(accent, accent, 2.0, 0.3, 0.3), 0, FLOOR + 1.7, 0);
  return g;
}

function arcade(accent: number): THREE.Group {
  const g = new THREE.Group();
  const green = 0x39ff14;
  const fill = std(0x041008, 0x041008, 0.05, 1, 0); fill.opacity = 0.4;
  put(g, new THREE.IcosahedronGeometry(0.8, 0), fill, 0, FLOOR + 1.0, 0);
  wire(g, new THREE.IcosahedronGeometry(0.8, 0), green, 0.95).position.y = FLOOR + 1.0;
  wire(g, new THREE.ConeGeometry(0.6, 0.9, 4), accent, 0.9).position.y = FLOOR + 0.45;
  const ring = wire(g, new THREE.TorusGeometry(1.1, 0.02, 4, 24), green, 0.7);
  ring.position.y = FLOOR + 0.1; ring.rotation.x = Math.PI / 2;
  return g;
}

const BUILDERS: Partial<Record<NodeTheme, (accent: number) => THREE.Group>> = {
  zen, aztec, wasteland, urban, underwater, forest, space, castle, abstract, pixel, retrofuture, arcade,
};

/** Build a node's themed sculpt, or null for 'default' (caller uses kind geometry). */
export function buildThemedNode(theme: NodeTheme, accent: number): THREE.Group | null {
  const builder = BUILDERS[theme];
  return builder ? builder(accent) : null;
}
