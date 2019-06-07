
const WebSocket = require('ws');
const ws = new WebSocket('wss://irc-ws.chat.twitch.tv:443/');

// Nick for no login:
var randomNick = "justinfan" + 
    (Math.floor(Math.random()*(99999 - 10000) + 10000)).toString();

ws.on('open', function open() {
  console.log("connecting")
  ws.send('CAP REQ :twitch.tv/tags twitch.tv/commands');
  ws.send('PASS SCHMOOPIIE'); // You can see this when opening chat unlogged
  ws.send('NICK ' + randomNick);
  ws.send('USER ' + randomNick + ' 8 * :'+randomNick);
  ws.send('JOIN #' + process.env.USERNAME);
});


ws.on('message', function incoming(data) {
  if (data.indexOf("PING") == 0) {
    console.log('ping');
    ws.send(data.replace("PING","PONG"));
  }
  else if (data.indexOf("PONG") == 0) {
    // IGNORE
    console.log('pong');
  }
  else {
    // Print line
    console.log(data);
  }
});


ws.on('close', function close() {
  console.log('disconnected');
  process.exit()
});

// Ping every 5 minutes
setInterval(()=>{ws.send("PING");}, 1000 * 60 * 5)

// Make the app stay open:
process.stdin.resume();
