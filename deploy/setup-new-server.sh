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
cd goragora
./bin/setup-node.sh
./bin/build.sh
EOF

# goragora-github-hook service
base="/home/goragora/goragora"
service="goragora-github-hook"
ln -nsf "${base}/deploy/${service}.service" /etc/systemd/system
systemctl daemon-reload
service "${service}" start

# nginx
apt --yes --quiet install nginx
mkdir -p "${base}/var/log"
touch "${base}"/var/log/nginx.{access,error}.log
chown -R www-data:goragora "${base}/var/log/"
chmod -R g+w "${base}/var/log"
ln -nsf "${base}/deploy/goragora.org" "/etc/nginx/sites-enabled"
nginx -t && service nginx reload
