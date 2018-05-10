#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH="${PWD}/node/bin:$(npm bin):${PATH}"
git pull origin master
npm install --production
wintersmith build
