#!/bin/bash

# polybar dependencies
sudo dnf install -y python3-sphinx python3-packaging cairo-devel libuv-devel \
  xcb-util-devel libxcb-devel xcb-proto xcb-util-image-devel xcb-util-wm-devel \
  xcb-util-xrm-devel xcb-util-cursor-devel alsa-lib-devel pulseaudio-libs-devel \
  i3-devel jsoncpp-devel libcurl-devel libnl3-devel

# Build polybar
cd "$WS_SOURCE_PATH" || exit
git clone --recursive https://github.com/polybar/polybar
cd polybar || exit
mkdir build
cd build || exit
cmake ..
make -j"$(nproc)"
sudo make install
