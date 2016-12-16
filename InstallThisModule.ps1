$ErrorActionPreference="Stop"
$modulePath = 'C:\\Program Files\\jackshacks\\Modules\\';

if (-Not(Test-Path $modulePath))
{
    New-Item $modulePath -ItemType Directory
}
Copy-Item -Path *.psm1 -Destination $modulePath

#Save the current value in the $p variable.
$p = [Environment]::GetEnvironmentVariable("PSModulePath")

if (-Not ($p -Match $modulePath))
{
    #Add the new path to the $p variable. Begin with a semi-colon separator.
    $p += ";$modulePath"

    #Add the paths in $p to the PSModulePath value.
    [Environment]::SetEnvironmentVariable("PSModulePath",$p)    
}
else {
    Write-Host "$modulePath is already added to path"
}