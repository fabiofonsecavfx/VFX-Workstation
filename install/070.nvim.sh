#!/bin/bash

set -e

# Install Nvim
mkdir -p "$HOME/src"
mkdir -p "$HOME/.local/bin"
cd "$HOME/src" || exit
git clone https://github.com/neovim/neovim
cd neovim || exit
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# Symlink Configs
mkdir "$HOME/.config/nvim"
ln -sfv "$WS_CONFIG_PATH/nvim/lua" "$HOME/.config/nvim/lua"
ln -sfv "$WS_CONFIG_PATH/nvim/init.lua" "$HOME/.config/nvim/init.lua"
