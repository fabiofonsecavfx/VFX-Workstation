#!/bin/bash

# Set text colors
red='\e[31m'
green='\e[32m'
cyan='\e[36m'
nc='\e[0m'

# Path definitions
mkdir -p "$HOME/src"
WS_SOURCE_PATH="$HOME/src"
WS_ROOT_PATH=$(dirname "$(realpath "$0")")
WS_INSTALL_PATH="$WS_ROOT_PATH/install"
WS_CONFIG_PATH="$WS_ROOT_PATH/config"
WS_UTILS_PATH="$WS_ROOT_PATH/utils"
WS_ASSETS_PATH="$WS_ROOT_PATH/assets"
WS_SERVICES_PATH="$WS_ROOT_PATH/services"
WS_SCRIPTS_PATH="$WS_ROOT_PATH/scripts"

export WS_ROOT_PATH WS_INSTALL_PATH WS_CONFIG_PATH WS_UTILS_PATH WS_ASSETS_PATH \
  WS_SERVICES_PATH WS_SCRIPTS_PATH WS_SOURCE_PATH

# All scripts
all=(extra-repos system shell lightdm dunst feh picom rofi kitty nvim vivaldi qtile)

# Parse arguments
if [ "$#" == 0 ]; then
  install=("${all[@]}")
else
  install=("$@")
fi

# Installation loop
for file in "${install[@]}"; do
  file_path="$WS_INSTALL_PATH/$file.sh"

  echo -e "${cyan}Installing $file.${nc}"

  if bash "$file_path"; then
    echo -e "${green}$file installed${nc}"
  else
    echo -e "${red}$file installation failed${nc}"
    exit 1
  fi
done
