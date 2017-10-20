$ProgressPreference = 'SilentlyContinue'

function Install-Font() 
{
  param(
    [Parameter(Mandatory=$true)]
    [string] $FontPath
  )

  $shell = New-Object -ComObject Shell.Application
  $fonts = $shell.NameSpace(0x14)

  $fullPath = (Resolve-Path -Path $FontPath).Path
  $fonts.CopyHere($fullPath)
}

# Install the Ubuntu Mono derivative Powerline font
Invoke-WebRequest `
  -Uri 'https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf' `
  -UseBasicParsing -OutFile `
  UbuntuMonoPowerline.ttf
Install-Font .\UbuntuMonoPowerline.ttf
Remove-Item .\UbuntuMonoPowerline.ttf

# Set Ubuntu WSL colors to solarized dark
reg import .\solarized_dark.reg