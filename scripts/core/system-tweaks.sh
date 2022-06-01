#!/bin/bash
set -e
# System tweaks
sed -i\
	's/ondemand/performance/g'\
	/etc/init.d/cpufrequtils
sed -i\
	's/#ADD_EXTRA_GROUPS=1/ADD_EXTRA_GROUPS=1/g'\
	/etc/adduser.conf
sed -i\
	's/#EXTRA_GROUPS=/EXTRA_GROUPS=/g'\
	/etc/adduser.conf
echo\
	'kernel/mm/transparent_hugepage/enabled=always'|\
	tee\
	/etc/sysfs.d/thp.conf
mkdir -p\
	/etc/sysctl.d\
	/etc/default/grub.d
cat <<EOF |tee /etc/sysctl.d/99-pro-audio.conf>/dev/null
vm.swappiness=10
fs.inotify.max_user_watches=524288
EOF
cat <<EOF |tee /etc/default/grub.d/cmdline-linux-default.cfg>/dev/null
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash threadirqs mitigations=off"
EOF
wget -q\
	https://raw.githubusercontent.com/Ardour/ardour/master/tools/udev/99-cpu-dma-latency.rules\
	-O /etc/udev/rules.d/99-cpu-dma-latency.rules\
	>/dev/null