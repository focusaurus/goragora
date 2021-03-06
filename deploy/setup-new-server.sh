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

cat <<EOF | su - goragora -c bash
set -o errexit
git clone https://github.com/focusaurus/goragora.git
EOF

# docker service
./docker/service-start.sh

# nginx
base="/home/goragora/goragora"
apt --yes --quiet install nginx
ln -nsf "${base}/deploy/goragora.org" "/etc/nginx/sites-enabled"
nginx -t && service nginx reload
