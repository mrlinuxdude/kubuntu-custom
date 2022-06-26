#!/bin/bash
set -e

rm -rf kubuntu-custom
git clone -q\
    https://github.com/rauldipeas/kubuntu-custom

# testing (update)
mkdir -p kubuntu-custom/assets/packages
bash -x kubuntu-custom/postinst/testing/fluent-reader.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/nerd-fonts-hack.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/plasma-hud.sh #external-package #makepkg #binary
bash -x kubuntu-custom/postinst/testing/obs-multi-rtmp.sh #external-package #makepkg #aur
bash -x kubuntu-custom/postinst/testing/syncthingtray.sh #external-package #makepkg #binary
bash -x kubuntu-custom/postinst/testing/transfuse.sh #no-packaged