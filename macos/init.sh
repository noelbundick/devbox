#!/bin/bash
set -e

# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null

# install ansible
brew install ansible
sudo echo "localhost ansible_connection=local" > /etc/ansible/hosts

curl -O https://raw.githubusercontent.com/noelbundick/devbox/master/linux/devenv-playbook.yml
sudo ansible-playbook devenv-playbook.yml
rm devenv-playbook.yml

