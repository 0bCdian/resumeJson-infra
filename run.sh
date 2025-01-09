#!/usr/bin/env bash

TF_ENV=$1

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
# Always run from the location of this script
cd "$DIR" || exit

if [ $# -gt 0 ]; then
  if [ "$2" == "init" ]; then
    tofu -chdir="./$TF_ENV" init
  else
    tofu -chdir="./$TF_ENV" "$2"
  fi
fi

# Head back to original location to avoid surprises
cd - || exit
