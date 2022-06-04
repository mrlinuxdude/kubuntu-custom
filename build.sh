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

# wine
bash -x kubuntu-custom/scripts/wine/q4wine.sh #stock-apt
bash -x kubuntu-custom/scripts/wine/wine.sh #no-packaged

# creative
bash -x kubuntu-custom/scripts/creative/gimp.sh #stock-apt
bash -x kubuntu-custom/scripts/creative/kcolorchooser.sh #stock-apt
bash -x kubuntu-custom/scripts/creative/kxstudio.sh #PPA
bash -x kubuntu-custom/scripts/creative/obs-multi-rtmp.sh #external-package #makepkg #aur
bash -x kubuntu-custom/scripts/creative/reaper.sh #no-packaged
bash -x kubuntu-custom/scripts/creative/sfizz.sh #external-package
bash -x kubuntu-custom/scripts/creative/shotcut.sh #stock-apt
bash -x kubuntu-custom/scripts/creative/streamon.sh #external-package
bash -x kubuntu-custom/scripts/creative/tonelib-gfx.sh #external-package
bash -x kubuntu-custom/scripts/creative/tuxguitar.sh #stock-apt
bash -x kubuntu-custom/scripts/creative/yabridge.sh #no-packaged

# game
bash -x kubuntu-custom/scripts/game/gamemode.sh #stock-apt
bash -x kubuntu-custom/scripts/game/goverlay.sh #PPA
bash -x kubuntu-custom/scripts/game/lutris.sh #PPA
bash -x kubuntu-custom/scripts/game/steam.sh #stock-apt

# message
bash -x kubuntu-custom/scripts/message/rambox.sh #external-package
bash -x kubuntu-custom/scripts/message/session.sh #external-apt

# apps
bash -x kubuntu-custom/scripts/apps/appimagelauncher.sh #PPA
bash -x kubuntu-custom/scripts/apps/bitwarden.sh #external-package
bash -x kubuntu-custom/scripts/apps/bluemail.sh #external-package
bash -x kubuntu-custom/scripts/apps/crow-translate.sh #PPA
bash -x kubuntu-custom/scripts/apps/fluent-reader.sh #external-package #makepkg #aur
bash -x kubuntu-custom/scripts/apps/freetube.sh #external-package
bash -x kubuntu-custom/scripts/apps/iriun.sh #external-package
bash -x kubuntu-custom/scripts/apps/keybase.sh #external-apt
bash -x kubuntu-custom/scripts/apps/obsidian.sh #external-package
bash -x kubuntu-custom/scripts/apps/onlyoffice.sh #external-apt
bash -x kubuntu-custom/scripts/apps/raindrop.sh #external-package #makepkg #nativefier
bash -x kubuntu-custom/scripts/apps/rclone.sh #external-package
bash -x kubuntu-custom/scripts/apps/syncthing.sh #external-apt
bash -x kubuntu-custom/scripts/apps/syncthingtray.sh #external-package #makepkg #binary

# dev
bash -x kubuntu-custom/scripts/dev/vscode.sh #external-apt

# cleanup
bash -x kubuntu-custom/scripts/cleanup/cleanup.sh