
#!/bin/bash

if [ $# -lt 2 ]; then
  echo 1>&2 "ERROR: Not enough arguments"
  echo "USAGE: bash hacky_npm_link.sh <name of package> <path to local repo of package>"
  exit 2
fi

cd node_modules/$1 && \
  rm -rf * && \
  find $2 -maxdepth 1 -mindepth 1 -not -name "node_modules" -not -name ".git" -not -name ".*" -exec ln -s {} \;
