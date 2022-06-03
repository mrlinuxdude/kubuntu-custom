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
sudo nala install -y buildkite-agent
echo\
    'export BUILDKITE_AGENT_TOKEN='|tee "$HOME"/.bashrc.d/buildkite-agent-token.bash
sudo sed -i\
    "s/xxx/$BUILDKITE_AGENT_TOKEN/g"\
    /etc/buildkite-agent/buildkite-agent.cfg
sudo systemctl enable buildkite-agent
sudo systemctl start buildkite-agent
cat <<EOF |sudo tee /etc/sudoers.d/10-buildkite>/dev/null
buildkite-agent ALL=(ALL) NOPASSWD:ALL
EOF