#!/bin/bash
set -e
# Fury CLI
echo\
    'deb [trusted=yes] https://cli.gemfury.com/apt/ /'|\
    sudo tee\
    /etc/apt/sources.list.d/fury-cli.list\
    >/dev/null
sudo nala update
sudo nala install -y gemfury
echo 'export GEMFURY_PUSH_TOKEN='|tee "$HOME"/.bashrc.d/gemfury-push-token.bash>/dev/null

# Raul Dipeas APT
echo\
    'deb [trusted=yes] https://rauldipeas.fury.site/apt/ /'|\
    sudo tee\
    /etc/apt/sources.list.d/rauldipeas.list\
    >/dev/null