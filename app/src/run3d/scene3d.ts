// Three.js matrix scene — framework-free renderer for the run view.
// Nodes are neon structures on an endless dark grid, links are light conduits,
// the persona and IC are glowing entities. Bloom + film grain for the cyberpunk look.
import * as THREE from 'three';
import { OrbitControls } from 'three/examples/jsm/controls/OrbitControls.js';
import { EffectComposer } from 'three/examples/jsm/postprocessing/EffectComposer.js';
import { RenderPass } from 'three/examples/jsm/postprocessing/RenderPass.js';
import { UnrealBloomPass } from 'three/examples/jsm/postprocessing/UnrealBloomPass.js';
import { Matrix, MatrixNode, NodeColor } from '../domain/types';
import { RunSession, RANGE_CONTACT, RANGE_SENSOR, SAT_FROZEN, SAT_YELLING } from '../domain/run/session';

const SPACING = 4.2;
const COLORS: Record<NodeColor | '', number> = {
  Blue: 0x3b9eff, Green: 0x2bff7e, Orange: 0xffa028,
  Red: 0xff3548, Purple: 0xc95bff, Dark: 0x8892a6, '': 0x00e5ff,
};
const ICE_COLORS = { White: 0xd8f4ff, Gray: 0xffb000, Black: 0xff2d6f };

function nodeGeometry(kind: MatrixNode['kind']): THREE.BufferGeometry {
  switch (kind) {
    case 'CPU': return new THREE.CylinderGeometry(0.9, 1.1, 2.6, 6);
    case 'SPU': return new THREE.OctahedronGeometry(1.0);
    case 'DS': return new THREE.BoxGeometry(1.5, 1.9, 0.9);
    case 'IOP': return new THREE.TorusGeometry(0.85, 0.22, 12, 24);
    case 'SM': case 'SN': return new THREE.BoxGeometry(1.0, 1.0, 1.0);
    case 'SAN': return new THREE.ConeGeometry(1.0, 1.9, 4);
    case 'DLJ': return new THREE.SphereGeometry(0.55, 8, 6);
    case 'LNK': return new THREE.TorusKnotGeometry(0.6, 0.18, 48, 8);
    case 'MAT': case 'CRA': return new THREE.IcosahedronGeometry(1.2, 0);
    default: return new THREE.SphereGeometry(0.8, 12, 8);
  }
}

interface NodeVisual {
  group: THREE.Group;
  solid: THREE.Mesh;
  wire: THREE.LineSegments;
  ring: THREE.Mesh;
  color: number;
}

interface IceVisual {
  mesh: THREE.Mesh;
  id: number;
}

export class MatrixScene {
  private renderer: THREE.WebGLRenderer;
  private scene = new THREE.Scene();
  private camera: THREE.PerspectiveCamera;
  private composer: EffectComposer;
  private controls: OrbitControls;
  private clock = new THREE.Clock();
  private frame = 0;
  private disposed = false;

  private nodeVisuals: NodeVisual[] = [];
  private iceVisuals: IceVisual[] = [];
  private persona: THREE.Group;
  private personaLight: THREE.PointLight;
  private pulses: { mesh: THREE.Mesh; from: THREE.Vector3; to: THREE.Vector3; t: number; speed: number }[] = [];
  private camTarget = new THREE.Vector3();
  private camGoal = new THREE.Vector3();
  private matrix: Matrix | null = null;

  constructor(private container: HTMLElement) {
    this.renderer = new THREE.WebGLRenderer({ antialias: true, powerPreference: 'high-performance' });
    this.renderer.setPixelRatio(Math.min(window.devicePixelRatio, 2));
    this.renderer.setSize(container.clientWidth, container.clientHeight);
    this.renderer.toneMapping = THREE.ACESFilmicToneMapping;
    container.appendChild(this.renderer.domElement);

    this.scene.background = new THREE.Color(0x04060a);
    this.scene.fog = new THREE.FogExp2(0x04060a, 0.016);

    this.camera = new THREE.PerspectiveCamera(55, container.clientWidth / container.clientHeight, 0.1, 400);
    this.camera.position.set(10, 14, 18);

    this.controls = new OrbitControls(this.camera, this.renderer.domElement);
    this.controls.enableDamping = true;
    this.controls.dampingFactor = 0.08;
    this.controls.maxPolarAngle = Math.PI * 0.48;
    this.controls.minDistance = 4;
    this.controls.maxDistance = 90;

    const ambient = new THREE.AmbientLight(0x223344, 1.2);
    const key = new THREE.DirectionalLight(0x88bbff, 0.7);
    key.position.set(12, 30, 8);
    this.scene.add(ambient, key);

    // floor grid
    const grid = new THREE.GridHelper(400, 200, 0x00e5ff, 0x0a2a33);
    (grid.material as THREE.Material).transparent = true;
    (grid.material as THREE.Material).opacity = 0.32;
    grid.position.y = -1.4;
    this.scene.add(grid);

    // persona avatar
    this.persona = new THREE.Group();
    const core = new THREE.Mesh(
      new THREE.IcosahedronGeometry(0.45, 1),
      new THREE.MeshStandardMaterial({ color: 0x00e5ff, emissive: 0x00e5ff, emissiveIntensity: 2.2, metalness: 0.4, roughness: 0.2 }),
    );
    const shell = new THREE.Mesh(
      new THREE.IcosahedronGeometry(0.7, 1),
      new THREE.MeshBasicMaterial({ color: 0x00e5ff, wireframe: true, transparent: true, opacity: 0.5 }),
    );
    this.personaLight = new THREE.PointLight(0x00e5ff, 14, 12);
    this.persona.add(core, shell, this.personaLight);
    this.scene.add(this.persona);

    const renderPass = new RenderPass(this.scene, this.camera);
    const bloom = new UnrealBloomPass(
      new THREE.Vector2(container.clientWidth, container.clientHeight), 0.9, 0.6, 0.18,
    );
    this.composer = new EffectComposer(this.renderer);
    this.composer.addPass(renderPass);
    this.composer.addPass(bloom);

    window.addEventListener('resize', this.handleResize);
    this.animate();
  }

  private handleResize = (): void => {
    const w = this.container.clientWidth;
    const h = this.container.clientHeight;
    if (w === 0 || h === 0) return;
    this.camera.aspect = w / h;
    this.camera.updateProjectionMatrix();
    this.renderer.setSize(w, h);
    this.composer.setSize(w, h);
  };

  private nodePos(node: MatrixNode): THREE.Vector3 {
    return new THREE.Vector3(node.x * SPACING, 0, node.y * SPACING);
  }

  buildMatrix(matrix: Matrix): void {
    this.matrix = matrix;
    // nodes
    matrix.nodes.forEach((node) => {
      const color = COLORS[node.color] ?? COLORS[''];
      const geometry = nodeGeometry(node.kind);
      const solid = new THREE.Mesh(
        geometry,
        new THREE.MeshStandardMaterial({
          color: 0x05080c, emissive: color, emissiveIntensity: 0.45,
          metalness: 0.6, roughness: 0.35, transparent: true, opacity: 0.96,
        }),
      );
      const wire = new THREE.LineSegments(
        new THREE.EdgesGeometry(geometry),
        new THREE.LineBasicMaterial({ color, transparent: true, opacity: 0.9 }),
      );
      const ring = new THREE.Mesh(
        new THREE.RingGeometry(1.5, 1.62, 36),
        new THREE.MeshBasicMaterial({ color, transparent: true, opacity: 0.35, side: THREE.DoubleSide }),
      );
      ring.rotation.x = -Math.PI / 2;
      ring.position.y = -1.35;
      const group = new THREE.Group();
      group.add(solid, wire, ring);
      group.position.copy(this.nodePos(node));
      this.scene.add(group);
      this.nodeVisuals.push({ group, solid, wire, ring, color });
    });
    // links
    const done = new Set<string>();
    matrix.nodes.forEach((node, i) => {
      for (const target of node.links) {
        const key = i < target ? `${i}-${target}` : `${target}-${i}`;
        if (done.has(key) || !matrix.nodes[target]) continue;
        done.add(key);
        const from = this.nodePos(node);
        const to = this.nodePos(matrix.nodes[target]);
        const direction = to.clone().sub(from);
        const length = direction.length();
        const beam = new THREE.Mesh(
          new THREE.CylinderGeometry(0.05, 0.05, length, 6, 1, true),
          new THREE.MeshBasicMaterial({ color: 0x00e5ff, transparent: true, opacity: 0.22 }),
        );
        beam.position.copy(from).add(direction.clone().multiplyScalar(0.5));
        beam.quaternion.setFromUnitVectors(new THREE.Vector3(0, 1, 0), direction.clone().normalize());
        this.scene.add(beam);
        // traveling pulse
        const pulse = new THREE.Mesh(
          new THREE.SphereGeometry(0.09, 8, 6),
          new THREE.MeshBasicMaterial({ color: 0x00e5ff, transparent: true, opacity: 0.9 }),
        );
        this.scene.add(pulse);
        this.pulses.push({ mesh: pulse, from, to, t: Math.random(), speed: 0.25 + Math.random() * 0.3 });
      }
    });
  }

  /** Sync dynamic state from the run session (fog of war, IC, persona, alert tint). */
  sync(session: RunSession): void {
    if (!this.matrix) return;
    // fog of war on nodes
    session.nodes.forEach((runtime, i) => {
      const visual = this.nodeVisuals[i];
      if (!visual) return;
      const known = runtime.visited !== 0 || i === 0;
      const solidMat = visual.solid.material as THREE.MeshStandardMaterial;
      const wireMat = visual.wire.material as THREE.LineBasicMaterial;
      solidMat.emissiveIntensity = known ? (i === session.curnode ? 1.2 : 0.45) : 0.06;
      solidMat.opacity = known ? 0.96 : 0.25;
      wireMat.opacity = known ? 0.9 : 0.12;
      (visual.ring.material as THREE.MeshBasicMaterial).opacity = i === session.curnode ? 0.8 : known ? 0.3 : 0.05;
    });

    // persona position by range
    const node = this.matrix.nodes[session.curnode];
    const base = this.nodePos(node);
    const offset =
      session.range === RANGE_CONTACT ? new THREE.Vector3(1.6, 0.6, 1.2)
      : session.range === RANGE_SENSOR ? new THREE.Vector3(2.8, 1.6, 2.2)
      : new THREE.Vector3(4.2, 2.8, 3.4);
    this.persona.position.copy(base).add(offset);
    this.camGoal.copy(base);

    // ICE entities
    for (const visual of this.iceVisuals) this.scene.remove(visual.mesh);
    this.iceVisuals = [];
    for (const ice of session.ice) {
      if (ice.damage >= 10) continue;
      const visibleHere = ice.nodenr === session.curnode && (ice.known || ice.range === session.range);
      const visibleElsewhere = ice.known && session.nodes[ice.nodenr].visited !== 0;
      if (!visibleHere && !visibleElsewhere) continue;
      const color = ICE_COLORS[ice.code];
      const mesh = new THREE.Mesh(
        new THREE.TetrahedronGeometry(0.42),
        new THREE.MeshStandardMaterial({
          color: 0x05080c,
          emissive: color,
          emissiveIntensity: ice.satisfaction >= SAT_YELLING ? 2.6 : ice.satisfaction === SAT_FROZEN ? 0.25 : 1.1,
          metalness: 0.5, roughness: 0.3,
        }),
      );
      const nodeBase = this.nodePos(this.matrix.nodes[ice.nodenr]);
      mesh.position.copy(nodeBase);
      mesh.userData.orbitPhase = ice.id * 1.7;
      mesh.userData.base = nodeBase;
      this.scene.add(mesh);
      this.iceVisuals.push({ mesh, id: ice.id });
    }

    // alert tint
    const fogColor = session.combat.alert === 2 ? 0x14060a : session.combat.alert === 1 ? 0x0c0806 : 0x04060a;
    (this.scene.fog as THREE.FogExp2).color.setHex(fogColor);
    (this.scene.background as THREE.Color).setHex(fogColor);
  }

  private animate = (): void => {
    if (this.disposed) return;
    requestAnimationFrame(this.animate);
    const dt = this.clock.getDelta();
    this.frame += dt;

    // camera follow
    this.camTarget.lerp(this.camGoal, 0.04);
    this.controls.target.copy(this.camTarget);
    this.controls.update();

    // persona bob + spin
    this.persona.rotation.y += dt * 0.8;
    this.persona.position.y += Math.sin(this.frame * 2.2) * 0.004;
    this.personaLight.intensity = 12 + Math.sin(this.frame * 4) * 3;

    // ICE orbit their node
    for (const visual of this.iceVisuals) {
      const base = visual.mesh.userData.base as THREE.Vector3;
      const phase = (visual.mesh.userData.orbitPhase as number) + this.frame * 0.9;
      visual.mesh.position.set(
        base.x + Math.cos(phase) * 1.9,
        0.6 + Math.sin(this.frame * 1.6 + phase) * 0.25,
        base.z + Math.sin(phase) * 1.9,
      );
      visual.mesh.rotation.x += dt * 2;
      visual.mesh.rotation.y += dt * 1.4;
    }

    // link pulses
    for (const pulse of this.pulses) {
      pulse.t = (pulse.t + dt * pulse.speed) % 1;
      pulse.mesh.position.lerpVectors(pulse.from, pulse.to, pulse.t);
    }

    // node rings slow spin
    for (const visual of this.nodeVisuals) {
      visual.ring.rotation.z += dt * 0.3;
      visual.group.rotation.y += dt * 0.05;
    }

    this.composer.render();
  };

  focusEntry(matrix: Matrix): void {
    const entry = matrix.nodes[matrix.entry];
    if (entry) {
      const pos = this.nodePos(entry);
      this.camTarget.copy(pos);
      this.camGoal.copy(pos);
      this.camera.position.copy(pos).add(new THREE.Vector3(8, 11, 14));
    }
  }

  dispose(): void {
    this.disposed = true;
    window.removeEventListener('resize', this.handleResize);
    this.renderer.dispose();
    this.container.removeChild(this.renderer.domElement);
  }
}
