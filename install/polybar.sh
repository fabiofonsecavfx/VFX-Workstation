#!/bin/bash

set -e

# polybar dependencies
sudo dnf install -y cmake gcc gcc-c++ make python3 python3-sphinx \
  cairo-devel xcb-proto xcb-util-devel xcb-util-image-devel \
  xcb-util-wm-devel xcb-util-xrm-devel xcb-util-cursor-devel \
  alsa-lib-devel pulseaudio-libs-devel libnl3-devel libmpdclient-devel \
  jsoncpp-devel libcurl-devel wireless-tools-devel

# Build polybar
cd "$WS_SOURCE_PATH" || exit
git clone --recursive https://github.com/polybar/polybar
cd polybar || exit
mkdir build
cd build || exit
cmake ..
make -j"$(nproc)"
sudo make install
