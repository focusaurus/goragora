#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
exec docker run --detach --restart=unless-stopped \
  --volume "${PWD}:/opt" \
  --publish 0.0.0.0:9125:9125 \
  goragora
