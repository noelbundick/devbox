############
# This script will add your WSL environments to the Windows Defender exclusion list so that
# realtime protection does not have an adverse effect on performance.
#
# You should be aware that this could make your system less secure. Use at your own risk.
# Note: This should be run from an administrative PowerShell prompt
############

# Find registered WSL environments
$wslPaths = (Get-ChildItem HKCU:\Software\Microsoft\Windows\CurrentVersion\Lxss | % { Get-ItemProperty $_.PSPath}).BasePath

# Get the current Windows Defender exclusion paths
$currentExclusions = $(Get-MpPreference).ExclusionPath
if (!$currentExclusions) {
  $currentExclusions = ''
}

# Find the WSL paths that are not excluded
$exclusionsToAdd = ((diff $wslPaths $currentExclusions) | ? SideIndicator -eq "<=").InputObject

# Add the missing entries to Windows Defender
if ($exclusionsToAdd.Length -gt 0) {
  $exclusionsToAdd | % { 
    Add-MpPreference -ExclusionPath $_
    Write-Output "Added exclusion for $_"
  }
}
