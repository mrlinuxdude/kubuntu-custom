#!/bin/bash
set -e
# Firefox PWA
wget -qO-\
    https://packagecloud.io/filips/FirefoxPWA/gpgkey|\
    sudo gpg --dearmor -o\
    /etc/apt/trusted.gpg.d/firefoxpwa.gpg\
    >/dev/null
echo\
    'deb https://packagecloud.io/filips/FirefoxPWA/any any main'|\
    sudo tee\
    /etc/apt/sources.list.d/firefoxpwa.list\
    >/dev/null
sudo nala update
sudo nala install firefoxpwa