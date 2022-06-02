#!/bin/bash
set -e
echo\
    'deb [trusted=yes] https://cli.gemfury.com/apt/ /'|\
    sudo tee\
    /etc/apt/sources.list.d/fury-cli.list
sudo apt update
sudo nala install -y fury-cli