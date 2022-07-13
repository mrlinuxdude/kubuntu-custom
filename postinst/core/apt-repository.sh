#!/bin/bash
set -e
# APT repository (Raul Dipeas)
echo\
    'deb [trusted=yes] https://rauldipeas.fury.site/apt/ * *'|\
    sudo tee\
    /etc/apt/sources.list.d/rauldipeas.list\
    >/dev/null