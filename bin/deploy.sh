#!/bin/bash
echo "deploy.sh PATH is $PATH"
cd "$(dirname "$0")/.."
source ./bin/lib/strict-mode.sh
PATH=$(pwd)/../node/bin:$PATH
PATH=$(npm bin):$PATH

git pull origin master
# this takes too long
# npm install --production
wintersmith build
