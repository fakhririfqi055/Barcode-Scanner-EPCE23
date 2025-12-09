// Serial -> WebSocket forwarder
// Usage: set environment variables or pass args
//   PORT (websocket port, default 8765)
//   COM_PORT (e.g., COM3) or first CLI arg
//   BAUD (default 9600)

const WebSocket = require('ws');
const SerialPort = require('serialport');
const Readline = require('@serialport/parser-readline');

const WS_PORT = process.env.WS_PORT ? parseInt(process.env.WS_PORT) : 8765;
const COM_PORT = process.env.COM_PORT || process.argv[2] || 'COM3';
const BAUD = process.env.BAUD ? parseInt(process.env.BAUD) : 9600;

console.log(`Starting serial-forwarder: COM=${COM_PORT} BAUD=${BAUD} WS_PORT=${WS_PORT}`);

// Start WebSocket server
const wss = new WebSocket.Server({ port: WS_PORT });
wss.on('listening', () => console.log(`WebSocket server listening on ws://localhost:${WS_PORT}`));

wss.on('connection', (ws) => {
  console.log('Frontend connected to ws');
  ws.send(JSON.stringify({ welcome: true }));
});

// Open serial port
const port = new SerialPort(COM_PORT, { baudRate: BAUD, autoOpen: false });
const parser = port.pipe(new Readline({ delimiter: '\r\n' }));

port.open((err) => {
  if (err) {
    console.error('Failed to open serial port', err.message);
    process.exit(1);
  }
  console.log('Serial port opened');
});

parser.on('data', data => {
  const code = String(data || '').trim();
  if (!code) return;
  console.log('Scanned:', code);
  // broadcast to all connected websocket clients
  const payload = JSON.stringify({ barcode: code });
  wss.clients.forEach(client => {
    if (client.readyState === WebSocket.OPEN) client.send(payload);
  });
});

port.on('error', (err) => console.error('Serial port error', err));
