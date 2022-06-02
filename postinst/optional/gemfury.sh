#!/bin/bash
set -e
# Fury CLI
echo\
    'deb [trusted=yes] https://cli.gemfury.com/apt/ /'|\
    sudo tee\
    /etc/apt/sources.list.d/fury-cli.list
sudo apt update
sudo nala install -y fury-cli

# Raul Dipeas APT
echo\
    'deb [trusted=yes] https://rauldipeas.fury.site/apt/ /'|\
    sudo tee\
    /etc/apt/sources.list.d/rauldipeas.list
cat <<EOF |sudo tee /etc/apt/auth.conf.d/rauldipeas.conf
machine rauldipeas.fury.site
    login 1FGwwq-ATdOQ6SkGhvbxI6jxQAp5pEZxw
    password NOPASS
EOF