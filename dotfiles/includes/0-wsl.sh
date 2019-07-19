if [ -d /proc/sys/kernel ] && grep -q Microsoft /proc/sys/kernel/osrelease; then

  # Aliases
  alias explorer="explorer.exe"
  alias gitext="nohup /mnt/c/Program\ Files\ \(x86\)/GitExtensions/GitExtensions.exe >/dev/null 2>&1 & disown"

  # Use Windows path for Go
  export GOPATH=/mnt/c/code/go

  # Enable Docker
  export DOCKER_HOST=tcp://localhost:2375

  # Run Linux containers by default
  export DOCKER_DEFAULT_PLATFORM=linux

  # Add VS Code to PATH (WSL bug in 1903?)
  export PATH="$PATH:/mnt/c/Program Files/Microsoft VS Code/bin"

fi
