#!/usr/bin/env node
var childProcess  = require("child_process")
var http          = require("http")

function deployDone (error, stdout, stderr) {
  process.stdout.write(stdout)
  process.stderr.write(stderr)
  if (error) {
    process.stderr.write("\ndeploy failed\n")
  } else {
    process.stdout.write("\ndeploy succeeded\n")
  }
}

http.createServer(function(req, res) {
  res.writeHead(200, {"Content-Type": "text/plain"})
  res.end("Thank you, github!\n")
  childProcess.exec(__dirname + "/deploy.sh", deployDone)
}).listen(9125, "0.0.0.0")
