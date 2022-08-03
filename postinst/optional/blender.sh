#!/bin/bash
set -e
# Blender
#sudo add-apt-repository -y ppa:savoury1/blender
#sudo nala install blender-git #blender #blender-lts
sudo nala install audacity
mkdir -p\
    "$HOME"/.audacity-data/Theme
aria2c --console-log-level=error --summary-interval=0\
    https://github.com/visoart/audacity-themes/raw/master/themes/dark-blue/ImageCache.png
mv\
    ImageCache.png\
    "$HOME/".audacity-data/Theme/
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
mkdir -p\
    "$HOME"/.config/blender/"$(find ~/.local/share/blender/* -type d|head -n1|sed "s@$HOME/.local/share/blender/@@g")"/scripts/addons/
unzip\
    audacity_tools_for_blender-main.zip\
    -d\
    "$HOME"/.config/blender/"$(find ~/.local/share/blender/* -type d|head -n1|sed "s@$HOME/.local/share/blender/@@g")"/scripts/addons/
rm -rf\
    audacity_tools_for_blender-main.zip