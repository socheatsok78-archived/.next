#!/usr/bin/env bash

set -e
source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

LOCAL_BIN=${LOCAL_BIN:-$HOME/.local/bin}

ohai "Installing 3rd-party tools..."

echo " ---> Installing cht.sh..."
curl -s -o "$LOCAL_BIN/cht.sh" https://cht.sh/:cht.sh
chmod +x "$LOCAL_BIN/cht.sh"
