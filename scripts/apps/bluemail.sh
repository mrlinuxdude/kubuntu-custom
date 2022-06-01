#!/bin/bash
set -e
# Blue Mail
aria2c --console-log-level=error --summary-interval=0\
	https://download.bluemail.me/BlueMail/deb/BlueMail.deb
apt install -y ./BlueMail*.deb
rm -rf /etc/apt/sources.list.d/bluemail.list #tmp-mirror-sync-error