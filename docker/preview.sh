#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
echo Load site at the following URL:
echo http://stage.goragora.org:9121
exec docker run --rm \
  --volume "${PWD}/docker/goragora.org:/etc/nginx/conf.d/default.conf:ro" \
  --volume "${PWD}/build:/home/goragora/goragora/build:ro" \
  --publish 127.0.0.1:9121:80 \
  nginx:1.14-alpine
