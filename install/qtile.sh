#!/bin/bash

# Install Qtile dependencies
sudo dnf install -y python3-cffi python3-cairo cairo-devel pango pango-devel \
  dbus python3-dbus xorg-x11-server-Xorg python3-xcffib libxcb-devel python3.11 \
  python3.11-devel ppython3.11-pip

# Install Qtile inside venv
python3.11 -m pip install qtile

# Create config syslink
mkdir -p "$HOME/.config/qtile"
ln -sfv "$WS_CONFIG_PATH/qtile/config.py" "$HOME/.config/qtile/config.py"
sudo cp "$WS_CONFIG_PATH/qtile/qtile.desktop" /usr/share/xsessions/
