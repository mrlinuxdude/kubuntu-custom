#!/bin/bash
set -e
# Bash

# bashrc.d
sed -i\
	'/^# bashrc.d/{N;N;N;d;}'\
	"$HOME"/.bashrc
cat <<EOF |tee -a "$HOME"/.bashrc>/dev/null
# bashrc.d
for script in "\$HOME"/.bashrc.d/*.bash;do
	source \$script
done
EOF
mkdir -p "$HOME"/.bashrc.d/themes

# ntfy
sudo nala install libnotify-bin
pip install -q ntfy
cat <<EOF |tee "$HOME"/.bashrc.d/ntfy.bash>/dev/null
PATH="\$PATH":"\$HOME"/.local/bin
eval "\$(ntfy shell-integration)"
EOF

# history-search
cat <<EOF |tee "$HOME"/.bashrc.d/history-search.bash>/dev/null
if [[ \$- == *i* ]]
then
    bind '"\e[A": history-search-backward'
    bind '"\e[B": history-search-forward'
fi
EOF

# hstr
cat <<EOF |tee "$HOME"/.bashrc.d/hstr.bash>/dev/null
alias hh=hstr
export HSTR_CONFIG=hicolor
shopt -s histappend
export HISTCONTROL=ignorespace
export HISTFILESIZE=10000
export HISTSIZE=\${HISTFILESIZE}
export PROMPT_COMMAND="history -a; history -n; \${PROMPT_COMMAND}"
if [[ \$- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi
if [[ \$- =~ .*i.* ]]; then bind '"\C-xk": "\C-a hstr -k \C-j"'; fi
EOF

# synth-shell
#git clone --recursive https://github.com/andresgongora/synth-shell.git
#bash synth-shell/setup.sh
#rm -rf synth-shell
#source "$HOME"/.bashrc

# Agnoster
rm -rf "$HOME"/.bashrc.d/themes/agnoster
git clone -q\
	https://github.com/speedenator/agnoster-bash\
	"$HOME"/.bashrc.d/themes/agnoster
cat <<EOF |tee "$HOME"/.bashrc.d/agnoster.bash>/dev/null
source "\$HOME"/.bashrc.d/themes/agnoster/agnoster.bash
EOF

# SSH environment
cat <<EOF |tee "$HOME"/.bashrc.d/ssh-environment.bash>/dev/null
export DISPLAY=:0
export LANG=pt_BR.UTF-8
export LC_ALL=pt_BR.UTF-8
EOF

# Micro
mkdir -p "$HOME"/.config/micro
cat <<EOF |tee "$HOME"/.config/micro/settings.json>/dev/null
{
	"eofnewline": false,
}
EOF

# fzf
cat <<EOF |sudo tee /usr/local/bin/fzf>/dev/null
#!/bin/bash
set -e
/usr/bin/fzf --preview 'batcat --style=numbers --color=always --line-range :500 {}'
EOF
sudo chmod +x /usr/local/bin/fzf

# Bash line editor (ble.sh)
git clone -q --recursive https://github.com/akinomyoga/ble.sh.git
make\
	-C ble.sh install\
	PREFIX="$HOME"/.local\
	>/dev/null
cat <<EOF |tee "$HOME"/.bashrc.d/blesh.bash>/dev/null
source "\$HOME"/.local/share/blesh/ble.sh
EOF
cat <<EOF |tee "$HOME"/.blerc>/dev/null
ble-face -s auto_complete fg=238,bg=000
bleopt complete_auto_delay=300
EOF
rm -rf ble.sh*

# Top programming fonts
bash <(wget -qO-\
	https://github.com/hbin/top-programming-fonts/raw/master/install.sh|\
	sed 's/wget -c/wget -cq/g')