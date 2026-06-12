// Seedable RNG (mulberry32) so runs are reproducible in tests and replays.
export interface Rng {
  /** Float in [0, 1). */
  next(): number;
  /** Integer die roll 1..sides. */
  die(sides: number): number;
}

export function createRng(seed: number): Rng {
  let state = seed >>> 0;
  function next(): number {
    state = (state + 0x6d2b79f5) >>> 0;
    let t = state;
    t = Math.imul(t ^ (t >>> 15), t | 1);
    t ^= t + Math.imul(t ^ (t >>> 7), t | 61);
    return ((t ^ (t >>> 14)) >>> 0) / 4294967296;
  }
  return {
    next,
    die(sides: number): number {
      return Math.floor(next() * sides) + 1;
    },
  };
}
