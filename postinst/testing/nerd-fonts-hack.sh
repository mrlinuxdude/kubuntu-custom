#!/bin/bash
set -e
# Nerd Fonts(LSD)
git clone -q\
	https://aur.archlinux.org/nerd-fonts-hack.git
cd nerd-fonts-hack
makedeb -i --no-confirm
cd ..
cp\
    nerd-fonts-hack/nerd-fonts-hack*.deb\
    kubuntu-custom/assets/packages/
rm -rf nerd-fonts-hack*