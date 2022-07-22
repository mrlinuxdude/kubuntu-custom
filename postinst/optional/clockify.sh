#!/bin/bash
set -e
# Clockify
rm -rf Clockify*.deb
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
    https://clockify.me/linux-time-tracking|\
    grep .deb|cut -d '"' -f4|head -n1)"
sudo nala intall ./Clokify*.deb
rm -rf Clockify*.deb