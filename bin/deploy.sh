#!/bin/sh
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH="${PWD}/node/bin:${PWD}/node_modules/.bin:${PATH}"
git pull origin master
npm install --production
wintersmith build
