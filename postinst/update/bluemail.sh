#!/bin/bash
set -e
# Blue Mail
aria2c --console-log-level=error --summary-interval=0\
	https://download.bluemail.me/BlueMail/deb/BlueMail.deb
sudo apt install -y ./BlueMail*.deb
sudo rm -rf /etc/apt/sources.list.d/bluemail.list #tmp-mirror-sync-error
rm -rf BlueMail*.deb