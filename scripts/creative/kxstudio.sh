#!/bin/bash
set -e
# KXStudio
aria2c --console-log-level=error --summary-interval=0\
	http://ppa.launchpad.net/kxstudio-debian/kxstudio/ubuntu/pool/main/k/kxstudio-repos/\
"$(wget -qO-\
	http://ppa.launchpad.net/kxstudio-debian/kxstudio/ubuntu/pool/main/k/kxstudio-repos/|\
	grep all.deb|tail -n1|cut -d '"' -f8)"
apt install -y ./kxstudio-repos*.deb
add-apt-repository -ny multiverse
add-apt-repository -y universe
echo\
	'jackd2 jackd/tweak_rt_limits string true'|\
	debconf-set-selections
apt install -y alsa-firmware
apt install -y\
	--no-install-recommends\
	a2jmidid\
	cadence\
	pulseaudio-module-jack