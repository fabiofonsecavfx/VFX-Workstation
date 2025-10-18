#!/bin/bash

# Install AdwaitaMono Nerd Font
font_dir="$HOME/.local/share/fonts"
font_name="AdwaitaMono.tar.xz"

mkdir -p "$font_dir"

curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font_name -o "$font_dir/$font_name"
tar -xvf "$font_dir/$font_name" -C "$font_dir"
fc-cache -fv
rm "$font_dir/$font_name"
