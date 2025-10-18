#!/bin/bash

set -e

sudo dnf install -y tar \
  zsh \
  util-linux-user \
  unzip \
  fzf \
  zoxide \
  ripgrep \
  fd-find
