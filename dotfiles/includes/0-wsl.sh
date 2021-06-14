if [ -d /proc/sys/kernel ] && grep -iq microsoft /proc/sys/kernel/osrelease; then

  # The current Windows username can be useful
  export WIN_USER=$(cd /mnt/c && cmd.exe /d /c echo %USERNAME% | tr -d '\r\n')

  # Aliases
  alias explorer="explorer.exe"

  function wininvoke() {
    local program="$1"
    { "$program" "${@:2}" & disown; } &>/dev/null
  }
  
  function fork() {
    wininvoke "/mnt/c/Users/$WIN_USER/AppData/Local/Fork/Fork.exe" $(wslpath -aw .)
  }
  
  function gitext() {
    local current_path=$(wslpath -aw .)
    local code_path=$(echo $current_path | sed -e 's|\\\\wsl\$\\.*\\home\\.*\\code|C:\\wslcode|g')
    wininvoke "/mnt/c/Program Files (x86)/GitExtensions/GitExtensions.exe" browse $code_path
  }

  # Run Linux containers by default
  export DOCKER_DEFAULT_PLATFORM=linux

  # Remove Windows node from PATH to prevent accidental npm selection
  export PATH=$(echo $PATH | sed -e 's/:\/mnt\/c\/Program Files\/nodejs\///' -e "s/:\/mnt\/c\/Users\/$WIN_USER\/AppData\/Roaming\/npm//")

fi
