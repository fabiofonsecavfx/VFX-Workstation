#!/bin/bash

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
sudo dnf install -y \
  cmake \
  ninja-build \
  pkgconf-pkg-config \
  git \
  wget \
  curl \
  i3

# Install LightDM without extra stuff
sudo dnf install -y --setopt=install_weak_deps=False lightdm

# Install feh
# feh dependencies
sudo dnf install -y \
  imlib2 \
  imlib2-devel \
  libX11-devel \
  libXinerama-devel \
  libXext-devel \
  libcurl-devel \
  libXt-devel
# Clone and build feh
git clone https://github.com/derf/feh.git
cd feh || exit
make
sudo make install
cd .. || exit
rm -rf feh
