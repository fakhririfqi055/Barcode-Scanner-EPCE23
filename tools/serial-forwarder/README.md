Serial -> WebSocket forwarder

Purpose
- If your barcode scanner is in Serial (COM) mode, a browser cannot read it directly. This helper reads from a COM port and forwards scanned barcodes to frontend(s) via WebSocket.

Requirements
- Node.js installed

Install & Run (PowerShell example)

```powershell
cd 'C:\Tugas kuliah\Project\tools\serial-forwarder'
npm install
# run; optionally set COM port and baud:
$env:COM_PORT='COM3'; $env:BAUD='9600'; npm start
# or pass COM port as arg:
node index.js COM4
```

Default WebSocket server: `ws://localhost:8765`

Frontend integration
- Frontend should connect to the ws server and listen for JSON messages like: `{ "barcode": "12345678" }`.
- When a message arrives, populate the barcode input and trigger the same behavior as keyboard scanning.

Notes
- Ensure only you trust the network if you expose the websocket publicly.
- Many scanners can be switched to HID (keyboard) mode — if possible prefer that, as it requires no helper.
