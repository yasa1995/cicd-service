var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("<h1> Deployed Version is v3.0. cloud build in action final test</h1>");
}
var www = http.createServer(handleRequest);
www.listen(8080);
