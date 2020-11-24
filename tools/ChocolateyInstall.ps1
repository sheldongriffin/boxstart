Import-Module $PSScriptRoot\chocolatey.psm1
Import-Module $PSScriptRoot\wsl.psm1
Import-Module $PSScriptRoot\vstweaks.psm1

Update-ExecutionPolicy Unrestricted

Disable-UAC
Disable-MicrosoftUpdate

Disable-ComputerRestore "C:\", "D:\", "E:\"

InstallChocoPackages
InstallWSL2
TweakCodeAndStudio

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
