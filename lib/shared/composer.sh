#!/usr/bin/env bash

set -e
source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

poser() {
    echo "    - $1"
    composer global require $1 --quiet
}

ohai "Installing Composer Applications..."

poser "laravel/installer"
poser "laravel/valet"
poser "laravel/envoy"
poser "beyondcode/expose"
