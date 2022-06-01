#!/bin/bash
set -e
mkdir -p "$HOME"/.config/autostart
cat <<EOF |tee "$HOME"/.config/autostart/x11vnc.desktop>/dev/null
[Desktop Entry]
Name=X11VNC
Exec=x11vnc -forever #-rfbauth /etc/x11vnc.pass
Comment=Start X11VNC server
Icon=computer
Type=Application
Terminal=false
EOF
#x11vnc -storepasswd /etc/x11vnc.pass