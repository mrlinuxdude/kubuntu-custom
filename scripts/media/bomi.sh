#!/bin/bash
set -e
# Bomi
add-apt-repository -y ppa:nemonein/bomi
apt install -y\
    --no-install-recommends\
    bomi