#!/bin/bash
set -e

rm -rf kubuntu-custom
git clone -q\
    https://github.com/rauldipeas/kubuntu-custom

sudo add-apt-repository -n multiverse
sudo add-apt-repository universe

# core
bash -x kubuntu-custom/postinst/core/apt-repository.sh #no-packaged
bash -x kubuntu-custom/postinst/core/bash.sh #no-packaged #pip
bash -x kubuntu-custom/postinst/core/drivers.sh #stock-apt
bash -x kubuntu-custom/postinst/core/git-settings.sh #no-packaged
bash -x kubuntu-custom/postinst/core/papirus.sh #PPA
bash -x kubuntu-custom/postinst/core/rtcqs.sh #no-packaged #pip
bash -x kubuntu-custom/postinst/core/swap.sh #no-packaged
bash -x kubuntu-custom/postinst/core/vnc.sh #stock-apt
bash -x kubuntu-custom/postinst/core/zerotier.sh #external-apt

# update
sudo nala upgrade

# manual (log)
xdg-open kubuntu-custom/postinst.md

rm -rf kubuntu-custom