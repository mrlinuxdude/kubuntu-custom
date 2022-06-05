#!/bin/bash
set -e
# Fluent Reader #TODO
rm -rf fluent-reader-bin*
git clone -q\
    https://aur.archlinux.org/fluent-reader-bin.git
cd fluent-reader-bin
sed -i\
    's/depends=("gtk3" "nss")//g'\
    PKGBUILD
makedeb -d #-H 'Section: network'
sudo apt install -y ./fluent-reader*.deb
cd ..
cp\
    fluent-reader-bin/fluent-reader*.deb\
    kubuntu-custom/assets/packages/
rm -rf fluent-reader-bin*