Function InstallWSL2 {
    Enable-WindowsOptionalFeature -Online -FeatureName "Microsoft-Windows-Subsystem-Linux" -NoRestart -OutVariable results
    if ($results.RestartNeeded -eq $true) {
        Restart-Computer -Force
    }
    Enable-WindowsOptionalFeature -Online -FeatureName "VirtualMachinePlatform" -NoRestart -OutVariable results
    if ($results.RestartNeeded -eq $true) {
        Restart-Computer -Force
    }

    #https://docs.microsoft.com/en-us/windows/wsl/wsl2-kernel
    $wslUpdateSource = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
    $wslMsiArgs = @('/i', $wslUpdateSource, '/quiet', '/norestart')

    Start-Process -FilePath msiexec -ArgumentList $wslMsiArgs -NoNewWindow -Wait

    wsl --set-default-version 2

    choco install docker-desktop
	
	code --install-extension ms-vscode-remote.remote-wsl
}

Export-ModuleMember -Function InstallWSL2
