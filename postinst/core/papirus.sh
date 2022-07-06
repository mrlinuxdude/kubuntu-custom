#!/bin/bash
set -e
# Papirus
sudo rm -rf	/etc/apt/sources.list.d/*hardcode-tray*
sudo add-apt-repository -ny ppa:papirus/hardcode-tray
sudo sed -i\
	's/jammy/focal/g'\
	/etc/apt/sources.list.d/*hardcode-tray*.list #tmp-downgrade-fix
sudo add-apt-repository -y ppa:papirus/papirus-dev
sudo nala install\
	hardcode-tray\
	papirus-icon-theme
sudo hardcode-tray --apply --theme Papirus-Dark
sudo sed -i\
	's/icon\, QIcon/\x22cadence-panel\x22\, QIcon/g'\
	/usr/share/cadence/src/systray.py
sudo mkdir -p /root/.config
sudo cp -rf "$HOME"/.config/gtk-3.0 /root/.config/
rm -rf materia-kde
git clone -q\
	 https://github.com/PapirusDevelopmentTeam/materia-kde
sudo cp -rf\
	materia-kde/plasma/desktoptheme/Materia-Color/icons\
	/usr/share/plasma/desktoptheme/breeze-light/
sudo cp -rf\
	materia-kde/plasma/desktoptheme/Materia/icons\
	/usr/share/plasma/desktoptheme/breeze-dark/
rm -rf materia-kde