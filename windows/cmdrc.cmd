@echo off

:: Usage - Add the following registry entry
:: [HKEY_CURRENT_USER\Software\Microsoft\Command Processor]
:: "Autorun"="C:\\code\\devbox\\windows\\cmdrc.cmd"

:: Aliases
doskey ls=dir $*
doskey cp=copy $*
doskey mv=move $*
doskey rm=del $*
doskey cat=type $*