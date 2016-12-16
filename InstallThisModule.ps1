$ErrorActionPreference="Stop"

$modulePath = "$env:programfiles\WindowsPowerShell\Modules\jackshacks";

Write-Output "Installing modules to $modulePath"

if (-Not(Test-Path $modulePath))
{
    Write-Output "Creating module folder $modulePath";
    New-Item $modulePath -ItemType Directory
}

$psFiles = Get-ChildItem -Path $PSScriptRoot -File
$psModules = $psFiles | where{$_.Extension -eq ".psm1"}

foreach($psModule in $psModules) {
    
    Write-Output "Adding module $psModule"
    Copy-Item -Path $psModule.FullName -Destination $modulePath
}

$p = [Environment]::GetEnvironmentVariable("PSModulePath")

#because regex is fail
$modulePathLike = "*$modulePath*"

if (-Not ($p -like $modulePathLike))
{
    $p += ";$modulePath"
    [Environment]::SetEnvironmentVariable("PSModulePath",$p) 
 
}
else {
    Write-Output "$modulePath is already added to path"
}

$broadcastSettingsChange = $PSScriptRoot + "\Broadcast-SettingsChanged.ps1"
Invoke-Expression -Command $broadcastSettingsChange

Write-Output "Module install complete"