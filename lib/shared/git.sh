#!/usr/bin/env bash

set -e
source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

ohai "Installing git configs and tools..."

echo " ---> Installing git alias..."

echo "    - git dry-commit"
git config --global alias.dry-commit 'commit --allow-empty -m "init project"'

echo "    - git reword"
git config --global alias.reword 'commit --amend'

echo "    - git uncommit"
git config --global alias.uncommit 'reset --soft HEAD~1'

echo "    - git untrack"
git config --global alias.untrack 'rm --cache --'

echo "    - git ignore"
git config --global alias.ignore '!gi() { curl -sL https://www.gitignore.io/api/$@ ;}; gi'

echo "    - git accept-ours"
git config --global alias.accept-ours '!f() { [ -z "$@" ] && set - '.'; git checkout --ours -- "$@"; git add -u -- "$@"; }; f'

echo "    - git accept-theirs"
git config --global alias.accept-theirs '!f() { [ -z "$@" ] && set - '.'; git checkout --theirs -- "$@"; git add -u -- "$@"; }; f'

# staged files without editing the commit message
echo "    - git oops"
git config --global alias.oops 'commit --amend --no-edit'

# ensure that force-pushing won't lose someone else's work (only mine).
echo "    - git push-with-lease"
git config --global alias.push-with-lease 'push --force-with-lease'

echo "    - git lg"
git config --global alias.lg "log --graph --date=relative --pretty=tformat:'%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%an %ad)%Creset'"

echo "    - git review-local"
git config --global alias.review-local "!git lg @{push}.."

echo " ---> git alias installed!"
