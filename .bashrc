#!/usr/bin/env bash

# Set the path to bash configuration files.
ROOT_BASH=~/.config/bash

# If bash is running interactively
case $- in
  *i*)
    # Try to run zsh over bash
    # if [ -x "$(which zsh)" ]; then
    #   export SHELL=$(which zsh)
    #   exec zsh
    # fi

    # Check the window size after each command and, if necessary, update the
    # values of LINES and COLUMNS.
    shopt -s checkwinsize

    # Load scripts for interactive usage
    source "$ROOT_BASH/extensions/autocomplete"
    source "$ROOT_BASH/extensions/colors"
    source "$ROOT_BASH/extensions/editor"
    source "$ROOT_BASH/extensions/prompt"
    ;;
esac

# Path to local binaries managed by the user.
USER_BIN=~/.local/bin
export PATH=${PATH:+${PATH}:}$USER_BIN

# Path to local libraries managed by the user.
USER_LIB=~/.local/lib
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}$USER_LIB

source "$ROOT_BASH/extensions/aliases"
source "$ROOT_BASH/extensions/history"
