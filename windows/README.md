# Windows

## Boxstarter

* https://boxstarter.org/package/url?https://raw.githubusercontent.com/noelbundick/devbox/master/windows/boxstarter.ps1

## Windows Subsystem for Linux

* Get the Windows 10 [Fall Creators Update](https://blogs.windows.com/windowsexperience/2017/10/17/get-windows-10-fall-creators-update)
* Download [Ubuntu](https://www.microsoft.com/store/productId/9NBLGGH4MSV6) from the store

## Windows tools

* [7zip](http://www.7-zip.org/)
* [Azure Storage Explorer](https://azure.microsoft.com/en-us/features/storage-explorer/)
* [Docker for Windows](https://store.docker.com/editions/community/docker-ce-desktop-windows)
* [Fiddler](https://www.telerik.com/fiddler)
* [GitExtensions](https://gitextensions.github.io/)
* [Google Chrome](https://www.google.com/chrome/)
* [Postman](https://www.getpostman.com/)
* [Sysinternals](https://docs.microsoft.com/en-us/sysinternals/downloads/sysinternals-suite)
* [Visual Studio Code](https://code.visualstudio.com)
* [Visual Studio IDE](https://www.visualstudio.com/vs/)

## System configuration

### Console aliases

I use a few aliases for the Windows Command Prompt to make things a little nicer when I have to use it

```shell
reg import cmdrc.cmd
```

### Windows Defender

Exclusions

* `C:\code`
* `C:\Users\noelb\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc`

### Windows Subsystem for Linux

* [Setup Linux environment](https://github.com/noelbundick/devbox/tree/master/linux)

#### Docker with WSL

Securely communicate with the Docker daemon from WSL [via npiperelay](https://blogs.technet.microsoft.com/virtualization/2017/12/08/wsl-interoperability-with-docker/)

The flow looks like `docker` -> `/var/run/docker.sock` -> `socat` -> `stdout/stdin` -> `npiperelay` -> `\\.pipe\docker_engine` -> `dockerd`

```code
go get -d github.com/jstarks/npiperelay
mkdir -p /mnt/c/tools
GOOS=windows go build -o /mnt/c/tools/npiperelay.exe github.com/jstarks/npiperelay
```

### Dynamic DNS w/ Cloudflare

Copy `registerCloudflare.ps1` to `C:\tools\registerCloudflare.ps1`

Create a Scheduled Task with the following Action

```
Program/script: C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
-Command "& 'C:\tools\registerCloudflare.ps1' -Email 'user@example.com' -ApiKey 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX' -Domain 'example.com' -Name 'myfriendlyname'"
```

## Useful shortcuts

* `Win+R` - Run a command / launch a program
* `Win+Tab` - Show all windows, manage virtual desktops
* `Ctrl+Win+Left/Right` - Switch virtual desktops
* `Win+Arrow keys` - Snap windows

