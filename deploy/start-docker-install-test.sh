#!/bin/sh
cd "$(dirname "$0")/.."
. ./bin/lib/strict-mode.sh
exec docker run --rm --interactive --tty \
  --volume "${PWD}:/opt" --workdir /opt \
  --env USER=root \
  --publish 127.0.0.1:9120:9120 \
  "ubuntu:18.04" /bin/bash
