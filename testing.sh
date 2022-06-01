#!/bin/bash
set -e

rm -rf kubuntu-custom
git clone -q\
    https://git.disroot.org/rauldipeas/kubuntu-custom

# testing (update)
mkdir -pv kubuntu-custom/assets/packages
bash -x kubuntu-custom/postinst/testing/fluent-reader.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/nerd-fonts-hack.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/obs-multi-rtmp.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/raindrop.sh #external-package #makepkg #nativefier
bash -x kubuntu-custom/postinst/testing/syncthingtray.sh #external-package #makepkg #binary