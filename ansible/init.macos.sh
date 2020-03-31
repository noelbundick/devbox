#!/bin/bash
set -euo pipefail

# Clone devbox repo
if [ ! -d ~/.devbox ]; then
  git clone https://github.com/noelbundick/devbox ~/.devbox
fi

# Install ansible
export PATH="~/Library/Python/3.7/bin:$PATH"
python3 -m pip install ansible --user

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Run playbook
ansible-playbook -K ~/.devbox/ansible/devbox.yml
echo "Close and reopen your shell to get your new environment!"

