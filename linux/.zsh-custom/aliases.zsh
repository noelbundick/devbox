# Aliases
alias d="docker"
alias k="kubectl"
alias devbox-update="ansible-playbook ~/.devbox/linux/devenv-playbook.yml"
alias devbox-update-dev="ansible-playbook -e devbox_dev=true ~/.devbox/linux/devenv-playbook.yml"

# Remove all Docker containers
function dnuke() {
  if read -q '?Are you sure (y/N)?'; then
    echo # empty line
    docker rm --force $(docker ps -aq)
  fi
  echo # empty line
}

# SSH agent with default key
function ssa() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
}
