#!/usr/bin/env bash

set -e
source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

ohai "Installing git configs and tools..."

echo " ---> Installing git alias..."

echo "    - git dry-commit"
git config --global alias.dry-commit 'commit --allow-empty -m "init project"'

echo "    - git ignore"
git config --global alias.ignore '!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi'

echo "    - git accept-ours"
git config --global alias.accept-ours '!f() { [ -z "$@" ] && set - '.'; git checkout --ours -- "$@"; git add -u -- "$@"; }; f'

echo "    - git accept-theirs"
git config --global alias.accept-theirs '!f() { [ -z "$@" ] && set - '.'; git checkout --theirs -- "$@"; git add -u -- "$@"; }; f'

echo " ---> git alias installed!"
