#!/bin/bash

set -e

# rofi dependencies
sudo dnf install -y meson ninja-build autoconf automake gcc gcc-c++ make \
  pango-devel startup-notification-devel xcb-util-wm-devel xcb-util-devel \
  xcb-util-xrm-devel xcb-util-cursor-devel xcb-imdkit-devel \
  xcb-util-keysyms-devel libxkbcommon-devel libxkbcommon-x11-devel \
  gdk-pixbuf2-devel pandoc check-devel flex bison glib2-devel doxygen

# Build rofi
cd "$WS_SOURCE_PATH" || exit
git clone https://github.com/davatorium/rofi.git
cd rofi || exit
git fetch --deltas
git checkout 1.7.5
meson setup build --prefix=/usr -Dwayland=disabled
ninja -C build
sudo ninja -C build install
