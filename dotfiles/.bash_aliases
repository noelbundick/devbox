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

# Update devbox with latest bits
function devbox() {
  ANSIBLE_VAULT_PASSWORD_FILE=~/.devbox/ansible/secrets/.vault_pass.txt \
    ansible-playbook -K ~/.devbox/ansible/devbox.yml
}

# Edit devbox
function devrc() {
  (cd ~/.devbox && code .)
}

# Edit QMK
function qmkrc() {
  (cd ~/code/noelbundick/qmk_firmware && code .)
}

# Compile all keyboards
function qmkc() {
  (
    cd ~/code/noelbundick/qmk_firmware
    source venv~/bin/activate

    make 40percentclub/gherkin:noelbundick
    make dz60:noelbundick
    make dztech/dz60rgb_ansi/v2:noelbundick
    make helix:noelbundick
    make launchpad:noelbundick
    make lets_split/rev2:noelbundick
    make planck/rev6:noelbundick

    mkdir -p ~/downloads/qmk
    cp .build/*.{hex,bin} ~/downloads/qmk
  )
}