#!/usr/bin/env bash

source "./home/.dotfile/zsh.config.d/functions/homebrew.env"

DOTFILE_HOME=$HOME/.dotfile

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

# Install Applications and Tools via Homebrew
ohai "Installing development tools..."
execute "brew" "bundle" "--no-lock" "--file" "./lib/homebrew/developments.brewfile"

ohai "Installing tools..."
execute "brew" "bundle" "--no-lock" "--file" "./lib/homebrew/tools.brewfile"

ohai "Installing web-server..."
execute "brew" "bundle" "--no-lock" "--file" "./lib/homebrew/webserver.brewfile"

ohai "Installing applications..."
execute "brew" "bundle" "--no-lock" "--file" "./lib/homebrew/applications.brewfile"

# Install
ohai "Installing git aliases..."
execute "./lib/shared/install_git_alias.sh"

ohai "Installing 3rd-party tools..."
execute "./lib/shared/install_third_party_tools.sh"

if [[ ":${PATH}:" != *":${DOTFILE_HOME}/bin:"* ]]; then
    warn "${DOTFILE_HOME}/bin is not in your PATH."
fi

ohai "Installation successful!"
