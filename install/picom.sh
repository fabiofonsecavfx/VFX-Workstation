#!/bin/bash

set -e

# picom dependencies
sudo dnf install -y meson ninja-build gcc libX11-devel libXext-devel \
  libxcb-devel xcb-util-renderutil-devel xcb-util-image-devel \
  libconfig-devel libev-devel uthash-devel pixman-devel dbus-devel \
  libGL-devel pcre2-devel xcb-util-devel libepoxy-devel

# Build picom
cd "$WS_SOURCE_PATH" || exit
git clone https://github.com/yshui/picom.git
cd picom || exit
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install
