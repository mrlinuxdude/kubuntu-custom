#!/bin/bash
set -e
# Firefox
add-apt-repository -y ppa:mozillateam/ppa
cat <<EOF |tee /etc/apt/preferences.d/mozilla-firefox.pref>/dev/null
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001

Package: firefox*
Pin: release o=Ubuntu
Pin-Priority: -1
EOF
cat <<EOF |tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox>/dev/null
Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:\${distro_codename}";
EOF
apt install -y\
    firefox\
    firefox-locale-pt\
    xul-ext-ubufox
sed -i\
    's@>preferred://browser,@>applications:firefox.desktop,<@g'\
    /usr/share/plasma/plasmoids/org.kde.plasma.kicker/contents/config/main.xml
sed -i\
    's@>preferred://browser,@>applications:firefox.desktop,<@g'\
    /usr/share/plasma/plasmoids/org.kde.plasma.kickoff/contents/config/main.xml
sed -i\
    's@,preferred://browser<@,applications:firefox.desktop<@g'\
    /usr/share/plasma/plasmoids/org.kde.plasma.taskmanager/contents/config/main.xml