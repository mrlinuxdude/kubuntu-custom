#!/bin/bash
set -e
# AnyDesk
wget -qO-\
	 https://keys.anydesk.com/repos/DEB-GPG-KEY|\
	 sudo gpg --dearmor -o\
	 /etc/apt/trusted.gpg.d/anydesk.gpg\
	 >/dev/null
echo\
	'deb http://deb.anydesk.com/ all main'|\
	sudo tee\
	/etc/apt/sources.list.d/anydesk-stable.list\
	>/dev/null
sudo nala update
sudo nala install anydesk
sudo systemctl stop anydesk
sudo systemctl disable anydesk
rm -rf /usr/lib/x86_64-linux-gnu/libpangox-1.0.so.0
sudo ln -sv\
	/usr/lib/x86_64-linux-gnu/libpangoxft-1.0.so.0\
	/usr/lib/x86_64-linux-gnu/libpangox-1.0.so.0
sudo sed -i\
	's@usr/bin/anydesk@usr/local/bin/anydesk@g'\
	/usr/share/applications/anydesk.desktop
cat <<EOF |sudo tee /usr/local/bin/anydesk>/dev/null
#!/bin/bash
set -e
GTK2_RC_FILES='/usr/share/themes/Breeze/gtk-2.0/gtkrc' /usr/bin/anydesk \$@
EOF
sudo chmod +x /usr/local/bin/anydesk