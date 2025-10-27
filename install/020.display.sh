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
  i3 \
  lightdm
