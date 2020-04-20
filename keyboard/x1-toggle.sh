#!/bin/bash
set -euo pipefail

# An extremely ill-advised script to enable/disable a laptop internal keyboard
INPUT=11
DEVICE=3
if xinput list | grep -P "AT Translated Set 2 keyboard\s+id=$INPUT\s+\[slave\s+keyboard\s+\($DEVICE\)\]"; then
  xinput float $INPUT
elif xinput list | grep -P "AT Translated Set 2 keyboard\s+id=$INPUT\s+\[floating slave\]"; then
  xinput reattach $INPUT $DEVICE
fi
