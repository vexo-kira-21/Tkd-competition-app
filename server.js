
const WebSocket = require('ws');
const wss = new WebSocket.Server({ port: 3000 });

let match = {
  score: { red: 0, blue: 0 },
  inputs: [],
  locked: false
};

wss.on('connection', ws => {
  ws.on('message', msg => {
    const data = JSON.parse(msg);

    if (match.locked) return;

    if (data.type === "score") {
      match.inputs.push({ fighter: data.fighter, time: Date.now() });
      processInputs();
    }

    if (data.type === "penalty") {
      match.score[data.fighter] -= 1;
      broadcast();
    }
  });
});

function processInputs() {
  const now = Date.now();
  const recent = match.inputs.filter(i => now - i.time < 1000);

  let red = recent.filter(i => i.fighter === "red").length;
  let blue = recent.filter(i => i.fighter === "blue").length;

  if (red >= 2) {
    match.score.red++;
    match.locked = true;
    broadcast();
  }

  if (blue >= 2) {
    match.score.blue++;
    match.locked = true;
    broadcast();
  }
}

function broadcast() {
  wss.clients.forEach(client => {
    client.send(JSON.stringify(match.score));
  });
}

console.log("Server running...");
