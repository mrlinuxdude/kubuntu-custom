#!/bin/bash
set -e
# Swap
sudo swapoff /swapfile
sudo dd if=/dev/zero of=/swapfile bs=1M count=8192
sudo mkswap /swapfile
sudo swapon /swapfile