#!/bin/bash
set -e
# Discord
rm -rf discord.deb
aria2c --console-log-level=error --summary-interval=0\
    'https://discord.com/api/download?platform=linux&format=deb'\
    -o discord.deb
sudo apt install ./discord.deb
rm -rf discord.deb