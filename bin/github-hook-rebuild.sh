#!/usr/bin/env bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH="${PWD}/node_modules/.bin:${PATH}"
git pull origin master
npm install --production --no-package-lock
wintersmith build
