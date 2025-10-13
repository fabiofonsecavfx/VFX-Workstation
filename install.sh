#!/bin/bash

WS_ROOT_PATH=$(dirname "$(realpath "$0")")
WS_INSTALL_PATH="$WS_ROOT_PATH/install"
WS_CONFIG_PATH="$WS_ROOT_PATH/config"

export WS_ROOT_PATH
export WS_INSTALL_PATH
export WS_CONFIG_PATH

source WS_INSTALL_PATH/x11.sh
