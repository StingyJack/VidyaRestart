This will find your video card and effectively restart the driver by disabling and 
reenabling the device.  Its crappy, but works (for me at least). InstallThisModule probably doesnt
work right - module installation is a pain in the ass.

You will need to download the MS cmdlets for device management and put them directly in this folder 
folder (or wherever and update the import statement).
https://gallery.technet.microsoft.com/scriptcenter/Device-Management-7fad2388

The folder structure should look like this
``` 
\ (root, where this Readme.md file is)  
\DeviceManagement.psd1  
\DeviceManagementCmdlet.dll (and .pdb)
\DeviceManagementEngine.dll (and .pdb)
\InstallThisModule.ps1
\ResetVidya.lnk
\Restart-Video.psm1
\rvga.ps1
\(other stuff like .gitignore, examples, etc)
```

This folder structure and some of the scripts assumes that DeviceManagement is installed as a
module. If that's not the case, then change the module path statement in the Restart-Video.ps1 from...

```Import-Module DeviceManagement```

to

```Import-Module $PSScriptRoot\DeviceManagement\DeviceManagement.psd1```


If you want to use that toolkit outside of Powershell command line, then find the 
PowerShellHostVersion attribute in its psd1 file and take out the 3.0 and leave blank. 

It needs to run as administrator. The Shortcut "ResetVidya" should do the work, but the 
guts are in rvga.ps1 and the device mgt stuff

Not sure if more needed to support multiple cards, as my laptop has only one.


DWTFYWWI license for my bits. The DeviceManagement stuff is MSPL and I cant find the repo here. 