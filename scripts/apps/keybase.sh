#!/bin/bash
set -e
# Keybase
aria2c --console-log-level=error --summary-interval=0\
	http://prerelease.keybase.io/keybase_amd64.deb
apt install -y ./keybase*.deb
#wget -qO-\
#	https://keybase.io/docs/server_security/code_signing_key.asc|\
#	gpg --dearmor -o\
#	/etc/apt/trusted.gpg.d/keybase.gpg
apt-key export 656D16C7|\
	gpg --dearmor\
	-o /etc/apt/trusted.gpg.d/keybase.gpg\
	2>/dev/null
apt update