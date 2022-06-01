#!/bin/bash
set -e
# OnlyOffice
echo\
	'deb https://download.onlyoffice.com/repo/debian squeeze main'|\
	tee\
	/etc/apt/sources.list.d/onlyoffice.list
apt-key --keyring /etc/apt/trusted.gpg.d/onlyoffice.gpg adv\
	--keyserver hkp://keyserver.ubuntu.com:80 --recv-keys CB2DE8E5\
	2>/dev/null
apt update
echo\
    'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true'|\
    debconf-set-selections
apt install -y onlyoffice-desktopeditors