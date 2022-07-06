#!/bin/bash
set -e
# BuildKite
echo\
    'deb https://apt.buildkite.com/buildkite-agent stable main'|\
    sudo tee\
    /etc/apt/sources.list.d/buildkite-agent.list\
    >/dev/null
sudo apt-key --keyring\
    /etc/apt/trusted.gpg.d/buildkite-agent.gpg\
    adv	--keyserver\
    hkp://keyserver.ubuntu.com:80\
    --recv-keys 32A37959C2FA5C3C99EFBC32A79206696452D198\
	2>/dev/null
sudo nala update
sudo nala install buildkite-agent
cat <<EOF |tee "$HOME"/.bashrc.d/buildkite-tokens.bash>/dev/null
export BUILDKITE_AGENT_TOKEN=
export BUILDKITE_API_TOKEN=
EOF
sudo sed -i\
    "s/xxx/$BUILDKITE_AGENT_TOKEN/g"\
    /etc/buildkite-agent/buildkite-agent.cfg
sudo systemctl enable buildkite-agent
sudo systemctl start buildkite-agent
echo\
    'buildkite-agent ALL=(ALL) NOPASSWD:ALL'|\
    sudo tee\
    /etc/sudoers.d/10-buildkite\
    >/dev/null