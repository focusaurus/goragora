#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH="${PWD}/node_modules/.bin:${PATH}"

if [[ ! -d node_modules ]]; then
  npm install
fi
wintersmith build
cp _headers build
