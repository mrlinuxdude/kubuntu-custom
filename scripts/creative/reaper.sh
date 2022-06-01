#!/bin/bash
set -e
# REAPER
aria2c --console-log-level=error --summary-interval=0\
    "http://reaper.fm/$(wget -qO-\
    http://reaper.fm/download.php|\
    grep _linux_x86_64.tar.xz|cut -d '"' -f2)"
tar xf reaper*.tar.xz
rm -rf reaper*.tar.xz
cd reaper*
./install-reaper.sh\
    --install /opt\
    --integrate-desktop\
    --quiet\
    --integrate-sys-desktop
cd ..
rm -rf reaper*
cat <<EOF |tee -a /usr/share/applications/cockos-reaper.desktop>/dev/null
Actions=NewProject;ShowAudioConfig;ReaMote;WhatsNew;License;
[Desktop Action NewProject]
Name=REAPER (create new project)
Name[pt_BR]=REAPER (criar novo projeto)
Exec=/opt/REAPER/reaper -new
Icon=cockos-reaper
[Desktop Action ShowAudioConfig]
Name=REAPER (show audio configuration on startup)
Name[pt_BR]=REAPER (mostrar configurações de áudio ao iniciar)
Exec=/opt/REAPER/reaper -audiocfg
Icon=cockos-reaper
[Desktop Action ReaMote]
Name=ReaMote
Exec=/opt/REAPER/reamote-server
Icon=folder-remote
[Desktop Action WhatsNew]
Name=What's new
Name[pt_BR]=O que há de novo?
Exec=xdg-open /opt/REAPER/whatsnew.txt
Icon=text-x-plain
[Desktop Action License]
Name=License and User Agreement
Name[pt_BR]=Licença e contrato de usuário
Exec=xdg-open /opt/REAPER/EULA.txt
Icon=text-x-plain
EOF
aria2c --console-log-level=error --summary-interval=0\
    https://stash.reaper.fm/41334/libSwell.colortheme
mv\
    libSwell.colortheme\
    /opt/REAPER/
mkdir -p\
    /etc/skel/.config/REAPER/{LangPack,UserPlugins}
aria2c --console-log-level=error --summary-interval=0\
    https://sws-extension.org/download/pre-release/"$(wget -qO-\
    http://sws-extension.org/download/pre-release/|\
    grep Linux-x86_64|head -n1|cut -d '"' -f4)"
tar\
    fx sws-*-Linux-x86_64-*.tar.xz\
    -C /etc/skel/.config/REAPER
rm -rf sws-*-Linux-x86_64-*.tar.xz
aria2c --console-log-level=error --summary-interval=0\
    https://stash.reaper.fm"$(wget -qO-\
    https://stash.reaper.fm/tag/Language-Packs|\
    grep pt-BR|head -n1|cut -d '"' -f2|sed 's/\/v//g')"
mv\
    pt-BR.ReaperLangPack\
    /etc/skel/.config/REAPER/LangPack/
aria2c --console-log-level=error --summary-interval=0\
    "$(wget -qO-\
    https://api.github.com/repos/cfillion/reapack/releases|\
    grep browser_download_url|grep download/v|grep x86_64.so|head -n1|cut -d '"' -f4)"
mv\
    reaper_reapack-x86_64.so\
    /etc/skel/.config/REAPER/UserPlugins/reaper_reapack-x86_64.so