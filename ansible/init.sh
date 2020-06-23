#!/bin/bash
set -euo pipefail

# Clone devbox repo
if [ ! -d ~/.devbox ]; then
    git clone https://github.com/noelbundick/devbox ~/.devbox
fi

# Create a random GUID for use with Ansible vault
mkdir -p ~/.devbox/ansible/secrets
uuidgen > ~/.devbox/ansible/secrets/.vault_pass.txt
export ANSIBLE_VAULT_PASSWORD_FILE=~/.devbox/ansible/secrets/.vault_pass.txt

# Save a GitHub PAT for use with the GH API
# PAT needs read:user because of a bug: https://github.com/sigmavirus24/github3.py/issues/797
read -p "Enter a GitHub PAT (needs read:user): " -e -s GITHUB_PAT <&1
echo "github_pat: $GITHUB_PAT" > ~/.devbox/ansible/secrets/secrets.yaml

# Hacks for libssl1.1 on Ubuntu 18.04 (https://github.com/hashicorp/vagrant/issues/10914#issuecomment-503055527)
sudo apt-get update
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -q --option "Dpkg::Options::=--force-confold" --assume-yes install libssl1.1

# Install/upgrade pip
sudo apt install -y python3-pip
sudo -H pip3 install --upgrade pip

# Install ansible
export PATH="~/.local/bin:$PATH"
python3 -m pip install ansible --user

# Encrypt secrets
ansible-vault encrypt ~/.devbox/ansible/secrets/secrets.yaml

# Run playbook
ansible-playbook -K ~/.devbox/ansible/devbox.yml
echo "Close and reopen your shell to get your new environment!"
