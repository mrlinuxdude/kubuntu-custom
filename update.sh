#!/bin/bash
set -e

rm -rf kubuntu-custom
git clone -q\
    https://github.com/rauldipeas/kubuntu-custom

# update
bash -x kubuntu-custom/postinst/update/bitwarden.sh #external-package
bash -x kubuntu-custom/postinst/update/bluemail.sh #external-package
bash -x kubuntu-custom/postinst/update/cfs-zen-tweaks.sh #external-package
bash -x kubuntu-custom/postinst/update/freetube.sh #external-package
bash -x kubuntu-custom/postinst/update/freezer.sh #external-package
bash -x kubuntu-custom/postinst/update/iriun.sh #external-package
bash -x kubuntu-custom/postinst/update/lsd.sh #external-package
bash -x kubuntu-custom/postinst/update/obsidian.sh #external-package
bash -x kubuntu-custom/postinst/update/rambox.sh #external-package
bash -x kubuntu-custom/postinst/update/rclone.sh #external-package
bash -x kubuntu-custom/postinst/update/reaper.sh #no-packaged
bash -x kubuntu-custom/postinst/update/sfizz.sh #external-package
bash -x kubuntu-custom/postinst/update/streamon.sh #external-package
bash -x kubuntu-custom/postinst/update/stremio.sh #external-package
bash -x kubuntu-custom/postinst/update/system-monitoring-center.sh #external-package
bash -x kubuntu-custom/postinst/update/touche.sh #external-package
bash -x kubuntu-custom/postinst/update/wine.sh #no-packaged
bash -x kubuntu-custom/postinst/update/yabridge.sh #no-packaged

# testing (update)
mkdir -p kubuntu-custom/assets/packages
bash -x kubuntu-custom/postinst/testing/fluent-reader.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/nerd-fonts-hack.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/obs-multi-rtmp.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/plasma-hud.sh #external-package #makepkg #binary
bash -x kubuntu-custom/postinst/testing/syncthingtray.sh #external-package #makepkg #binary
bash -x kubuntu-custom/postinst/testing/transfuse.sh #no-package #binary

rm -rf kubuntu-custom