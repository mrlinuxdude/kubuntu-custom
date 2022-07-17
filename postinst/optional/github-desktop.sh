#!/bin/bash
set -e
# GitHub desktop
rm -rf GitHubDesktop*.deb
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/shiftkey/desktop/releases|\
	grep browser_download_url|grep .deb|head -n1|cut -d '"' -f4)"
sudo apt install ./GitHubDesktop*.deb
rm -rf GitHubDesktop*.deb