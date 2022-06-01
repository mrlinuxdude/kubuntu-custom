#!/bin/bash
set -e
# yabridge
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
    https://api.github.com/repos/robbert-vdh/yabridge/releases|\
    grep browser_download_url|grep download|head -n2|tail -n1|cut -d '"' -f4)"
tar -zxf yabridge*.tar.gz
rm -rf yabridge*.tar.gz
mv\
    yabridge/libyabridge*\
    /usr/lib/
mv\
    yabridge/yabridge*\
    /usr/bin/
rm -rf yabridge*