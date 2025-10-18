#!/bin/bash

# Activate virtualenv
source "$HOME/qtile-venv/bin/activate"

# Launch Qtile from the virtualenv
exec qtile start
