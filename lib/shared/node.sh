#!/usr/bin/env bash

set -e
source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

npk() {
    if [ `command -v yarn` ]; then
        yarn global add $@ --no-progress --silent
    else
        npm install --quiet --no-progress --global $@
    fi
}

ohai "Installing NodeJS Applications..."

echo "    - Development tools"
npk "@vue/cli"
npk "typescript"

echo "    - CLI tools"
npk "http-server"
npk "ndb"

echo "    - 3rd-party tools"
npk "npkill"
npk "insomnia-documenter"
# npk "tiny-care-terminal"
