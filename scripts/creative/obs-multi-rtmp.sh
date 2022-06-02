#!/bin/bash
set -e
# OBS multi RTMP
apt install -y ./kubuntu-custom/assets/packages/obs-multi-rtmp*.deb
mv\
    /usr/lib/obs-plugins/obs-multi-rtmp.so\
    /usr/lib/x86_64-linux-gnu/obs-plugins/
rm -rf /usr/lib/obs-plugins