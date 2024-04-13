# Registry Check Setter
# Version 1.0.0
# 
# Author: Daniel Keer
# Author URI: https://thedxt.ca
# Script URI: https://github.com/thedxt/Registry-Check-Setter
#
# DESCRIPTION
# checks registry settings and sets them or corrects them
#
# EXAMPLE
# reg-check-set -reg_path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -reg_name "NoAutoUpdate" -reg_type dword -reg_value "1"


#function to group it all together
function reg-check-set{
param(
[Parameter (Mandatory = $true)] [String]$reg_path,
[Parameter (Mandatory = $true)] [String]$reg_name,
#lock down the reg types to only support valid entries
[Parameter(Mandatory=$true)] [ValidateSet('Binary','DWord','ExpandString','MultiString','String','QWord')] [String]$reg_type,
[Parameter (Mandatory = $true)] [String]$reg_value
)

#function to check if the reg path exists
function reg-path{

write-host "Checking The Registry Path"

if (test-path $reg_path){

write-host "The Registry Path is Found"
#move on to the function to check the reg name
reg-name

}else{

#create everything that is needed
write-host "Registry Path NOT Found"
write-host "Creating the Registry Path and Item Name with the Value"
New-Item -Path $reg_path -force | out-null
New-ItemProperty  -Path $reg_path  -name $reg_name -value $reg_value -type $reg_type -force | out-null

}

}


#Function to check if the reg name exists
function reg-name{

write-host "Checking The Registry Item Name"

if (Get-ItemProperty -Path $reg_path -name $reg_name -ErrorAction SilentlyContinue)
{
write-host "The Registry Item Name Exists"
#move on to the function to check the reg vale
reg-value

}else{
#create everything that is needed
write-host "Regsitry Item Name does NOT exist"
write-host "Creating The Regsitry Item Name with the Value"
New-ItemProperty  -Path $reg_path  -name $reg_name -value $reg_value -type $reg_type -force | out-null
}


}

#function to check the reg value

function reg-value{

write-host "Checking The Registry Value"

if ((get-ItemPropertyValue $reg_path -name $reg_name) -eq $reg_value ) {

write-host "The Registry Value is correct"

}else{

#create everything that is needed
write-host "The Registry Value is NOT correct"
write-host "Fixing The Registry Value"

New-ItemProperty  -Path $reg_path  -name $reg_name -value $reg_value -type $reg_type -force | out-null
}


}

write-host " "
write-host "Starting the check for" $reg_path "with the name of" $reg_name "set to" $reg_type $reg_value
write-host " "
# call the first function that will call the other functions as needed
reg-path

write-host " "
write-host "All the check for" $reg_path "with the name of" $reg_name "set to" $reg_type $reg_value "are completed"

}
