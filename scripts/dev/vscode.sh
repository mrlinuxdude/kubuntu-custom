#!/bin/bash
set -e
# Visual Studio Code
echo\
    'deb [arch=amd64] https://packages.microsoft.com/repos/code stable main'|\
    tee\
    /etc/apt/sources.list.d/vscode.list
wget -qO-\
    https://packages.microsoft.com/keys/microsoft.asc|\
    gpg --dearmor -o\
    /etc/apt/trusted.gpg.d/packages.microsoft.gpg\
    >/dev/null
apt update
apt install -y code