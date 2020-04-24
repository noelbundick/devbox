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
  read -p "Are you sure (y/N)? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    docker rm --force $(docker ps -aq)
  fi
}

# Remove all Docker images
function dnukeimages() {
  read -p '?Are you sure (y/N)?' -n 1 -r
  echo # empty line
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    docker rmi --force $(docker images -aq)
  fi
}

# SSH agent with default key
function ssa() {
  eval $(ssh-agent -s)
  ssh-add ~/.ssh/id_rsa
}

# Edit devbox
function devbox() {
  $(cd ~/.devbox && code .)
}
