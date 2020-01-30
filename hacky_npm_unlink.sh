#!/bin/bash

if [ $# -lt 1 ]; then
  echo 1>&2 "ERROR: Not enough arguments"
  echo "USAGE: bash hacky_npm_unlink.sh <name of package>"
  exit 2
fi

rm -rf node_modules/$1 && npm install
