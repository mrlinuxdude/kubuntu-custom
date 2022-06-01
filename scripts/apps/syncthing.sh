#!/bin/bash
set -e
# SyncThing
echo\
	'deb https://apt.syncthing.net/ syncthing stable'|\
	tee\
	/etc/apt/sources.list.d/syncthing.list
wget -q\
	https://syncthing.net/release-key.gpg\
	-O /etc/apt/trusted.gpg.d/syncthing-archive-keyring.gpg\
	>/dev/null
apt update
apt install -y syncthing-gtk