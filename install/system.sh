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
sudo dnf install -y libXScrnSaver libXpm libappindicator network-manager-applet \
  pulseaudio-utils pavucontrol htop xclip thunar python3.11 python3.11-pip \
  gnome-themes-extra papirus-icon-theme

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
# AdwaitaSans
cp -vf "$WS_ASSETS_PATH/AdwaitaSans-Regular.ttf" "$font_dir"

fc-cache -fv

# Install Icons
sudo mkdir -p /usr/local/share/icons
sudo cp -fv "$WS_ASSETS_PATH"/icons/* /usr/local/share/icons/

# Xresources
ln -sfv "$WS_CONFIG_PATH/config/x11/.Xresources" "$HOME/.Xresources"
