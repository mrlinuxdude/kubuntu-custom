#!/bin/bash
set -e
# rtcqs
sudo rm -rf /opt/rtcqs*
sudo nala install python3-tk
pip install -q rtcqs
mkdir -p "$HOME"/.local/share/{applications,icons}
wget -qO\
	"$HOME"/.local/share/applications/rtcqs.desktop\
	https://github.com/autostatic/rtcqs/raw/branch/main/rtcqs.desktop
wget -qO\
	"$HOME"/.local/share/icons/rtcqs.svg\
	https://github.com/autostatic/rtcqs/raw/branch/main/rtcqs_logo.svg