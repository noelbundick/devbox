#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Link dotfiles
for dotfile in $(find "$SCRIPT_DIR/../dotfiles" -maxdepth 1 -name ".*"); do
  if [ -f "$dotfile" ]; then
    ABS_PATH=$(readlink -m $dotfile)
    NAME=$(basename $ABS_PATH)
    # ln -sf $ABS_PATH ~/$NAME
    echo $ABS_PATH
  fi
done

# Set up azure-cli
mkdir -p ~/.azure
ln -sf $(readlink -m "$SCRIPT_DIR/../dotfiles/.azure/config") ~/.azure/config
