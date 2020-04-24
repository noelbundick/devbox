if [ -d /proc/sys/kernel ] && grep -iq microsoft /proc/sys/kernel/osrelease; then

  # The current Windows username can be useful
  export WIN_USER=$(cd /mnt/c && cmd.exe /d /c echo %USERNAME% | tr -d '\r\n')

  # Aliases
  alias explorer="explorer.exe"
  
  function fork() {
    /mnt/c/Users/$WIN_USER/AppData/Local/Fork/Fork.exe $(wslpath -aw .)
  }
  
  function gitext() {
    local current_path=$(wslpath -aw .)
    local code_path=$(echo $current_path | sed -e 's|\\\\wsl\$\\.*\\home\\.*\\code|C:\\wslcode|g')
    nohup /mnt/c/Program\ Files\ \(x86\)/GitExtensions/GitExtensions.exe browse $code_path >/dev/null 2>&1 & disown
  }

  # Run Linux containers by default
  export DOCKER_DEFAULT_PLATFORM=linux

  # Remove Windows node from PATH to prevent accidental npm selection
  export PATH=$(echo $PATH | sed -e 's/:\/mnt\/c\/Program Files\/nodejs\///' -e "s/:\/mnt\/c\/Users\/$WIN_USER\/AppData\/Roaming\/npm//")

  function beats() {
    local PLAYLIST=PLt7bG0K25iXgmw39iaVpZRszuwcsGNJFW  # endless chillhop
    # TODO: find a way to unset WS_CAPTION so it's truly frameless
    '/mnt/c/Program Files (x86)/BraveSoftware/Brave-Browser/Application/brave.exe' --app="https://www.youtube.com/embed?listType=playlist&list=${PLAYLIST}&autoplay=1&color=red&controls=0&disablekb=1&iv_load_policy=3&loop=1&modestbranding=1&rel=0" --beats
  }

  function keeb() {
    local kb="$1"
    case "$1" in
      "dz60")
        echo "https://raw.githubusercontent.com/noelbundick/devbox/master/keyboard/dz60.json" | clip.exe
        wslview "https://config.qmk.fm/#/dz60/LAYOUT_60_ansi"
        ;;
      "annepro2")
        $(nohup "/mnt/c/Program Files/ObinsKit/ObinsKit.exe" &>/dev/null & disown)
        ;;
      *)
        echo "Error: Keyboard $1 not found"
        ;;
    esac
  }
fi
