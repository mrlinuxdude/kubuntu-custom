#!/bin/bash
set -e
# Steam
dpkg --add-architecture i386
add-apr-repository -ny multiverse
add-apr-repository -y universe
apt install -y steam-installer