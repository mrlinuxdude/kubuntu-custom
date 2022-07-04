#!/bin/bash
set -e
# Blender
#sudo add-apt-repository -y ppa:savoury1/blender
#sudo nala install -y blender-git #blender #blender-lts
BLENDER_VER=$(curl -sL https://ftp.nluug.nl/pub/graphics/blender/release|grep Blender3.|tail -n1|cut -d \" -f6)
BLENDER_FILE=$(curl -sL https://ftp.nluug.nl/pub/graphics/blender/release/$BLENDER_VER|grep .tar.xz|tail -n1|cut -d \" -f6)
aria2c --console-log-level=error --summary-interval=0 https://ftp.nluug.nl/pub/graphics/blender/release/$BLENDER_VER$BLENDER_FILE
tar -xf blender*.tar.xz
rm -rf $HOME/.local/share/blender/
mv blender*/ $HOME/.local/share/blender/
rm -rf blender*.tar.xz
mkdir -p $HOME/.local/share/applications
cp -rf $HOME/.local/share/blender/blender.desktop $HOME/.local/share/applications/
sed -i "s@Exec=blender@Exec=$HOME/.local\/share\/blender\/blender@g" $HOME/.local/share/applications/blender.desktop