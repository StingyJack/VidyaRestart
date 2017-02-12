#Requires -RunAsAdministrator

$ErrorActionPreference = "Stop"
Set-StrictMode  -Version Latest 

function Restart-Video
{
    Import-Module DeviceManagement

    $adapterName = (gwmi Win32_VideoController).Name

    Get-Device | where {$_.name -like "$adapterName*"} | Disable-Device
    Get-Device | where {$_.name -like "$adapterName*"} | Enable-Device

}
Export-ModuleMember -Function Restart-Video