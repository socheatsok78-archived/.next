#!/usr/bin/env bash

source "./home/.dotfile.env"
source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

DOTFILE_HOME=$HOME/.dotfile

test "$1" = "--cask" && {
    INSTALL_BREW_CASK=1
}

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

# Install
ohai "Installing git aliases..."
execute "./lib/shared/git_alias.sh"

ohai "Installing 3rd-party tools..."
execute "./lib/shared/third_party_tools.sh"

if [[ ":${PATH}:" != *":${DOTFILE_HOME}/bin:"* ]]; then
    warn "${DOTFILE_HOME}/bin is not in your PATH."
fi

ohai "Installation successful!"
