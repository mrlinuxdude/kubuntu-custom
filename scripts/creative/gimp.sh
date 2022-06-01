#!/bin/bash
set -e
# GIMP
apt install -y gimp
cat <<EOF |tee /usr/local/bin/gimp-2.10
#!/bin/bash
set -e
GTK2_RC_FILES="/usr/share/themes/Breeze-Dark/gtk-2.0/gtkrc" GTK_DATA_PREFIX= gimp \$@
EOF
chmod +x /usr/local/bin/gimp-2.10