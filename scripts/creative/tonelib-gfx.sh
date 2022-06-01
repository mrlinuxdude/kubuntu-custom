#!/bin/bash
set -e
# ToneLib GFX
aria2c --console-log-level=error --summary-interval=0\
	https://plugins4free.com/get_plug/ToneLib-GFX-amd64.deb
apt install -y ./ToneLib-GFX*.deb