#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"
Set-StrictMode  -Version Latest 

Import-Module .\InstallHelpers.psm1

Uninstall-Module -Name Restart-Video -Force
Write-Host "operation complete"
