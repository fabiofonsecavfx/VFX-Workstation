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
  bat
