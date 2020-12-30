#!/bin/bash

if [ $# -lt 2 ]; then
  echo 1>&2 "ERROR: Not enough arguments"
  echo "USAGE: bash hacky_npm_link.sh <name of package> <path to local repo of package>"
  exit 2
fi

SOURCE_DIRECTORY=$2
TARGET_DIRECTORY=$1

cd node_modules/$TARGET_DIRECTORY && \
  rm -rf * && \
  # hard link all files at surface level of $SOURCE_DIRECTORY
  find $SOURCE_DIRECTORY -maxdepth 1 -mindepth 1 -type f -not -name ".*" -exec ln {} \; && \
  # hard link all files at dist folder of $SOURCE_DIRECTORY
  mkdir -p dist && cd dist && \
  find $SOURCE_DIRECTORY/dist -maxdepth 1 -mindepth 1 -type f -not -name ".*" -exec ln {} \; && \
  # hard link all files at es folder of $SOURCE_DIRECTORY
  mkdir -p es && cd es && \
  find $SOURCE_DIRECTORY/es -maxdepth 1 -mindepth 1 -type f -not -name ".*" -exec ln {} \;