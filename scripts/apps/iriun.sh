#!/bin/bash
set -e
# Iriun Webcam
aria2c --console-log-level=error --summary-interval=0\
    "$(curl -sL https://iriun.com/|grep deb|cut -d '"' -f4)"
apt install -y ./iriunwebcam*.deb
apt autoremove --purge -y linux*generic