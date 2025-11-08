#!/bin/bash

sudo dnf config-manager --add-repo https://repo.vivaldi.com/stable/vivaldi-fedora.repo
sudo dnf install -y vivaldi-stable
