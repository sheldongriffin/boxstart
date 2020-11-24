Import-Module $PSScriptRoot\chocolatey.psm1

Update-ExecutionPolicy Unrestricted

Disable-UAC
Disable-MicrosoftUpdate

Disable-ComputerRestore "C:\", "D:\", "E:\"

InstallChocoPackages

Enable-UAC
Enable-MicrosoftUpdate
Install-WindowsUpdate -AcceptEula -GetUpdatesFromMS
