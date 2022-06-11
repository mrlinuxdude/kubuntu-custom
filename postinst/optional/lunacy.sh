#!/bin/bash
set -e
# Lunacy
aria2c --console-log-level=error --summary-interval=0\
	https://lun-eu-static.s3.eu-central-003.backblazeb2.com/setup/Lunacy.deb
sudo apt install ./Lunacy.deb
sudo sed -i\
	's@/opt/icons8/lunacy/Assets/LunacyLogo.png@lunacy@g'
rm -rf Lunacy.deb