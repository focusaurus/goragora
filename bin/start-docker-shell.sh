#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
exec docker run --rm --interactive --tty \
  --volume "${PWD}:/opt" --workdir /opt \
  --env USER=root \
  --env PATH=/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/node_modules/.bin \
  --publish 127.0.0.1:9120:9120 \
  "mhart/alpine-node:$(cat .nvmrc)" /bin/sh
