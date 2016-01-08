# Gora Gora Orkestar's web site

This is a static web site managed with the [wintersmith](https://github.com/jnordberg/wintersmith) static site generator

# How it works

wintersmith reads the `templates` and `contents` and generates full HTML pages for a static web site into the `build` directory. Once built, the site can be served by any static web server.

To make live edits from [github.com](https://github.com), edit the page in the `contents` or `templates` directory and when that change is saved ("merged to master" in git terminology), github will execute a "web hook" which will tell the http://goragora.org web site server to get the latest code and rebuild the site, at which point the changes are live on the web.

# Development scripts

- `./bin/preview.sh` will build the site and start a web server so you can preview your local changes in a web browser. Preview URL is [http://localhost:9120]()
- `./bin/build.sh` generate static files for production web server mode (used during automated deployment)
- `./bin/clean.sh` remove generated files
