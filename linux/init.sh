#!/bin/sh
set -e

sudo apt update && sudo apt install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt update
sudo apt install -y ansible
sudo echo "localhost ansible_connection=local" > /etc/ansible/hosts

curl -O https://raw.githubusercontent.com/noelbundick/devbox/master/linux/devenv-playbook.yml
sudo ansible-playbook devenv-playbook.yml
rm devenv-playbook.yml