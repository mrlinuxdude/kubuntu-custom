#!/bin/bash
set -e
# Raindrop #TODO
rm -rf raindrop*
sudo nala install -y npm
sudo npm install -g nativefier
aria2c --console-log-level=error --summary-interval=0\
	'https://avatars.githubusercontent.com/u/6144133?s=200&v=4'\
	-o icon.png
nativefier\
	-p linux\
	-a x64\
	-i icon.png\
	--disable-context-menu\
	--disable-dev-tools\
	--single-instance\
	https://app.raindrop.io/
mkdir -p\
	raindrop/{DEBIAN,opt,usr/share/applications,usr/share/pixmaps}
mv\
	Raindrop.io-linux-x64\
	raindrop/opt/raindrop
mv\
	icon.png\
	raindrop/usr/share/pixmaps/raindrop.png
ELECTRON_RELEASE="$(wget -qO-\
	https://raw.githubusercontent.com/nativefier/nativefier/master/src/constants.ts|\
	grep "DEFAULT_ELECTRON_VERSION ="|cut -d "'" -f2)"
cat <<EOF |tee raindrop/DEBIAN/control>/dev/null
Package: raindrop
Priority: optional
Section: misc
Maintainer: Raul Dipeas <rauldipeas@mail.com>
Architecture: amd64
Version: 0.1~electron-$ELECTRON_RELEASE
Homepage: https://raindrop.io
Description: Access Raindrop on Linux.
EOF
cat <<EOF |tee raindrop/usr/share/applications/raindrop.desktop>/dev/null
[Desktop Entry]
Type=Application
StartupNotify=true
Terminal=false
Comment=Access Raindrop on Linux.
Name=Raindrop
GenericName=Raindrop desktop app
Icon=/usr/share/pixmaps/raindrop.png
Exec=/opt/raindrop/Raindrop.io
Categories=Network
EOF
dpkg-deb -b raindrop .
sudo apt install -y\
	--reinstall\
	./raindrop*.deb
cp\
	raindrop*.deb\
	kubuntu-custom/assets/packages/
rm -rf raindrop*