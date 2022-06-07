#!/bin/bash
set -e
# MakeDeb
echo\
	'deb [arch=all] https://proget.hunterwittenborn.com makedeb main'|\
	tee\
	/etc/apt/sources.list.d/makedeb.list
wget -qO-\
	'https://proget.hunterwittenborn.com/debian-feeds/makedeb.pub'|\
	gpg --dearmor -o\
	/etc/apt/trusted.gpg.d/makedeb-archive-keyring.gpg\
	>/dev/null
apt update
apt install -y makedeb