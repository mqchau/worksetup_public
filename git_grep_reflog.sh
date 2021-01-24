#!/bin/bash

if [ $# -lt 2 ]; then
  echo 1>&2 "ERROR: Not enough arguments"
  echo "USAGE: bash git_grep_reflog.sh <path to file from root> <pattern to grep>"
  exit 2
fi

PATH_TO_FILE=$1
GREP_PATTERN=$2

git reflog --pretty=format:"%h" | head -n 100 | xargs -I % sh -c "(git show %:$PATH_TO_FILE 2>/dev/null | grep -n $GREP_PATTERN) && echo \"Found pattern. Run 'git show %:<path to file>' to show the file\""
