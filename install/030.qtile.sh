#!/bin/bash

set -e

# Install Qtile dependencies
sudo dnf install -y \
  python3-cffi \
  python3-cairo \
  cairo-devel \
  pango \
  pango-devel \
  dbus \
  python3-dbus \
  xorg-x11-server-Xorg \
  python3-xcffib \
  libxcb-devel \
  python3.11 \
  python3.11-devel

# Create python3.11 virtual env
python3.11 -m venv "$HOME/.qtile-venv"
source "$HOME/.qtile-venv/bin/activate"

# Install Qtile inside venv
pip install --upgrade pip wheel
pip install qtile

# Create config syslink
ln -sf "$WS_CONFIG_PATH/qtile/config.py" "$HOME/.config/qtile/config.py"
