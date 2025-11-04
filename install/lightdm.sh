#!/bin/bash

# Install lightdm
sudo dnf install -y --setopt=install_weak_deps=False lightdm lightdm-gtk-greeter

# Copy and link lightdm config and startup profile files
sudo cp -fv "$WS_CONFIG_PATH"/lightdm/*.conf /etc/lightdm
ln -sfv "$WS_CONFIG_PATH"/lightdm/.profile "$HOME"/.profile

# Set UI on startup
sudo systemctl set-default graphical.target
