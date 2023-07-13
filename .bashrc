#!/bin/bash

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

get_extensions_dir() {
  local DIR

  DIR=~/.bash/extensions
  if [[ -d "$DIR" ]]; then
    echo "$DIR"
    exit 0
  fi

  DIR=~/.config/bash/extensions
  if [[ -d "$DIR" ]]; then
    echo "$DIR"
    exit 0
  fi

  exit 1
}

EXTENSIONS_DIR=$(get_extensions_dir)
if [[ $? ]]; then
  # load extensions
  for file in "$EXTENSIONS_DIR"/*; do
    source "$file"
  done
else
  echo "WARNING No extensions directory found! No extensions loaded!"
fi
