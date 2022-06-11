#!/bin/bash
set -e
# AppRepo
aria2c --console-log-level=error --summary-interval=0\
    https://apprepo.de/appimage/download/apprepo
sudo install apprepo.AppImage /usr/local/bin/apprepo
rm -rf apprepo.AppImage