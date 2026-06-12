const { contextBridge, ipcRenderer } = require('electron');

contextBridge.exposeInMainWorld('mcs', {
  openLtg: () => ipcRenderer.invoke('ltg:open'),
  readLtg: (filePath) => ipcRenderer.invoke('ltg:read', filePath),
  saveLtg: (args) => ipcRenderer.invoke('ltg:save', args),
  listExamples: () => ipcRenderer.invoke('examples:list'),
  openFile: (filter) => ipcRenderer.invoke('file:open', filter),
});
