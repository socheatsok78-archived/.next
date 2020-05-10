#!/usr/bin/env bash

source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

DOTFILE_HOME=$HOME/.dotfile

test "$1" = "--cask" && {
    INSTALL_BREW_CASK=1
}

# Pre-flight checklist
if [ ! -d "$LOCAL_BIN" ]; then
    mkdir -p $LOCAL_BIN
fi

ohai "This script will install:"
echo "${DOTFILE_HOME}/"
echo "$HOME/.my.cnf"
echo "$HOME/.zsh_aliases"
echo "$HOME/.zsh_completion"
echo "$HOME/.zsh_env"
echo "$HOME/.zsh_functions"
echo "$HOME/.zsh_plugins"
echo "$HOME/.zsh_profile"

# Homebrew house-keeping
ohai "Updating Homebrew..."
execute "brew" "update"

brewbundle () {
    if [ -n "$CI" ]; then
        execute "brew" "bundle" "--verbose" "--no-lock" "--file" $@
    else
        execute "brew" "bundle" "--no-lock"  "--file" $@
    fi
}

# Install Applications and Tools via Homebrew
ohai "Installing development tools..."
brewbundle "./lib/homebrew/developments.brewfile"

ohai "Installing tools..."
brewbundle "./lib/homebrew/tools.brewfile"

ohai "Installing web-server..."
brewbundle "./lib/homebrew/webserver.brewfile"

# Check if allowed to install Homebrew Cask Application
if [ -n "$INSTALL_BREW_CASK" ]; then
    ohai "Installing applications..."
    brewbundle "./lib/homebrew/applications.brewfile"
fi

# Install Additional Tools

# Installing git configs and tools...
execute "./lib/shared/git.sh"

# Installing NodeJS Applications...
execute "./lib/shared/node.sh"

# Installing 3rd-party tools...
execute "./lib/shared/tools.sh"

# Installing ZSH Profile...
execute "./lib/shared/zsh.sh"

# Installation successful!
ohai "Installation successful!"
