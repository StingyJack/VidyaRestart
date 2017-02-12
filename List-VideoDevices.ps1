$ErrorActionPreference = "Stop"
Set-StrictMode  -Version Latest 

Import-Module .\DeviceManagement.psd1
$adapterName = (Get-WmiObject Win32_VideoController).Name
Write-Output "Found video adapter $adapterName"

$device = Get-Device | Where-Object {$_.name -like "$adapterName*"} 
Write-Output $device