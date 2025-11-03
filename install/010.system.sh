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
  xcb-proto xcb-util-image-devel xcb-util-wm-devel xcb-util-xrm-devel \
  xcb-util-cursor-devel alsa-lib-devel pulseaudio-libs-devel i3-devel \
  jsoncpp-devel libcurl-devel libnl3-devel mpd dbus-devel gcc git \
  libconfig-devel libev-devel libX11-devel libX11-xcb libxcb-devel libGL-devel \
  libEGL-devel libepoxy-devel meson pcre2-devel pixman-devel uthash-devel \
  xcb-util-image-devel xcb-util-renderutil-devel xorg-x11-proto-devel \
  xcb-util-devel check-devel pango-devel glib2-devel flex bison \
  gdk-pixbuf2-devel

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

# Build from source
mkdir -p "$HOME/src"

# Build feh
cd "$HOME/src" || exit
git clone https://github.com/derf/feh.git
cd feh || exit
make
sudo make install

# Build polybar
cd "$HOME/src" || exit
git clone --recursive https://github.com/polybar/polybar
cd polybar
mkdir build
cd build
cmake ..
make -j"$(nproc)"
sudo make install

# Build picom
cd "$HOME/src" || exit
git clone https://github.com/yshui/picom.git
cd picom
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install

# Build rofi
cd "$HOME/src" || exit
git clone https://github.com/davatorium/rofi.git
cd rofi
meson setup build --prefix=/usr -Dwayland=disabled
ninja -C build
sudo ninja -C build install

# Wallpapers setup
sudo rm -rf /usr/share/backgrounds/*
sudo tar -xvf "$WS_ASSETS_PATH"/backgrounds.tar.gz -C /usr/share/backgrounds/
