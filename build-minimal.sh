#!/bin/bash
set -e

rm -rf kubuntu-custom
git clone -q\
    https://git.disroot.org/rauldipeas/kubuntu-custom

# core
#bash -x kubuntu-custom/scripts/core/liquorix.sh #PPA
bash -x kubuntu-custom/scripts/core/xanmod.sh #external-apt
bash -x kubuntu-custom/scripts/core/cli-tools.sh #stock-apt
bash -x kubuntu-custom/scripts/core/cfs-zen-tweaks.sh #external-package
bash -x kubuntu-custom/scripts/core/nala.sh #external-apt
bash -x kubuntu-custom/scripts/core/dropbear.sh #stock-apt
bash -x kubuntu-custom/scripts/core/system-tweaks.sh #no-packaged
bash -x kubuntu-custom/scripts/core/bismuth.sh #stock-apt
bash -x kubuntu-custom/scripts/core/makedeb.sh #external-package
bash -x kubuntu-custom/scripts/core/mesa.sh #PPA
bash -x kubuntu-custom/scripts/core/synaptic.sh #stock-apt
bash -x kubuntu-custom/scripts/core/lsd.sh #external-package
bash -x kubuntu-custom/scripts/core/nerd-fonts-hack.sh #external-package #makepkg #aur
bash -x kubuntu-custom/scripts/core/firefox.sh #PPA
bash -x kubuntu-custom/scripts/core/system-monitoring-center.sh #external-package
bash -x kubuntu-custom/scripts/core/timeshift.sh #stock-apt
bash -x kubuntu-custom/scripts/core/plasma-hud.sh #external-package #makepkg #binary

# media
bash -x kubuntu-custom/scripts/media/bomi.sh #PPA
bash -x kubuntu-custom/scripts/media/freezer.sh #external-package
bash -x kubuntu-custom/scripts/media/restricted-extras.sh #stock-apt
bash -x kubuntu-custom/scripts/media/stremio.sh #external-package

# cleanup
bash -x kubuntu-custom/scripts/cleanup/cleanup.sh