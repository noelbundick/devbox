# Activate pyenv
if [ -d ~/.pyenv/bin ]; then
  export PATH="~/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"

  export PATH="~/.local/bin:$PATH"
fi
