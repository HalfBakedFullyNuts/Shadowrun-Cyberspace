import { describe, expect, it } from 'vitest';
import { readFileSync, readdirSync } from 'node:fs';
import { join } from 'node:path';
import { parseLtg, serializeLtg, parseIceString, serializeIce } from '../ltg';
import { validateMatrix } from '../validate';
import { addNode, deleteIce, deleteNode, toggleLink } from '../ops';
import { allIce, createEmptyMatrix } from '../types';

const EXAMPLES = join(__dirname, '..', '..', '..', 'examples');

describe('parseLtg', () => {
  it('parses FIRSTRUN.LTG correctly', () => {
    const { matrix, warnings } = parseLtg(readFileSync(join(EXAMPLES, 'FIRSTRUN.LTG'), 'latin1'));
    expect(warnings).toHaveLength(0);
    expect(matrix.name).toBe('Firstrun-Matrix');
    expect(matrix.nodes).toHaveLength(8); // Node0..Node7
    expect(matrix.entry).toBe(1);
    expect(matrix.nodes[0].kind).toBe('MAT');
    expect(matrix.nodes[1].kind).toBe('SAN');
    expect(matrix.nodes[1].color).toBe('Orange');
    expect(matrix.nodes[1].rating).toBe(4);
    expect(matrix.nodes[1].ice).toHaveLength(1);
    expect(matrix.nodes[1].ice[0]).toMatchObject({ code: 'White', type: 'Access', rating: 4 });
    expect(matrix.nodes[6].files).toHaveLength(3);
    expect(matrix.nodes[6].files[0]).toEqual({ name: 'Design Data', sizeMp: 40, value: 5000 });
    expect(matrix.nodes[2].links).toEqual([1, 4, 6, 5, 3]);
  });

  it('round-trips every bundled example grid', () => {
    const files = readdirSync(EXAMPLES).filter((f) => f.toUpperCase().endsWith('.LTG'));
    expect(files.length).toBeGreaterThan(10);
    for (const file of files) {
      const original = parseLtg(readFileSync(join(EXAMPLES, file), 'latin1'));
      const text = serializeLtg(original.matrix);
      const reparsed = parseLtg(text);
      expect(reparsed.matrix.name, file).toBe(original.matrix.name);
      expect(reparsed.matrix.nodes.length, file).toBe(original.matrix.nodes.length);
      reparsed.matrix.nodes.forEach((node, i) => {
        const before = original.matrix.nodes[i];
        expect(node.kind, `${file} node ${i}`).toBe(before.kind);
        expect(node.rating, `${file} node ${i}`).toBe(before.rating);
        expect(node.x, `${file} node ${i}`).toBe(before.x);
        expect(node.y, `${file} node ${i}`).toBe(before.y);
        expect(node.files, `${file} node ${i}`).toEqual(before.files);
        expect(node.ice.length, `${file} node ${i}`).toBe(before.ice.length);
        expect([...node.links].sort(), `${file} node ${i}`).toEqual([...before.links].sort());
      });
      expect(allIce(reparsed.matrix).length, file).toBe(allIce(original.matrix).length);
    }
  });
});

describe('parseIceString', () => {
  it('applies White defaults', () => {
    expect(parseIceString('White Access-4')).toMatchObject({
      code: 'White', type: 'Access', rating: 4, mobility: 'immobile', activity: 'ever',
    });
  });
  it('applies Gray defaults and options', () => {
    expect(parseIceString('Gray Killer (M)-9 passive immobile damage 4')).toMatchObject({
      code: 'Gray', type: 'Killer (M)', rating: 9, mobility: 'immobile', activity: 'passive', damage: 4,
    });
  });
  it('decodes negative damage as freezemod', () => {
    expect(parseIceString('Gray Jammer-5 damage -35')).toMatchObject({ freezemod: 2, damage: 3 });
    expect(parseIceString('Gray Jammer-5 damage -100')).toMatchObject({ freezemod: 100, damage: 0 });
  });
  it('round-trips trigger references', () => {
    const ice = parseIceString('Black Blaster-8 triggered ptrigger 2 atrigger -2')!;
    expect(ice.ptrigger).toBe(2);
    expect(ice.atrigger).toBe(-2);
    const text = serializeIce(ice, (i) => i);
    expect(parseIceString(text)).toEqual(ice);
  });
});

describe('validateMatrix', () => {
  it('accepts FIRSTRUN with no errors', () => {
    const { matrix } = parseLtg(readFileSync(join(EXAMPLES, 'FIRSTRUN.LTG'), 'latin1'));
    const errors = validateMatrix(matrix).filter((f) => f.severity === 'error');
    expect(errors).toHaveLength(0);
  });
  it('flags a matrix without CPU', () => {
    let matrix = createEmptyMatrix();
    matrix = addNode(matrix, 'SAN', 'Green', 4, 2, 2);
    matrix = toggleLink(matrix, 0, 1);
    const findings = validateMatrix(matrix);
    expect(findings.some((f) => f.message.includes('no CPU'))).toBe(true);
  });
});

describe('ops', () => {
  it('deleteNode renumbers links and entry', () => {
    let matrix = createEmptyMatrix();
    matrix = addNode(matrix, 'SAN', 'Green', 4, 1, 1); // 1
    matrix = addNode(matrix, 'SPU', 'Green', 4, 2, 2); // 2
    matrix = addNode(matrix, 'CPU', 'Red', 5, 3, 3); // 3
    matrix = toggleLink(matrix, 1, 2);
    matrix = toggleLink(matrix, 2, 3);
    matrix.entry = 3;
    matrix = deleteNode(matrix, 2);
    expect(matrix.nodes).toHaveLength(3);
    expect(matrix.nodes[1].links).toEqual([]);
    expect(matrix.nodes[2].links).toEqual([]);
    expect(matrix.entry).toBe(2);
  });

  it('deleteIce remaps global trigger indices (DeleteICE port)', () => {
    let matrix = createEmptyMatrix();
    matrix = addNode(matrix, 'SAN', 'Green', 4, 1, 1);
    matrix = addNode(matrix, 'CPU', 'Red', 5, 2, 2);
    const mk = (type: string, ptrigger = -1) => ({
      code: 'White' as const, type, rating: 4, mobility: 'immobile' as const,
      activity: 'ever' as const, ptrigger, atrigger: -1, damage: 0, freezemod: 0,
    });
    matrix.nodes[1].ice.push(mk('Access'));        // global 0
    matrix.nodes[1].ice.push(mk('Probe', 2));      // global 1 → triggers global 2
    matrix.nodes[2].ice.push(mk('Killer', 0));     // global 2 → triggers global 0
    matrix = deleteIce(matrix, 1, 0);              // delete global 0
    expect(matrix.nodes[1].ice[0].ptrigger).toBe(1); // was 2, shifted down
    expect(matrix.nodes[2].ice[0].ptrigger).toBe(-1); // target deleted
  });

  it('rejects node placement on an occupied cell', () => {
    let matrix = createEmptyMatrix();
    matrix = addNode(matrix, 'CPU', 'Red', 5, 2, 2);
    const before = matrix.nodes.length;
    matrix = addNode(matrix, 'SPU', 'Green', 4, 2, 2);
    expect(matrix.nodes.length).toBe(before);
  });
});
