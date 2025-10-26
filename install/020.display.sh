#!/bin/bash

# Install Groups
sudo dnf groupinstall -y \
  "base-x" \
  "Standart" \
  "Hardware Support" \
  "Input Methods" \
  "Common NetworkManager Submodules" \
  "Development Tools" \
  "Fonts"

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
