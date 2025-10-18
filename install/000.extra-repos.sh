#!/bin/bash

sudo dnf update -y

sudo dnf config-manager --set-enabled crb

sudo dnf install epel-release -y

sudo dnf install --nogpgcheck https://dl.fedoraproject.org/pub/epel/epel-release-latest-"$(rpm -E %rhel)".noarch.rpm
sudo dnf install --nogpgcheck https://mirrors.rpmfusion.org/free/el/rpmfusion-free-release-"$(rpm -E %rhel)".noarch.rpm https://mirrors.rpmfusion.org/nonfree/el/rpmfusion-nonfree-release-"$(rpm -E %rhel)".noarch.rpm

sudo dnf install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
