#!/usr/bin/env bash
cd "$(dirname "$0")"
source ../bin/lib/strict-mode.sh
docker build --tag goragora --build-arg NODE_VERSION="$(cat ../.nvmrc)" .
