#!/usr/bin/env bash

# Please Use Google Shell Style: https://google.github.io/styleguide/shell.xml

# ---- Start unofficial bash strict mode boilerplate
# http://redsymbol.net/articles/unofficial-bash-strict-mode/
set -o errexit  # always exit on error
set -o errtrace # trap errors in functions as well
set -o pipefail # don't ignore exit codes when piping output
set -o posix    # more strict failures in subshells
# set -x          # enable debugging

IFS="$(printf "\n\t")"
# ---- End unofficial bash strict mode boilerplate

apt --yes --quiet update
apt --yes --quiet install git-core curl
adduser --gecos goragora --disabled-login goragora

su - goragora -c 'git clone https://github.com/focusaurus/goragora.git'
su - goragora -c 'cd goragora && ./bin/setup-node.sh'
su - goragora -c 'cd goragora && ./bin/build.sh'

# goragora-github-hook service
service="goragora-github-hook"
ln -nsf "${PWD}/deploy/${service}.service" /etc/systemd/system
systemctl daemon-reload
service "${service}" start

# nginx
apt --yes --quiet install nginx
ln -nsf "${PWD}/deploy/goragora.org" "/etc/nginx/sites-enabled"
nginx -t && service nginx reload
