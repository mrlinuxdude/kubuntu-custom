#!/bin/bash
set -e
# Q4WINE
dpkg --add-architecture i386
apt update
apt install -y q4wine