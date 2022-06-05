#!/bin/bash
set -e
# Touche
rm -rf touche_*.deb
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/JoseExposito/touche/releases|\
	grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)"
sudo apt install ./touche_*.deb wmctrl
rm -rf touche_*.deb