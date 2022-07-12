#!/bin/bash
set -e
# ZeroTier
echo\
    'deb http://download.zerotier.com/debian/buster buster main'|\
    sudo tee\
    /etc/apt/sources.list.d/zerotier.list
wget -qO-\
    https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg|\
    sudo gpg --dearmor -o\
    /etc/apt/trusted.gpg.d/zerotier.gpg\
    >/dev/null
sudo apt update
sudo nala install zerotier-one