#!/bin/bash

set -e

sudo dnf install -y lua5.1 lua5.1-devel

# Install Nvim
mkdir -p "$HOME/src"
cd "$HOME/src" || exit
git clone https://github.com/neovim/neovim
cd neovim || exit
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# Symlink Configs
mkdir "$HOME/.config/nvim"
ln -sfv "$WS_CONFIG_PATH/nvim/lua" "$HOME/.config/nvim/lua"
ln -sfv "$WS_CONFIG_PATH/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# Lazygit
sudo dnf copr enable -y atim/lazygit
sudo dnf install -y lazygit

# Rust and treesitter-cli
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
cargo install --locked tree-sitter-cli

# Nodejs and MMDC
sudo dnf module enable nodejs:20
sudo dnf install nodejs
