// Matrix Construction Set — Electron main process.
// Window management + native file dialogs/IO exposed over IPC.
const { app, BrowserWindow, ipcMain, dialog, Menu, shell } = require('electron');
const path = require('node:path');
const fs = require('node:fs');

const LTG_FILTERS = [
  { name: 'Matrix Grid (*.ltg, *.rtg)', extensions: ['ltg', 'rtg'] },
  { name: 'All Files', extensions: ['*'] },
];

function createWindow() {
  const win = new BrowserWindow({
    width: 1440,
    height: 900,
    minWidth: 1100,
    minHeight: 700,
    backgroundColor: '#07090d',
    autoHideMenuBar: true,
    webPreferences: {
      preload: path.join(__dirname, 'preload.cjs'),
      contextIsolation: true,
      nodeIntegration: false,
      sandbox: true,
    },
  });
  Menu.setApplicationMenu(null);

  const devUrl = process.env.VITE_DEV_SERVER_URL || 'http://localhost:5173';
  if (process.env.NODE_ENV !== 'production' && !app.isPackaged && process.env.MCS_LOAD_DIST !== '1') {
    win.loadURL(devUrl);
  } else {
    win.loadFile(path.join(__dirname, '..', 'dist', 'index.html'));
  }

  win.webContents.setWindowOpenHandler(({ url }) => {
    if (url.startsWith('https://')) shell.openExternal(url);
    return { action: 'deny' };
  });
  return win;
}

function examplesDir() {
  return app.isPackaged
    ? path.join(process.resourcesPath, 'examples')
    : path.join(__dirname, '..', 'examples');
}

ipcMain.handle('ltg:open', async (event) => {
  const win = BrowserWindow.fromWebContents(event.sender);
  const res = await dialog.showOpenDialog(win, { filters: LTG_FILTERS, properties: ['openFile'] });
  if (res.canceled || res.filePaths.length === 0) return null;
  const filePath = res.filePaths[0];
  const content = fs.readFileSync(filePath, 'latin1');
  return { path: filePath, content };
});

ipcMain.handle('ltg:read', async (_event, filePath) => {
  // Used for loading bundled examples and LNK-referenced grids.
  const content = fs.readFileSync(filePath, 'latin1');
  return { path: filePath, content };
});

ipcMain.handle('ltg:save', async (event, { path: filePath, content, suggestedName }) => {
  const win = BrowserWindow.fromWebContents(event.sender);
  let target = filePath;
  if (!target) {
    const res = await dialog.showSaveDialog(win, {
      filters: LTG_FILTERS,
      defaultPath: suggestedName || 'matrix.ltg',
    });
    if (res.canceled || !res.filePath) return null;
    target = res.filePath;
  }
  fs.writeFileSync(target, content, 'latin1');
  return { path: target };
});

ipcMain.handle('file:open', async (event, { name, extensions }) => {
  const win = BrowserWindow.fromWebContents(event.sender);
  const res = await dialog.showOpenDialog(win, {
    filters: [{ name, extensions }, { name: 'All Files', extensions: ['*'] }],
    properties: ['openFile'],
  });
  if (res.canceled || res.filePaths.length === 0) return null;
  return { path: res.filePaths[0], content: fs.readFileSync(res.filePaths[0], 'latin1') };
});

ipcMain.handle('examples:list', async () => {
  const dir = examplesDir();
  if (!fs.existsSync(dir)) return [];
  return fs
    .readdirSync(dir)
    .filter((f) => /\.(ltg|rtg)$/i.test(f))
    .map((f) => ({ name: f, path: path.join(dir, f) }));
});

app.whenReady().then(() => {
  createWindow();
  app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) createWindow();
  });
});

app.on('window-all-closed', () => {
  if (process.platform !== 'darwin') app.quit();
});
