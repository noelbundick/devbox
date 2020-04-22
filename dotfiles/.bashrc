# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# configure history behavior
shopt -s histappend
HISTCONTROL=ignoreboth
HISTFILESIZE=100000
HISTSIZE=100000
HISTIGNORE='ls:bg:fg:pwd:clear:history:[ \t]*'

# enable color support of ls and also add handy aliases
eval "$(dircolors -b ~/.dircolors)"
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# enable aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# hook for other scripts to inject custom prompt logic as needed
__customprompt() {
  : # do nothing
}

# Activate includes that don't contain '__'
# If ordering matters, name files with numbers
for d in ~/.devbox/dotfiles/includes/* ; do
  if [[ ! $d =~ __.*.sh$ ]]; then
    source "$d"
  fi
done

# Set vim as the default editor
export VISUAL=vim
export EDITOR="$VISUAL"

export VIRTUAL_ENV_DISABLE_PROMPT=1
__venv_ps1() {
  VENV_PREFIX=
  if [ -n "$VIRTUAL_ENV" ]; then
    VENV_PREFIX="(`basename \"$VIRTUAL_ENV\"`) | "
  fi
}

dumb() {
  export PROMPT_COMMAND="history -a;history -c;history -r;__customprompt;"
  export PS1='\W\$ '
}

# Set prompt, per https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
smart() {
  export GIT_PS1_SHOWCOLORHINTS=true
  export GIT_PS1_SHOWDIRTYSTATE=true
  export PROMPT_COMMAND='history -a;history -c;history -r;__venv_ps1; __git_ps1 "$VENV_PREFIX\W" "\\\$ ";__customprompt;'
}

smart

