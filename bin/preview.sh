#!/bin/bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH=$(npm bin):$PATH

if [[ ! -d node_modules ]]; then
  npm install
fi
wintersmith preview
