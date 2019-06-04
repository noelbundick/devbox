alias bashrc="vim ~/.bashrc"
alias k="kubectl"
alias sshpublic="cat ~/.ssh/id_rsa.pub"
alias sshprivate="cat ~/.ssh/id_rsa"
alias tmuxrc="vim ~/.tmux.conf"
alias vimrc="vim ~/.vimrc"

# Prefer VS Code Insiders
if which code-insiders > /dev/null; then
  alias code=code-insiders
fi

# Remove all Docker containers
function dnuke() {
  if read -q '?Are you sure (y/N)?'; then
    echo # empty line
    docker rm --force $(docker ps -aq)
  fi
  echo # empty line
}

# Remove all Docker images
function dnukeimages() {
  if read -q '?Are you sure (y/N)?'; then
    echo # empty line
    docker rmi --force $(docker images -aq)
  fi
  echo # empty line
}

# SSH agent with default key
function ssa() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
}
