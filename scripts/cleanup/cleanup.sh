#!/bin/bash
set -e
# Cleanup
#snap remove --purge firefox
apt autoremove --purge -y\
	elisa\
	imagemagick-6.q16\
	kmahjongg\
	kmines\
	konversation*\
	ksudoku\
	libreoffice*\
	muon\
	openoffice.org-hyphenation\
	skanlite\
	snapd\
	thunderbird\
	usb-creator-kde\
	vlc*
apt dist-upgrade -y
apt autoremove --purge -y
apt autoclean
rm -rfv\
	/root/kubuntu-custom\
	*.deb\
	.bash_history\
	.wget-hsts\
	.cache\
	.launchpadlib\
	/etc/libreoffice/registry\
	/usr/share/fonts/truetype/libreoffice\
	/var/cache/snapd/\
	/var/lib/libreoffice