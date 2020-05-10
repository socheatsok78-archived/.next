#!/usr/bin/env bash

set -e
source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

ohai "Installing ZSH Profile..."
stow --target ${HOME} --ignore .DS_Store -Rv home
