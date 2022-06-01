#!/bin/bash
set -e
# Fluent Reader #TODO
git clone -q\
    https://aur.archlinux.org/fluent-reader-bin.git
cd fluent-reader-bin
sed -i\
    's/depends=("gtk3" "nss")//g'\
    PKGBUILD
makedeb -d -i --no-confirm #-H 'Section: network'
cd ..
cp\
    fluent-reader-bin/fluent-reader*.deb\
    kubuntu-custom/assets/packages/
rm -rf fluent-reader-bin*