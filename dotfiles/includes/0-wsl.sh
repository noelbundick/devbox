if [ -d /proc/sys/kernel ] && grep -q Microsoft /proc/sys/kernel/osrelease; then

  # Aliases
  alias explorer="explorer.exe"
  alias gitext="nohup /mnt/c/Program\ Files\ \(x86\)/GitExtensions/GitExtensions.exe >/dev/null 2>&1 & disown"

  # The current Windows username can be useful
  export WIN_USER=$(cd /mnt/c && cmd.exe /d /c echo %USERNAME%)

  # Use Windows path for Go
  export GOPATH=/mnt/c/code/go

  # Enable Docker
  export DOCKER_HOST=tcp://localhost:2375

  # Run Linux containers by default
  export DOCKER_DEFAULT_PLATFORM=linux

  # Add VS Code to PATH (WSL bug in 1903?)
  export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin"

  # Remove Windows node from PATH
  export PATH=$(echo $PATH | sed -e 's/:\/mnt\/c\/Program Files\/nodejs\///' -e "s/:\/mnt\/c\/Users\/$WIN_USER\/AppData\/Roaming\/npm//")

fi
