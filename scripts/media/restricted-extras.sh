#!/bin/bash
set -e
# Restricted Extras
add-apt-repository -ny multiverse
add-apt-repository -y universe
echo\
    'ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true'|\
    debconf-set-selections
apt install -y ./kubuntu-restricted-extras