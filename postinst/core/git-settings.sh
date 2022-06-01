#!/bin/bash
set -e
# Git settings #TODO
git config --global user.name "$(pinky|grep tty1|cut -d ' ' -f2-3)"
git config --global user.email "$(whoami)"@disroot.org
git config --global credential.helper store
# "$HOME"/.wakatime.cfg #TODO