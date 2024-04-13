![image](https://github.com/thedxt/Registry-Check-Setter/assets/4249262/bdad9c55-e007-4aa8-92b7-b303fbe645f3)

# Registry Check Setter
A PowerShell script to check registry settings and set them if they don't exist or correct them if they do exist.

- If the registry key path doesn't exist it will create it and all the settings
- If the registry key path does exist it will move on to check if the registry value name exists
- If the registry value name doesn't exist it will create it with the needed settings
- If the registry value name exists it will check if the registry value is correct
- If the registry value is correct it exists
- If the registry value is not correct it corrects it and exists.

- Depending on the Registry setting you are checking or settings you may need to run as an admin or system

> [!IMPORTANT]
> The `-reg_type` must be defined the only valid options are `Binary`, `DWord`, `ExpandString`, `MultiString`, `String`, and `QWord`

[More detailed documentation](https://thedxt.ca/2024/04/registry-check-setter/)


> [!TIP]
> ## Examples
> 
> `reg-check-set -reg_path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -reg_name "TargetReleaseVersion" -reg_type dword -reg_value "1"`
>
> `reg-check-set -reg_path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -reg_name "TargetReleaseVersionInfo" -reg_type string -reg_value "22H2"`
>
> `reg-check-set -reg_path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -reg_name "ProductVersion" -reg_type string -reg_value "Windows 10"`
>
> `reg-check-set -reg_path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -reg_name "NoAutoUpdate" -reg_type dword -reg_value "1"`

