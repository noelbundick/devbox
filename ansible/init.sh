#!/bin/bash
set -euo pipefail

# Clone devbox repo
git clone https://github.com/noelbundick/devbox ~/.devbox

# Install pip
sudo apt install -y python3-pip

# Install ansible
export PATH="~/.local/bin:$PATH"
python3 -m pip install ansible --user

# Run playbook
ansible-playbook -K ~/.devbox/ansible/devbox.yml

# Launch shell for an immediately-useful environment
exec $SHELL