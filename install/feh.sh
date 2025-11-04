#!/bin/bash

set -e

# feh dependencies
sudo dnf install -y gcc make imlib2-devel libXinerama-devel libcurl-devel \
  libpng-devel libX11-devel libXt-devel

# Build feh
cd "$WS_SOURCE_PATH" || exit
git clone https://github.com/derf/feh.git
cd feh || exit
make
sudo make install
