# Gora Gora Orkestar's web site

This is a static web site managed with the [wintersmith](https://github.com/jnordberg/wintersmith) static site generator, which runs in node.js.

It can be run locally with node.js and also has files and scripts supporting docker.

## How it works

wintersmith reads the `templates` and `contents` and generates full HTML pages for a static web site into the `build` directory. Once built, the site can be served by any static web server.

To make live edits from [github.com](https://github.com), edit the page in the `contents` or `templates` directory and when that change is saved ("merged to main" in git terminology), github will execute a "web hook" which will tell the https://goragora.org web site server to get the latest code and rebuild the site, at which point the changes are live on the web.

## How to set up for local development

* install node.js
  * see the `.nvmrc` file and use that version of node.js
* install bash, git if you don't already have them

## How to (local mode)…

* Run a build (generate the files for a static web site):
  * `./bin/build-site.sh`
  * Files end up in the `build` directory
* Preview the site in your browser
  * `./bin/preview.sh`
  * This will build the site and start a web server so you can preview your local changes in a web browser.
  * Preview URL is [http://localhost:9120]()
* Delete the generated files (`build` directory)

## How to (docker mode)…

* Install docker if you want to run this via docker
* `./docker/build-image.sh` will build the "goragora" docker image for this project. This is **just** the prerequisite toolchain (node, git, bash, etc). Not the actual web site content nor the npm dependencies.
* `./docker/build-site.sh` will generate the static site files by running wintersmith in the "goragora" docker image. Generated files will be available locally in your `build` directory though, not inside any docker container.
* `./docker/service-start.sh` used to start the github web hook service in production under docker
* `./docker/preview.sh` used to start nginx in a docker container using the static site's configuration. The URL will be [http://localhost:9121]().
* `./docker/run.sh bash` Used to run a shell (or other ad-hoc command) in the docker image as needed. The project directory will be mounted at `/opt` and your shell will be in that directory initially.

## How the production site is hosted

The site is hosted by [netlify](https://app.netlify.com) and works together with code pushed to [the focusuarus/goragora github repo](https://github.com/focusaurus/goragora)

### Live production builds

* Any change merged to the `main` branch will get automatically built by netlify and published to the live site at https://goragora.org
* Pull requests will also be separately built and given a special preview URL where you can view the changes before merging the pull request.
* This all lives under Pete's Netlify account but at some point we can transfer elsewhere. Netlify is free for this so no big whoop.
* Pete has the goragora.org DNS domain name registered with gandi.net as the registrar and DNS is configured so goragora.org resolves to Netlify's servers properly.
