#!/bin/bash

set -e

# Install Groups
sudo dnf groupinstall -y --with-optional \
  "base-x" \
  "Standard" \
  "Hardware Support" \
  "Input Methods" \
  "Common NetworkManager Submodules" \
  "Development Tools" \
  "Fonts" \
  "Multimedia"

# Install Packages
sudo dnf install -y make cmake ninja-build pkgconf-pkg-config git wget curl i3 \
  gnome-themes-extra clang gcc-c++ mpd dbus-devel gcc git meson

# Setup services and scripts
sudo cp -v "$WS_SCRIPTS_PATH"/* /usr/local/bin
sudo cp -v "$WS_SERVICES_PATH"/* /etc/systemd/system

services=("$WS_SERVICES_PATH"/*)
for serv in "${services[@]}"; do
  serv_name=$(basename "$serv")
  sudo systemctl enable "$serv_name"
done

# Install Fonts
font_dir="$HOME/.local/share/fonts"
mkdir -p "$font_dir"
# AdwaitaMono Nerd Font
tar -xvf "$WS_ASSETS_PATH/AdwaitaMono.tar.gz" -C "$font_dir"
fc-cache -fv

# Wallpapers setup
sudo rm -rf /usr/share/backgrounds/*
sudo tar -xvf "$WS_ASSETS_PATH"/backgrounds.tar.gz -C /usr/share/backgrounds/
