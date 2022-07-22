#!/bin/bash
set -e
# Internxt
rm -rf drive.deb
aria2c --console-log-level=error --summary-interval=0\
    https://internxt.com/downloads/drive.deb
sudo nala install ./drive.deb
rm -rf drive.deb