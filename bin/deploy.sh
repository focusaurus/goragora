#!/bin/bash
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH=$(pwd)/../node/bin:$PATH
PATH=$(npm bin):$PATH

git pull origin master
npm install --production
wintersmith build
