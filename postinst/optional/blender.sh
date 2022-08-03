#!/bin/bash
set -e
# Blender
#sudo add-apt-repository -y ppa:savoury1/blender
#sudo nala install blender-git #blender #blender-lts
sudo nala install audacity
BLENDER_VER=$(curl -sL https://ftp.nluug.nl/pub/graphics/blender/release|grep Blender3.|tail -n1|cut -d \" -f6)
BLENDER_FILE=$(curl -sL https://ftp.nluug.nl/pub/graphics/blender/release/$BLENDER_VER|grep .tar.xz|tail -n1|cut -d \" -f6)
aria2c --console-log-level=error --summary-interval=0\
    https://ftp.nluug.nl/pub/graphics/blender/release/$BLENDER_VER$BLENDER_FILE
tar -xf\
    blender*.tar.xz
rm -rf\
    $HOME/.local/share/blender/
mv\
    blender*/\
    $HOME/.local/share/blender/
rm -rf\
    blender*.tar.xz
mkdir -p\
    $HOME/.local/share/applications
cp -rf\
    $HOME/.local/share/blender/blender.desktop\
    $HOME/.local/share/applications/
sed -i\
    "s@Exec=blender@Exec=sh -c \"audacity\&sleep 3\;$HOME/.local/share/blender/blender\;killall -9 audacity\"@g"\
    $HOME/.local/share/applications/blender.desktop
aria2c --console-log-level=error --summary-interval=0\
    https://github.com/tin2tin/audacity_tools_for_blender/archive/main.zip
unzip audacity_tools_for_blender-main.zip -d "$HOME"/.config/blender/"$(ls ~/.config/blender/)"/scripts/addons/
rm -rf audacity_tools_for_blender-main.zip