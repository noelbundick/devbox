if [ -d /proc/sys/kernel ] && grep -q Microsoft /proc/sys/kernel/osrelease; then

  # Aliases
  alias explorer="explorer.exe"
  
  # Use Windows path for Go
  export GOPATH=/mnt/c/code/go

  # Enable Docker
  export DOCKER_HOST=tcp://localhost:2375

  # Run Linux containers by default
  export DOCKER_DEFAULT_PLATFORM=linux

fi
