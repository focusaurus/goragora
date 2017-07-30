#!/bin/bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH=$(pwd)/../node/bin:$PATH
PATH=$(npm bin):$PATH

if [[ ! -d node_modules ]]; then
  npm install
fi
(sleep 0.5 && open http://localhost:9120/shows &)
wintersmith preview
