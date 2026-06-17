#!/usr/bin/env node
var cp = require('child_process');
var relayDir = '/tmp/anime-relay';
var relayLog = '/tmp/relay.log';
var port = 3456;

try { cp.execSync('pkill -f "node index.js" 2>/dev/null; pkill -f cloudflared 2>/dev/null'); } catch(e) {}

var relay = cp.spawn('node', ['index.js'], {
  cwd: relayDir,
  env: { ...process.env, PORT: String(port) },
  stdio: ['ignore', 'pipe', 'pipe'],
  detached: true
});
relay.unref();
var log = require('fs').createWriteStream(relayLog);
relay.stdout.on('data', function(d) { log.write(d); process.stdout.write('relay: ' + d); });
relay.stderr.on('data', function(d) { log.write(d); process.stderr.write('relay: ' + d); });

console.log('Relay running at http://localhost:' + port);
console.log('Press Ctrl+C to stop');
