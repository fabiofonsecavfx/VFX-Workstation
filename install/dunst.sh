#!/bin/bash

set -e

# dunst dependencies
sudo dnf install -y gcc make libX11-devel libXinerama-devel \
  libXrandr-devel glib2-devel pango-devel libXScrnSaver-devel \
  cairo-devel libnotify-devel dbus-devel

# Build dunst
cd "$WS_SOURCE_PATH" || exit
git clone https://github.com/dunst-project/dunst.git
cd dunst || exit
make WAYLAND=0
sudo make WAYLAND=0 install
