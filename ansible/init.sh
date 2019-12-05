#!/bin/bash
set -euo pipefail

# Clone devbox repo
if [ ! -d ~/.devbox ]; then
    git clone https://github.com/noelbundick/devbox ~/.devbox
fi

# Hacks for libssl1.1 on Ubuntu 18.04 (https://github.com/hashicorp/vagrant/issues/10914#issuecomment-503055527)
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q --option "Dpkg::Options::=--force-confold" --assume-yes install libssl1.1

# Install pip
sudo apt install -y python3-pip

# Install ansible
export PATH="~/.local/bin:$PATH"
python3 -m pip install ansible --user

# Run playbook
ansible-playbook -K ~/.devbox/ansible/devbox.yml
echo "Close and reopen your shell to get your new environment!"
