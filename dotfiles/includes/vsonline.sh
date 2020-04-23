if [[ "$ORYX_ENV_TYPE" = "vsonline-present" ]]; then 
  export PATH="~/.dotnet:/opt/oryx:/opt/nodejs/lts/bin:/opt/python/latest/bin:/opt/yarn/stable/bin:~/.local/bin:~/.npm-global/bin:$PATH"

  for completion in /etc/bash_completion.d/* ; do
    . $completion
  done
fi
