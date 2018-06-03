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

# Disable GPU for streaming
alias code-nogpu="code --disable-gpu"

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

function scratch() {
  local FILE=~/scratch/`date +%Y-%m-%d`.md

  # Allow for a hook to transform the scratch file path (ex: under WSL)
  type scratch-hook &>/dev/null
  if [[ $? -eq 0 ]]; then
    FILE=$(scratch-hook $FILE)
  fi

  (code $FILE </dev/null &>/dev/null &)
}

function web_search() {
  typeset -A urls
  urls=(
    github  "https://github.com/search?q="
    google  "https://www.google.com/search?q="
  )

  if [[ -z "$urls[$1]" ]]; then
    echo "Search engine $1 not supported"
    return 1
  fi

  if [[ $# -gt 1 ]]; then
    # build search url
    # join arguments passed with '+', then append to search engine URL
    url="${urls[$1]}${(j:+:)@[2,-1]}"
  else
    # build main page url
    # split by '/', then rejoin protocol (1) and domain (2) parts with '//'
    url="${(j://:)${(s:/:)urls[$1]}[1,2]}"
  fi

  open_command "$url"
}
alias github="web_search github"
alias google="web_search google"
