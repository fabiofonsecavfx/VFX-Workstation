#!/bin/bash

set -e

sudo dnf groupinstall "base-x" -y

ln -sfv "$WS_CONFIG_PATH/x11/.xinitrc" "$HOME"
