#!/bin/bash
set -e
# MESA
add-apt-repository -y ppa:kisak/kisak-mesa
apt dist-upgrade -y
apt autoremove --purge -y