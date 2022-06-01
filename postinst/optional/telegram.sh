#!/bin/bash
set -e
aria2c --console-log-level=error --summary-interval=0\
    -o telegram.tar.xz\
    "$(wget -qO-\
        https://api.github.com/repos/telegramdesktop/tdesktop/releases|\
        grep browser_download_url|grep tar.xz|head -n1|cut -d '"' -f4)"
tar -xf\
    telegram*.tar.xz\
    -C "$HOME"/.local/share/
rm -rf telegram*.tar.xz
rm -rf\
    "$HOME"/.local/share/TelegramDesktop/\
    .local/share/applications/*Telegram*.desktop
"$HOME"/.local/share/Telegram/Telegram&\
    sleep 3
killall -9 Telegram