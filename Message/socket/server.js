const server = require('http').createServer()
const io = require('socket.io')(server)
var server_port = process.env.PORT || 9000;

io.on('connection', (client)=>{
    console.log('client connect...', client.id);
    client.on('disconnect', function () {
        console.log('client disconnect...', client.id)
    });
    client.on('error', function (err) {
        console.log('received error from client:', client.id)
        console.log(err)
    });
    client.on("messages", (message)=>{
        console.log(message);
        client.broadcast.emit('message-receive',message);
      })
})
server.listen(server_port, function (err) {
  if (err) throw err
  console.log('Listening on port %d', server_port);
});