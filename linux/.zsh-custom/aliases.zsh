# Aliases
alias d="docker"
alias k="kubectl"

# Remove all Docker containers
function dnuke() {
  read -p "Are you sure? [y/N]" -n 1 -r
  echo # new line
  if [[ $REPLY =~ ^[Y/y]$ ]]
  then
    docker rm --force $(docker ps -aq)
  fi
}

# SSH agent with default key
function ssa() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
}