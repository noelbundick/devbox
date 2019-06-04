#!/bin/bash
set -euo pipefail

# Install ansible
export PATH="~/.local/bin:$PATH"
python3 -m pip install ansible --user

# Run playbook
ansible-playbook -K ~/.devbox/ansible/devbox.yml

# Launch shell for an immediately-useful environment
exec $SHELL