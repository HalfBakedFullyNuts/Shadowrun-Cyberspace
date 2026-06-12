// Typed access to the preload bridge. Falls back to browser-only stubs so the
// renderer can run in a plain browser tab during development.
export interface LtgFile {
  path: string;
  content: string;
}

interface McsBridge {
  openLtg(): Promise<LtgFile | null>;
  readLtg(path: string): Promise<LtgFile>;
  saveLtg(args: { path: string | null; content: string; suggestedName?: string }): Promise<{ path: string } | null>;
  listExamples(): Promise<{ name: string; path: string }[]>;
}

declare global {
  interface Window {
    mcs?: McsBridge;
  }
}

export function bridge(): McsBridge {
  if (window.mcs) return window.mcs;
  return {
    async openLtg() {
      return null;
    },
    async readLtg(path: string) {
      const res = await fetch(path);
      if (!res.ok) throw new Error(`Cannot load ${path}`);
      return { path, content: await res.text() };
    },
    async saveLtg(args) {
      const blob = new Blob([args.content], { type: 'text/plain' });
      const a = document.createElement('a');
      a.href = URL.createObjectURL(blob);
      a.download = args.suggestedName || 'matrix.ltg';
      a.click();
      URL.revokeObjectURL(a.href);
      return null;
    },
    async listExamples() {
      // Browser-dev fallback: examples served from Vite's public dir.
      try {
        const res = await fetch('/examples/index.json');
        if (!res.ok) return [];
        const names: string[] = await res.json();
        return names.map((name) => ({ name, path: `/examples/${name}` }));
      } catch {
        return [];
      }
    },
  };
}
