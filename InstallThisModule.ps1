#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"
Set-StrictMode  -Version Latest 

function InstallPsGet() {
    if (Get-Module -ListAvailable -Name PsGet) {
        Write-Host "PSGet already installed"
    } else {
        Write-Host "PSGet not installed downloading..."
        (new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex
        Write-Host "PSGet installed and should be OK to use"
    }
}

function InstallModuleIfDoesntExist (
    # The name of the module
    [string] $moduleName,
    # Parameter help description
    [string] $localModulePath = $null
){
    if (Get-Module -ListAvailable -Name moduleName) {
        Write-Host "$moduleName already installed"
        return
    } else {
        if ([string]::IsNullOrWhiteSpace($localModulePath)) {
            Write-Host "$moduleName not installed... Getting from package manager"
            Install-Module -Module $moduleName -Global
        }
        else {
            Write-Host "$moduleName not installed... Using specified path "$localModulePath
            Install-Module -ModulePath $localModulePath -Global
        }
    }
}

InstallPsGet 
Import-Module PsGet
InstallModuleIfDoesntExist "DeviceManagement" ".\DeviceManagement.psd1"
InstallModuleIfDoesntExist "Restart-Video" ".\Restart-Video.psm1"
Write-Host "operation complete"


