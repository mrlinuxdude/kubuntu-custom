#!/bin/bash
set -e
# Steam
dpkg --add-architecture i386
add-apt-repository -ny multiverse
add-apt-repository -y universe
apt install -y steam-installer