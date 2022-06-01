#!/bin/bash
set -e
sudo nala install -y\
	dialog\
	xmlstarlet
git clone -q --depth=1\
    https://github.com/RetroPie/RetroPie-Setup.git
cd RetroPie-Setup
cat <<EOF |sudo tee /etc/sudoers.d/10-retropie>/dev/null
$USER ALL=(ALL) NOPASSWD:ALL
EOF
sudo ./retropie_setup.sh
cd ..