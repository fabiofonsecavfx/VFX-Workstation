#!/bin/bash

chsh -s "$(which zsh)"

# Install zsh plugins
zsh_config_path="$HOME/.config/zsh"
plugins_path="$zsh_config_path/plugins"

mkdir -p "$plugins_path"

git clone "https://github.com/zsh-users/zsh-autosuggestions.git" "$plugins_path/zsh-autosuggestions"
git clone "https://github.com/zsh-users/zsh-syntax-highlighting.git" "$plugins_path/zsh-syntax-highlighting"
git clone "https://github.com/zsh-users/zsh-completions.git" "$plugins_path/zsh-completions"

# Install Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s

# Create zsh symlinks
ln -sfv "$WS_CONFIG_PATH/zsh/plugins" "$zsh_config_path"
ln -sfv "$WS_CONFIG_PATH/zsh/.zshrc" "$HOME"
