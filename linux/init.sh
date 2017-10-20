#!/bin/sh
set -e

sudo apt update && sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
sudo echo "localhost ansible_connection=local" > /etc/ansible/hosts

# sudo ansible-playbook /mnt/c/code/dotfiles/devenv-playbook.yml