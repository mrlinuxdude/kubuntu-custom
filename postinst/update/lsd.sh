#!/bin/bash
set -e
# LSD
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://api.github.com/repos/Peltoche/lsd/releases|\
	grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)"
sudo apt install -y ./lsd*.deb
rm -rf lsd*.deb