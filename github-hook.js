#!/usr/bin/env node
const childProcess = require("child_process");
const http = require("http");

const PORT = Number(process.env.PORT) || 9125;

function deployDone(error, stdout, stderr) {
  process.stdout.write(stdout);
  process.stderr.write(stderr);
  if (error) {
    process.stderr.write(`\ndeploy failed: ${error.message}`);
    return;
  }
  process.stdout.write("\ndeploy succeeded\n");
}

http
  .createServer(function(req, res) {
    res.writeHead(200, {
      "Content-Type": "text/plain"
    });
    res.end("Thank you, github!\n");
    childProcess.exec(__dirname + "/bin/github-hook-rebuild.sh", deployDone);
  })
  .listen(PORT, "0.0.0.0");

console.log("GGO github hook listening on", PORT);
