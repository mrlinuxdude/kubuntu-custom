#!/bin/bash
set -e
# Nala
echo\
	'deb [arch=amd64] http://deb.volian.org/volian/ scar main'|\
	tee\
	/etc/apt/sources.list.d/volian-archive-scar-unstable.list
wget -qO-\
	https://deb.volian.org/volian/scar.key|\
	gpg --dearmor -o\
	/etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg\
	>/dev/null
apt update
apt install -y nala