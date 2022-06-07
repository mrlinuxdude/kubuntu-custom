#!/bin/bash
set -e
# PackageCloud
sudo nala install -y ruby-dev
sudo gem install package_cloud
echo '{"url":"https://packagecloud.io", "token": ""}' > ~/.packagecloud