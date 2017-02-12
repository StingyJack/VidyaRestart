#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"
Set-StrictMode  -Version Latest 

Import-Module .\InstallHelpers.psm1

InstallPsGet 
Import-Module PsGet
InstallModuleIfDoesntExist "DeviceManagement" ".\DeviceManagement.psd1"
InstallModuleIfDoesntExist "Restart-Video" ".\Restart-Video.psm1"
Write-Host "operation complete"


