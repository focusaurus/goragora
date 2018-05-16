# Gora Gora Orkestar's web site

This is a static web site managed with the [wintersmith](https://github.com/jnordberg/wintersmith) static site generator, which runs in node.js.

It can be run locally with node.js and also has files and scripts supporting docker. There are 2 main pieces.

* The wintersmith static site build process
* A github web hook node.js web server
  * github sends an HTTP request to this service whenever new changes are pushed to github
  * The service triggers a rebuild of the latest content via `bin/github-hook-rebuild.sh`

## How it works

wintersmith reads the `templates` and `contents` and generates full HTML pages for a static web site into the `build` directory. Once built, the site can be served by any static web server. We use nginx in production.

To make live edits from [github.com](https://github.com), edit the page in the `contents` or `templates` directory and when that change is saved ("merged to master" in git terminology), github will execute a "web hook" which will tell the http://goragora.org web site server to get the latest code and rebuild the site, at which point the changes are live on the web.

## How to set up for local development

* install node.js
  * see the `.nvmrc` file and use that version of node.js
* install bash, git if you don't already have them

## Local Development scripts

* `./bin/build-site.sh` generate static files for production web server mode
  * These end up in the `build` directory
* `./bin/clean.sh` remove generated files (`build` directory)
* `./bin/preview.sh` will build the site and start a web server so you can preview your local changes in a web browser. Preview URL is [http://localhost:9120]()

## Docker scripts

* Install docker if you want to run this via docker
* `./docker/build-image.sh` will build the "goragora" docker image for this project. This is **just** the prerequisite toolchain (node, git, bash, etc). Not the actual web site content nor the npm dependencies.
* `./docker/build-site.sh` will generate the static site files by running wintersmith in the "goragora" docker image. Generated files will be available locally in your `build` directory though, not inside any docker container.
* `./docker/service-start.sh` used to start the github web hook service in production under docker
* `./docker/preview.sh` used to start nginx in a docker container using the static site's configuration. The URL will be [http://stage.goragora.org:9121](). Add `127.0.0.1 stage.goragora.org` to your `/etc/hosts` file to setup a mock DNS record so the hostname works.
* `./docker/run.sh bash` Used to run a shell (or other ad-hoc command) in the docker image as needed

## How to deploy to a production server

* Install Ubuntu server linux distribution
* Install docker community edition
* Follow and copy/paste the steps in `./deploy/setup-new-server.sh`
