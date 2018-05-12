#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
docker run --interactive --tty --volume="${PWD}:/opt" goragora ./bin/build-site.sh
