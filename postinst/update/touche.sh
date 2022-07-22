#!/bin/bash
set -e
# Touche
if [ -f /usr/bin/com.github.joseexposito.touche ];then
	rm -rf touche_*.deb
	aria2c --console-log-level=error --summary-interval=0\
		"$(wget -qO-\
		https://api.github.com/repos/JoseExposito/touche/releases|\
		grep browser_download_url|grep download|grep amd64.deb|head -n1|cut -d '"' -f4)"
	sudo nala install ./touche_*.deb
	rm -rf touche_*.deb
else
	echo 'Este computador não é um notebook'
fi