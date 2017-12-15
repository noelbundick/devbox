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

# Install the DejaVu Sans Mono for Powerline font
Invoke-WebRequest `
  -Uri 'https://github.com/powerline/fonts/raw/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf' `
  -UseBasicParsing -OutFile `
  DejaVuMonoPowerline.ttf
Install-Font .\DejaVuMonoPowerline.ttf
Remove-Item .\DejaVuMonoPowerline.ttf

# Set Ubuntu WSL colors to solarized dark
reg import .\solarized_dark.reg