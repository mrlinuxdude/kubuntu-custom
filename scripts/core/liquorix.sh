#!/bin/bash
set -e
# Liquorix
add-apt-repository -y ppa:damentz/liquorix
apt install -y\
	linux-firmware\
	linux-image-liquorix-amd64\
	linux-headers-liquorix-amd64
apt autoremove --purge -y linux*generic