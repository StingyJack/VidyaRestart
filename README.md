## For restarting your video driver
This will find your video card and effectively restart the driver by disabling and 
reenabling the device.  Its crappy, but works so long as you can run the module without 
being able to see the screen (driver crash). I use a shortcut with a shortcut key combo. 

## before installing

You can view the video devices (or others) by using the `.\List-VideoDevices.ps1`. If your
have multiple cards, you may need to loop them or force one or the other.

Check for the  [the DeviceManagement module](##GettheDeviceManagementmodulefrommicrosoft)


## to install

Run `InstallThisModule.ps1` and it will install this into the "machine" path (c:\prog files\windowspowershell).

Once installed run 
``` powershell
PS> Restart-Video
```
... at the powershell prompt

## Get the DeviceManagement module from microsoft
You will need to download the MS cmdlets for device management and put them directly in this folder 
folder (or wherever and update the import statement). They arent mine to redistribute.
https://gallery.technet.microsoft.com/scriptcenter/Device-Management-7fad2388

After downloading them, the folder structure should look like this...
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
module.

## bits and pieces

- It needs to run as administrator. 
- The Shortcut "ResetVidya" should do the work, but "it works on my machine". However the guts are in rvga.ps1 and the device mgt stuff
- Not sure if more needed to support multiple cards, as my laptop has only one.