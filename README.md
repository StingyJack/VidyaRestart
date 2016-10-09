This will find your video card and effectively restart the driver by disabling and 
reenabling the device. 

You will need to download the MS cmdlets for device management and put them in the \DeviceManagement 
folder (or wherever and update the import statement).
https://gallery.technet.microsoft.com/scriptcenter/Device-Management-7fad2388

If you want to use that toolkit outside of Powershell command line, then find the 
PowerShellHostVersion attribute in its psd1 file and take out the 3.0 and leave blank. 

It needs to run as administrator. The Shortcut "ResetVidya" should do the work, but the 
guts are in rvga.ps1 and the device mgt stuff

Not sure if more needed to support multiple cards, as my laptop has only one.


DWTFYWWI license for my bits. The DeviceManagement stuff is MSPL and I cant find the repo here. 