# Windows setup

```powershell
# Install console fonts I like
.\Install-Fonts.ps1

# Create a symlink for WSL code folder
New-Item -ItemType SymbolicLink -Path wslcode -Target "\\wsl$\Ubuntu-18.04\home\noel\code"
```