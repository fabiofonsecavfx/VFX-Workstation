#!/bin/bash

set -e

red='\e[31m'
green='\e[32m'
blue='\e[34m'
nc='\e[0m'

WS_ROOT_PATH=$(dirname "$(realpath "$0")")
WS_INSTALL_PATH="$WS_ROOT_PATH/install"
WS_CONFIG_PATH="$WS_ROOT_PATH/config"
WS_UTILS_PATH="$WS_ROOT_PATH/utils"
WS_IMGS_PATH="$WS_ROOT_PATH/imgs"

export WS_ROOT_PATH WS_INSTALL_PATH WS_CONFIG_PATH WS_UTILS_PATH WS_IMGS_PATH

files=("$WS_INSTALL_PATH"/*)

for file_path in "${files[@]}"; do
  file=$(basename "$file_path")
  file=${file#*.}
  file=${file%.*}
  echo -e "${blue}Installing $file.${nc}"
  "$file_path"
  if [ $? == 0 ]; then
    echo -e "${green}$file installed${nc}"
  else
    echo -e "${red}$file installation failed${nc}"
  fi
done
