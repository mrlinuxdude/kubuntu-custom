#!/bin/bash
set -e
# Session
echo\
	'deb [arch=amd64] https://deb.oxen.io jammy main'|\
	tee\
	/etc/apt/sources.list.d/oxen.list
wget -qO-\
	https://deb.oxen.io/pub.gpg|\
	gpg --dearmor -o\
	/etc/apt/trusted.gpg.d/oxen.gpg\
	>/dev/null
apt update
apt install -y session-desktop