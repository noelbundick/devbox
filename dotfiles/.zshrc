# note: half-baked attempt to replicate .bashrc on MacOS

alias ls='ls -G'
alias grep='grep --color=auto'

# enable aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

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

export PS1='%1d$ '
