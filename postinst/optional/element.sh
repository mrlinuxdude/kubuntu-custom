#!/bin/bash
set -e
# Element
wget -qO-\
    https://packages.element.io/debian/element-io-archive-keyring.gpg|\
    sudo gpg --dearmor -o\
    /etc/apt/trusted.gpg.d/element.gpg\
    >/dev/null
echo\
    'deb https://packages.element.io/debian/ default main'|\
    sudo tee\
    /etc/apt/sources.list.d/element.list\
    >/dev/null
sudo nala update
sudo nala install element-desktop
sudo hardcode-tray --apply --theme Papirus-Dark
#cd /opt/Element/resources/img
#sudo ffmpeg -i element.png element.ico