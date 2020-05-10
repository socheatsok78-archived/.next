#!/usr/bin/env bash

set -e
source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

# Post-Install

if [[ ":${PATH}:" != *":${DOTFILE_HOME}/bin:"* ]]; then
    warn "${DOTFILE_HOME}/bin is not in your PATH."
fi
