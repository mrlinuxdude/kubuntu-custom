#!/bin/bash
set -e
# Blue Mail
rm -rf BlueMail*.deb
aria2c --console-log-level=error --summary-interval=0\
	https://download.bluemail.me/BlueMail/deb/BlueMail.deb
sudo nala install ./BlueMail*.deb
sudo rm -rf /etc/apt/sources.list.d/bluemail.list #tmp-mirror-sync-error
rm -rf BlueMail*.deb