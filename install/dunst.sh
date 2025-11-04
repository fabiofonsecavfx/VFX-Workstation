#!/bin/bash

set -e

# dunst dependencies
sudo dnf install gcc make libX11-devel libXinerama-devel \
  libXrandr-devel libXss-devel glib2-devel pango-devel \
  cairo-devel libnotify-devel dbus-devel

# Build dunst
cd "$WS_SOURCE_PATH" || exit
git clone https://github.com/dunst-project/dunst.git
cd dunst || exit
make
sudo make install
