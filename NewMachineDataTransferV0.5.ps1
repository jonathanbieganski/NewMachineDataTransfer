#Run this script with elevated priviages!
#This script automates the data transfer from the old to new machine. 
#It attemps to emulate the amazingly fast and decisive hands of the one and only Joey Costantino.
##PowerShelled By JB##

#Collect info and Declare Variables
Write-Warning "RUN THIS SCRIPT WITH ELEVATED PRIVILAGES & ON THE NEW MACHINE AFTER THE END-USER HAS LOGGED IN!"
$OldHostname = Read-Host "What is the Old Machines Hostname?"
$UserName = Read-Host "What is the End-User's Username?"
$NewHostname = hostname
$UserEmail = "$UserName@DomainName.com"

#Copy Data from Old machine to New Machine.
Write-host "FILE TRANSFER"
robocopy "\\$OldHostname\C$\Users\$UserName\Desktop" "\\$NewHostname\C$\Users\$UserName\Desktop"  /mt /z /e /xf "*.lnk" "*.exe" "*.url"
robocopy "\\$OldHostname\C$\Users\$UserName\Downloads" "\\$NewHostname\C$\Users\$UserName\Downloads"  /mt /z /e /xf "*.lnk" "*.exe" "*.url" 
robocopy "\\$OldHostname\C$\Users\$UserName\Documents" "\\$NewHostname\C$\Users\$UserName\Documents"  /mt /z /e
robocopy "\\$OldHostname\C$\Users\$UserName\Pictures" "\\$NewHostname\C$\Users\$UserName\Pictures"  /mt /z /e
robocopy "\\$OldHostname\C$\Users\$UserName\Videos" "\\$NewHostname\C$\Users\$UserName\Videos"  /mt /z /e

#Copy Chrome Default folder.
robocopy "\\$OldHostname\C$\Users\$UserName\AppData\Local\Google\Chrome\User Data\Default" "\\$NewHostname\C$\Users\$UserName\AppData\Local\Google\Chrome\User Data\Default"  /mt /z /e
