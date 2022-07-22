#!/bin/bash
set -e
# Morgen
rm -rfv morgen*.deb
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO- https://www.morgen.so/onboarding/download|grep deb|cut -d '"' -f82)"
sudo nala install ./morgen*.deb
rm -rfv morgen*.deb