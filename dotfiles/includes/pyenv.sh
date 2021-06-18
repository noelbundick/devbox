# Activate pyenv
if [ -d ~/.pyenv/bin ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"

  export PATH="~/.local/bin:$PATH"
fi
