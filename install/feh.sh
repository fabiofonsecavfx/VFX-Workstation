#!/bin/bash

# feh dependencies
sudo dnf install -y imlib2 imlib2-devel libX11-devel libXinerama-devel \
  libXext-devel libcurl-devel libXt-devel

# Build feh
cd "$WS_SOURCE_PATH" || exit
git clone https://github.com/derf/feh.git
cd feh || exit
make
sudo make install
