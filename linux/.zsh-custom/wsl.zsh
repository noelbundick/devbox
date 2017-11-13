# These customizations are only added when running under Windows Subsystem for Linux
# Under WSL, /proc/sys/kernel/osrelease looks something like: 4.4.0-43-Microsoft

if grep -q Microsoft /proc/sys/kernel/osrelease; then

  # Aliases
  alias dswitch="/mnt/c/Program \ Files/Docker/Docker/DockerCli.exe -SwitchDaemon"
  alias explorer="explorer.exe"
  alias minecraft-server="docker run -d --rm -p 25565:25565 -p 25575:25575 -e EULA=TRUE -e ONLINE_MODE=FALSE -v 'C:\\temp\\minecraftdata':/data itzg/minecraft-server"

  # I should blog more often  
  function blog() {
    if type code > /dev/null; then 
      pushd ~/code/noelbundick-hexo
      code . </dev/null &>/dev/null & disown
      popd
    fi
  } >/dev/null

  # Don't 'nice' background jobs (https://github.com/Microsoft/BashOnWindows/issues/1838)
  unsetopt BG_NICE

  # Map folders on C: to my home folder
  ln -sfn /mnt/c/code ~/code
  ln -sfn /mnt/c/temp ~/temp

  # On WSL, I want to connect to the daemon running on Windows
  # TODO: Look into Windows named pipes from WSL instead of TCP (https://github.com/jstarks/npiperelay)
  export DOCKER_HOST=tcp://127.0.0.1:2375

fi
