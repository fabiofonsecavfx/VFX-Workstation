#!/bin/bash

set -e

chsh -s "$(which zsh)"

# Install zsh zsh_plugins
zsh_config_path="$HOME/.config/zsh/config"
zsh_plugins_path="$HOME/.config/zsh/zsh_plugins"

mkdir -p "$zsh_plugins_path"
mkdir -p "$zsh_config_path"

set +e
git clone "https://github.com/zsh-users/zsh-autosuggestions.git" "$zsh_plugins_path/zsh-autosuggestions"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$zsh_plugins_path/zsh-syntax-highlighting"
git clone "https://github.com/zsh-users/zsh-completions.git" "$zsh_plugins_path/zsh-completions"
set -e

# Install Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Create zsh symlinks
ln -sfv "$WS_CONFIG_PATH/zsh/zsh/config" "$zsh_config_path"
ln -sfv "$WS_CONFIG_PATH/zsh/.zshrc" "$HOME"
