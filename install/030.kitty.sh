#!/bin/bash

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

mkdir -p "$HOME"/.local/bin

# Create symbolic links to add kitty and kitten to PATH (assuming ~/.local/bin is in
# your system-wide PATH)
ln -sf ~/.local/kitty.app/bin/kitty ~/.local/kitty.app/bin/kitten ~/.local/bin/
# Place the kitty.desktop file somewhere it can be found by the OS
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
# If you want to open text files and images in kitty via your file manager also add the kitty-open.desktop file
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
# Update the paths to the kitty and its icon in the kitty desktop file(s)
sed -i "s|Exec=kitty|Exec=$(readlink -f ~)/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
# Make xdg-terminal-exec (and hence desktop environments that support it use kitty)
echo 'kitty.desktop' >~/.config/xdg-terminals.list

# Change ugly kitty icon
txt_blue "Changing kitty's logo."
src_icon="$WS_IMGS_PATH/kitty-light.png"
icon_dir="$HOME/.local/share/icons"
target_icon="$icon_dir/kitty-light.png"
desktop_file_src="$HOME/.local/share/applications/kitty.desktop"

mkdir -p "$icon_dir"

cp "$src_icon" "$target_icon"

sudo sed -i "s|^Icon=.*|Icon=${target_icon}|" "$desktop_file_src"

ln -sfv "$WS_CONFIG_PATH/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"
ln -sfv "$WS_CONFIG_PATH/kitty/gruvbox-dark.conf" "$HOME/.config/kitty/gruvbox-dark.conf"
