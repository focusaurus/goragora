#!/usr/bin/env node
var childProcess = require("child_process")
var http = require("http")

const PORT = process.env.PORT || 9125;

http.createServer(function(req, res) {
  function deployDone(error, stdout, stderr) {
    process.stdout.write(stdout)
    process.stderr.write(stderr)
    if (error) {
      res.writeHead(500, {
        "Content-Type": "text/plain"
      })
      res.end("Oops\n" + error.message)
      process.stderr.write("\ndeploy failed " + error.message)
      return
    }
    res.writeHead(200, {
      "Content-Type": "text/plain"
    })
    res.end("Thank you, github!\n")
    process.stdout.write("\ndeploy succeeded\n")
  }
  childProcess.exec(__dirname + "/deploy.sh", deployDone)
}).listen(PORT, "0.0.0.0")

console.log("GGO github hook listening on", PORT)
