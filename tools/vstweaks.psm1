Function TweakCodeAndStudio {
	# "You have an older version of PackageManagement known to cause issues with the PowerShell extension."
	# https://github.com/PowerShell/vscode-powershell/issues/2824
	[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
	
	Install-PackageProvider -Name Nuget -Force
	
	Install-Module -Name PackageManagement -Force -AllowClobber
	Install-Module -Name PowerShellGet -Force -AllowClobber
	Install-Module -Name PSReadline -Force -AllowClobber
	
	code --install-extension ms-vscode.powershell
}

Export-ModuleMember -Function TweakCodeAndStudio
