if [ -n "$BASH_VERSION" ]; then
  source <(kubectl completion bash)
  source <(kubectl completion bash | sed 's/kubectl/k/g')
fi

if [ -n "$ZSH_VERSION" ]; then
  autoload -Uz compinit
  compinit

  source <(kubectl completion zsh)
  complete -F __start_kubectl k
fi