# Aliases
alias ccat="pygmentize -g"
alias d="docker"
alias devbox-update="sudo ansible-playbook ~/.devbox/linux/devenv-playbook.yml"
alias devbox-update-dev="sudo ansible-playbook -e devbox_dev=true ~/.devbox/linux/devenv-playbook.yml"
alias devrc="vi ~/.devbox/linux/devenv-playbook.yml"
alias k="kubectl"
alias kctx="kubectx"
alias kns="kubens"
alias tf="terraform"
alias tmuxrc="vim ~/.tmux.conf"
alias vimrc="vim ~/.vimrc"
alias zshrc="vim ~/.zshrc"

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

# mimic armclient (https://github.com/projectkudu/ARMClient)
function armclient() {
  local METHOD=$1
  local URL=$2
  local ACCESS_TOKEN=`az account get-access-token --query accessToken -o tsv`

  curl -s -X $METHOD -H "Authorization: Bearer $ACCESS_TOKEN" "https://management.azure.com$URL" | jq
}

function nginx-serve() {
  local DIR=$(realpath $1)
  local PORT=${2:-8080}
  docker run -d -v $DIR:/usr/share/nginx/html -p $PORT:80 nginx
}
