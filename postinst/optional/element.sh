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
#sudo hardcode-tray --apply --theme Papirus-Dark #temp-fix
npx asar e\
    /opt/Element/resources/webapp.asar\
    element-asar
rsvg-convert -f png\
    /usr/share/icons/Papirus/24x24/panel/element-desktop-tray.svg\
    -o element-asar/vector-icons/favicon.*.ico
npx asar p\
    element-asar\
    webapp.asar
sudo cp -rf\
    webapp.asar\
    /opt/Element/resources/
sudo rsvg-convert -f png -h 256 -w 256\
    /usr/share/icons/Papirus/24x24/panel/element-desktop-tray.svg\
    -o /opt/Element/resources/img/element.png
rm -rf\
    element-asar\
    webapp.asar