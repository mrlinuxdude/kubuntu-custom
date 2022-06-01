#!/bin/bash
set -e
# Freezer
aria2c --console-log-level=error --summary-interval=0\
	"$(wget -qO-\
	https://freezerapk.com/download|grep deb|cut -d '"' -f6)"
sudo apt install -y ./freezer*.deb
rm -rf freezer*.deb