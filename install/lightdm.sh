#!/bin/bash

set -e

# Install lightdm
sudo dnf install -y --setopt=install_weak_deps=False lightdm slick-greeter

# Copy and link lightdm config and startup profile files
sudo cp -fv "$WS_CONFIG_PATH"/lightdm/*.conf /etc/lightdm
ln -sfv "$WS_CONFIG_PATH"/lightdm/.profile "$HOME"/.profile

# Set UI on startup
sudo systemctl set-default graphical.target

# Wallpapers setup
sudo mkdir -p /usr/local/share/backgrounds/
sudo tar -xvf "$WS_ASSETS_PATH"/backgrounds.tar.gz -C /usr/local/share/backgrounds/
