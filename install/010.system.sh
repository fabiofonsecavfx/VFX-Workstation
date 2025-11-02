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
sudo dnf install -y cmake ninja-build pkgconf-pkg-config git wget curl i3 \
  gnome-themes-extra imlib2 imlib2-devel libX11-devel libXinerama-devel \
  libXext-devel libcurl-devel libXt-devel clang gcc-c++ python3-sphinx \
  python3-packaging cairo-devel libuv-devel xcb-util-devel libxcb-devel \
  xcb-proto xcb-util-image-devel xcb-util-wm-devexcb-util-xrm-devel \
  xcb-util-cursor-devel alsa-lib-devel pulseaudio-libs-devel i3-devel \
  jsoncpp-devel libmpdclient-devel libcurl-devel libnl3-devel

# Install LightDM
sudo dnf install -y --setopt=install_weak_deps=False lightdm lightdm-gtk-greeter
sudo cp -fv "$WS_CONFIG_PATH"/lightdm/*.conf /etc/lightdm
ln -sfv "$WS_CONFIG_PATH"/lightdm/.profile "$HOME"/.profile
sudo systemctl set-default graphical.target

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
git clone https://github.com/derf/feh.git
cd feh || exit
make
sudo make install
cd .. || exit
rm -rf feh

# Install polybar
sudo dnf install -y

# Wallpapers setup
sudo rm -rf /usr/share/backgrounds/*
sudo tar -xvf "$WS_ASSETS_PATH"/backgrounds.tar.gz -C /usr/share/backgrounds/
