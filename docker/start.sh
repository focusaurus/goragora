#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
exec docker run --rm --interactive --tty \
  --attach stdin --attach stdout --attach stderr \
  --volume "${PWD}:/opt" \
  --publish 127.0.0.1:9120:9120 \
  --publish 127.0.0.1:9125:9125 \
  goragora "$@"
