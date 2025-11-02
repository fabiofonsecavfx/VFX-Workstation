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
sudo dnf install -y \
  cmake \
  ninja-build \
  pkgconf-pkg-config \
  git \
  wget \
  curl \
  i3 \
  gnome-themes-extra

# Install LightDM without extra stuff
sudo dnf install -y --setopt=install_weak_deps=False lightdm slick-greeter
sudo cp -fv "$WS_CONFIG_PATH"/lightdm/*.conf /etc/lightdm
sudo cp -rfv "$WS_CONFIG_PATH"/lightdm/LightDM /usr/shre/themes

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

# Install feh
# feh dependencies
sudo dnf install -y \
  imlib2 \
  imlib2-devel \
  libX11-devel \
  libXinerama-devel \
  libXext-devel \
  libcurl-devel \
  libXt-devel
# Clone and build feh
git clone https://github.com/derf/feh.git
cd feh || exit
make
sudo make install
cd .. || exit
rm -rf feh

# Wallpapers setup
sudo rm -rf /usr/share/backgrounds/*
sudo tar -xvf "$WS_ASSETS_PATH"/backgrounds.tar.gz -C /usr/share/backgrounds/
