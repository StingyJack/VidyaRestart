#Requires -RunAsAdministrator

Import-Module $PSScriptRoot\DeviceManagement\DeviceManagement.psd1

$adapterName = (gwmi Win32_VideoController).Name

Get-Device | where {$_.name -like "$adapterName*"} | Disable-Device
Get-Device | where {$_.name -like "$adapterName*"} | Enable-Device


Read-Host -Prompt "Press Enter to continue"