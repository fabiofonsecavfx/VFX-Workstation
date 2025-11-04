#!/bin/bash

# picom dependencies
sudo dnf install -y libconfig-devel libev-devel libX11-devel libX11-xcb \
  libxcb-devel libGL-devel libEGL-devel libepoxy-devel pcre2-devel \
  pixman-devel uthash-devel xcb-util-image-devel xcb-util-renderutil-devel \
  xorg-x11-proto-devel xcb-util-devel

# Build picom
cd "$WS_SOURCE_PATH" || exit
git clone https://github.com/yshui/picom.git
cd picom || exit
meson setup --buildtype=release build
ninja -C build
sudo ninja -C build install
