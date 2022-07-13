#!/bin/bash
set -e
# Fury CLI
echo\
    'deb [trusted=yes] https://cli.fury.site/apt/ * *'|\
    sudo tee\
    /etc/apt/sources.list.d/fury-cli.list\
    >/dev/null
sudo nala update
sudo nala install fury-cli
echo\
    'export GEMFURY_PUSH_TOKEN='|\
    tee\
    "$HOME"/.bashrc.d/gemfury-push-token.bash\
    >/dev/null