#!/usr/bin/env bash

# If bash is not running interactively, don't do anything.
case $- in
    *i*) ;;
      *) return;;
esac

# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS.
shopt -s checkwinsize

# Store the path to the directory for bash configuration files for later use.
ROOT_BASH=~/.config/bash

# Abort bash configuration when the configuration file is not at the expected
# location.
if [[ ! -f "$ROOT_BASH/.bashrc" ]]; then
  echo "ERROR .bashrc must be located at $ROOT_BASH/.bashrc"
  exit 1
fi

# load extensions
for file in "$ROOT_BASH/extensions/"*; do
  source "$file"
done
