#!/bin/bash
set -e
# rtcqs
sudo rm -rf /opt/rtcqs*
sudo nala install -y python3-tk
pip install -q rtcqs
mkdir -p "$HOME"/.local/share/{applications,icons}
wget -qO\
	"$HOME"/.local/share/applications/rtcqs.desktop\
	https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs.desktop
wget -qO\
	"$HOME"/.local/share/icons/rtcqs.svg\
	https://codeberg.org/rtcqs/rtcqs/raw/branch/main/rtcqs_logo.svg