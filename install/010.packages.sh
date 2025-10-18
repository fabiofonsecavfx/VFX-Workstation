#!/bin/bash

set -e

sudo dnf groupinstall -y "Development Tools"

sudo dnf install -y tar \
  zsh \
  util-linux-user \
  unzip \
  fzf \
  zoxide \
  ripgrep \
  fd-find \
  bat \
  cmake \
  lua5.1 \
  lua5.1-devel \
  luarocks \
  nodejs

# Lazygit
sudo dnf copr enable -y atim/lazygit
sudo dnf install -y lazygit

# Rust and treesitter-cli
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"
cargo install --locked tree-sitter-cli
