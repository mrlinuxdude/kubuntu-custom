#!/bin/bash
set -e
# OBS multi RTMP #TODO
git clone -q\
	https://aur.archlinux.org/obs-multi-rtmp.git
cd obs-multi-rtmp
sudo nala install -y\
	cmake\
	libobs-dev
makedeb -i --no-confirm
sudo mv\
    /usr/lib/obs-plugins/obs-multi-rtmp.so\
    /usr/lib/x86_64-linux-gnu/obs-plugins/
sudo rm -rf /usr/lib/obs-plugins
sudo nala purge -y\
	cmake\
	libobs-dev
cd ..
cp\
	obs-multi-rtmp/obs-multi-rtmp*.deb\
	kubuntu-custom/assets/packages/
rm -rf obs-multi-rtmp