#!/bin/bash
set -e
# Drivers

# NVIDIA
if [[ -n $(lspci |grep NVIDIA|cut -d: -f3) ]];then
	echo 'Sua GPU é NVIDIA'
	lspci |grep NVIDIA|cut -d: -f3|cut -d ' ' -f4|head -n1
	apt download\
	    "$(apt search nvidia-dkms 2>/dev/null|grep nvidia-dkms|grep -v server|cut -d '/' -f1|tail -n1)"
	dpkg-deb -x nvidia-dkms* nvidia
	sed -i 's/modules/IGNORE_PREEMPT_RT_PRESENCE=1 modules/g' nvidia/usr/src/nvidia*/dkms.conf
	sudo cp -rf nvidia/usr/src/nvidia* /usr/src/
	rm -rf nvidia*
	sudo nala install\
	    "$(apt search nvidia-driver 2>/dev/null|grep nvidia-driver|grep -v server|cut -d '/' -f1|tail -n1)"
cat <<EOF |sudo tee /usr/local/bin/prime-run>/dev/null
#!/bin/sh
set -e
__NV_PRIME_RENDER_OFFLOAD=1 \
__VK_LAYER_NV_optimus=NVIDIA_only \
__GLX_VENDOR_LIBRARY_NAME=nvidia \
exec "\$@"
EOF
	sudo chmod +x /usr/local/bin/prime-run
else
	echo 'Sua GPU não é NVIDIA'
fi

# TLP
if [[ -n $(find /sys/class/power_supply|grep BAT) ]];then
	echo 'Este computador dispõe de uma bateria'
	sudo nala install tlp
	sudo systemctl enable tlp.service
	sudo tlp start
else
	echo 'Este computador não dispõe de uma bateria'
fi

# Touchpad
if [[ $(sudo dmidecode --string chassis-type) == Notebook ]];then
	echo 'Este computador é um notebook'
	sudo nala install xserver-xorg-input-synaptics
    bash -x kubuntu-custom/postinst/core/touche.sh #external-package
    bash -x kubuntu-custom/postinst/core/touchegg.sh #PPA
else
	echo 'Este computador não é um notebook'
fi