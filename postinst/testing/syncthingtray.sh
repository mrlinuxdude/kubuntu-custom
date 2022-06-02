#!/bin/bash
set -e
# SyncThing Tray #TODO
rm -rf syncthingtray*
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
    https://api.github.com/repos/Martchus/syncthingtray/releases|\
    grep browser_download_url|grep download|grep linux|head -n2|tail -n1|cut -d '"' -f4)"
mkdir -p\
	syncthingtray/{DEBIAN,usr/bin,usr/share/applications,usr/share/pixmaps}
tar -Jxf syncthingtray*.tar.xz
mv\
	syncthingtray-*-x86_64-pc-linux-gnu\
	syncthingtray/usr/bin/syncthingtray
rm\
	syncthingtray-x86_64-pc-linux-gnu\
	syncthingtray*.tar.xz
cat <<EOF |tee syncthingtray/usr/share/applications/syncthingtray.desktop>/dev/null
[Desktop Entry]
Name=Syncthing Tray
GenericName=Syncthing Tray
Comment=Tray application for Syncthing
Exec=syncthingtray
Icon=syncthing
Terminal=false
Type=Application
Categories=Network;
EOF
wget -q\
	https://upload.wikimedia.org/wikipedia/commons/8/83/SyncthingAugustLogo.png\
	-O syncthingtray/usr/share/pixmaps/syncthing.png
SYNCTHINGTRAY_TAG=$(wget -qO- https://api.github.com/repos/Martchus/syncthingtray/releases|\
	grep tag|head -n1|cut -d '"' -f4|sed 's@https://github.com/Martchus/syncthingtray/releases/tag/v@@g')
cat <<EOF |tee syncthingtray/DEBIAN/control>/dev/null
Package: syncthingtray
Version: $SYNCTHINGTRAY_TAG
Depends: syncthing
Section: network
Priority: optional
Architecture: amd64
Maintainer: Martchus <Martchus@github.com>
Description: Tray application and Dolphin/Plasma integration for Syncthing.
EOF
dpkg-deb -b syncthingtray .
sudo apt install -y ./syncthingtray*.deb
cp\
	syncthingtray*.deb\
	kubuntu-custom/assets/packages/
rm -rf syncthingtray*