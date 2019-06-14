#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
docker run --rm --interactive --tty \
  --user $(id -u) \
  --env HOME=/home/node \
  --volume="${PWD}:/opt" goragora ./bin/build-site.sh
