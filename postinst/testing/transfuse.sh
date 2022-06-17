#!/bin/bash
set -e
# Transfuse
wget -q\
	https://gitlab.com/cscs/transfuse/-/raw/master/transfuse.sh
sudo install\
	transfuse.sh\
	/usr/local/bin/transfuse
rm ./transfuse.sh