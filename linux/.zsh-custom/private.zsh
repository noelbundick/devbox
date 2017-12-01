# Load private .zsh files (if they exist)
if [[ -d ~/.devbox-private/linux/.zsh-custom ]]; then
  for config_file (~/.devbox-private/linux/.zsh-custom/*.zsh); do
    source $config_file
  done
fi