Import-Module $PSScriptRoot\chocolatey.psm1
Import-Module $PSScriptRoot\wsl.psm1
Import-Module $PSScriptRoot\vstweaks.psm1
Import-Module $PSScriptRoot\w10tweaks.psm1

Update-ExecutionPolicy Unrestricted

Disable-UAC
Disable-MicrosoftUpdate

# Is this being run? vssadmin Delete Shadows /For=$env:SYSTEMDRIVE /Quiet
Disable-ComputerRestore "C:\", "D:\", "E:\"

InstallChocoPackages
InstallWSL2
TweakCodeAndStudio
TweakWin10

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
