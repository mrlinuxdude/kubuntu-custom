#!/bin/bash
set -e
# NVM
sudo nala install npm
bash <(wget -qO-\
    https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh)
# shellcheck source=/dev/null
source "$HOME"/.bashrc
nvm install node
nvm use node