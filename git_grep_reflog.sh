#!/bin/bash

if [ $# -lt 2 ]; then
  echo 1>&2 "ERROR: Not enough arguments"
  echo "USAGE: bash git_grep_reflog.sh <path to file from root> <pattern to grep> <max # of commits in reflog, default 100>"
  exit 2
fi

PATH_TO_FILE=$1
GREP_PATTERN=$2
MAX_COMMITS=${3:-100}

: > ./matching_commits
git reflog --pretty=format:"%h" | head -n $MAX_COMMITS | xargs -I % sh -c "(git show %:$PATH_TO_FILE 2>/dev/null | grep -n $GREP_PATTERN) && echo % >> ./matching_commits"
cat ./matching_commits | xargs -I % echo "Found pattern in commit %. Run 'git show %:$PATH_TO_FILE' to show the file"
rm ./matching_commits
