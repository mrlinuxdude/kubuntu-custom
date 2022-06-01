#!/bin/bash
set -e
# XanMod
echo\
	'deb http://deb.xanmod.org releases main'|\
	tee\
	/etc/apt/sources.list.d/xanmod-kernel.list
wget -qO-\
	https://dl.xanmod.org/gpg.key|\
	gpg --dearmor -o\
	/etc/apt/trusted.gpg.d/xanmod-kernel.gpg\
	>/dev/null
apt update
apt install -y\
	linux-firmware\
	linux-xanmod-rt
apt autoremove --purge -y linux*generic