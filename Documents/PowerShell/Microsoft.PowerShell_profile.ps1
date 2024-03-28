oh-my-posh init pwsh --config 'C:\Users\kevinnitro\AppData\Local\Programs\oh-my-posh\themes\hunk.omp.json' | Invoke-Expression

# zoxide
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

# Set Aliases
Set-Alias -Name ss -Value Select-String

import-module PsReadLine
# Import-Module -Name Terminal-Icons
Import-Module -Name posh-wakatime
Import-Module -Name posh-git
Import-Module -Name "$env:USERPROFILE\KevinNitro-Files\posh-wakatime\posh-wakatime.psm1"

# PSReadLine config
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineOption -EditMode Windows
Set-PSReadlineKeyHandler -Key Ctrl-P -Function PreviousSuggestion
Set-PSReadlineKeyHandler -Key Ctrl-N -Function NextSuggestion

# Dotfiles config
. "$env:USERPROFILE\KevinNitro-Files\Scripts\Powershell\dotfilesFunctions.ps1"

# BATTERY CHECK

function Check-Battery
{
    Set-Location
    powercfg /batteryreport
    & "$env:USERPROFILE\battery-report.html"
    Start-Sleep -Seconds 1
    Remove-Item -Path "$env:USERPROFILE\battery-report.html" -Force
}

# SPICETIFY UPDATE
function Update-Spicetify
{
    & "$env:USERPROFILE\KevinNitro-Files\Scripts\Powershell\spicetifyUpdateScript.ps1"
}

# CLEAR PSREADLINE HISTORY
function Clear-PSReadLineHistory
{
    Get-PSReadlineOption | Select-Object -expand HistorySavePath | Remove-Item
}

# OH MY POSH UPDATE
function Update-OhMyPosh
{
    winget install JanDeDobbeleer.OhMyPosh -s winget
}

function Check-WifiPassWord()
{
    param(
        [string]$name = $null
    )
    if (-not $name)
    {
        "LIST OF SAVED WIFI"
        "`n---`n"
        # Get the list of saved Wi-Fi networks with position numbers
        $wifiList = netsh wlan show profiles |
            Select-String -Pattern "All User Profile\s+:\s+(.*)" |
            ForEach-Object { $_.Matches.Groups[1].Value }

        # Output the list with position numbers
        for ($i=0; $i -lt $wifiList.Count; $i++)
        {
            # "$($i+1): $($wifiList[$i])"
            "{0,5}: {1}" -f ($i+1), $wifiList[$i]
        }
        "`n---`n"
        $inputPosition = Read-Host "Enter the position number of the Wi-Fi network to check the password (Enter for current network)"
        if ([string]::IsNullOrEmpty($inputPosition))
        {
            $currentWifi = ((netsh wlan show interfaces | Select-String -Pattern "SSID" -Context 0,1) -split ":")[1].Trim()
            $name = $currentWifi -replace "SSID\s+:\s+", ""
        } else
        {
            # Convert the input position to zero-based index
            $index = [int]$inputPosition - 1
            if ($index -ge 0 -and $index -lt $wifiList.Count)
            {
                $name = $wifiList[$index]
            } else
            {
                Write-Host "Invalid position number."
                return
            }
        }
    }
    $profile = netsh wlan show profile name="$name" key=clear
    $password = $profile | Select-String -Pattern "Key Content\s+:\s+(.+)" | ForEach-Object { $_.Matches.Groups[1].Value }
    if ($password)
    {
        "Password for Wi-Fi network: $name"
        "$password"
    } else
    {
        "No password is required for Wi-Fi network: $name"
    }
}

# LINUX LIKE COMMANDS FOR WINDOWS- FROM https://github.com/ChrisTitusTech/powershell-profile/

# If so and the current host is a command line, then change to red color 
# as warning to user that they are operating in an elevated context
# Useful shortcuts for traversing directories
function cd...
{ Set-Location ..\.. 
}
function cd....
{ Set-Location ..\..\.. 
}

# Compute file hashes - useful for checking successful downloads 
function md5
{ Get-FileHash -Algorithm MD5 $args 
}
function sha1
{ Get-FileHash -Algorithm SHA1 $args 
}
function sha256
{ Get-FileHash -Algorithm SHA256 $args 
}

# Quick shortcut to start notepad
function n
{ notepad $args 
}

# Drive shortcuts
function HKLM:
{ Set-Location HKLM: 
}
function HKCU:
{ Set-Location HKCU: 
}
function Env:
{ Set-Location Env: 
}

# Does the the rough equivalent of dir /s /b. For example, dirs *.png is dir /s /b *.png
function dirs
{
    if ($args.Count -gt 0)
    {
        Get-ChildItem -Recurse -Include "$args" | Foreach-Object FullName
    } else
    {
        Get-ChildItem -Recurse | Foreach-Object FullName
    }
}

# Simple function to start a new elevated process. If arguments are supplied then 
# a single command is started with admin rights; if not then a new admin instance
# of PowerShell is started.
function admin
{
    if ($args.Count -gt 0)
    {   
        $argList = "& '" + $args + "'"
        Start-Process "$psHome\powershell.exe" -Verb runAs -ArgumentList $argList
    } else
    {
        Start-Process "$psHome\powershell.exe" -Verb runAs
    }
}

# Set UNIX-like aliases for the admin command, so sudo <command> will run the command
# with elevated rights. 
Set-Alias -Name su -Value admin
Set-Alias -Name sudo -Value admin

Function Test-CommandExists
{
    Param ($command)
    $oldPreference = $ErrorActionPreference
    $ErrorActionPreference = 'SilentlyContinue'
    try
    { if (Get-Command $command)
        { RETURN $true 
        } 
    } Catch
    { Write-Host "$command does not exist"; RETURN $false 
    } Finally
    { $ErrorActionPreference = $oldPreference 
    }
} 
#
# Aliases
#
# If your favorite editor is not here, add an elseif and ensure that the directory it is installed in exists in your $env:Path
#
if (Test-CommandExists nvim)
{
    $EDITOR='nvim'
} elseif (Test-CommandExists code)
{
    $EDITOR='code'
} elseif (Test-CommandExists notepad)
{
    $EDITOR='notepad'
} elseif (Test-CommandExists pvim)
{
    $EDITOR='pvim'
} elseif (Test-CommandExists vim)
{
    $EDITOR='vim'
} elseif (Test-CommandExists vi)
{
    $EDITOR='vi'
} elseif (Test-CommandExists notepad++)
{
    $EDITOR='notepad++'
} elseif (Test-CommandExists sublime_text)
{
    $EDITOR='sublime_text'
}
Set-Alias -Name v -Value $EDITOR

# Make it easy to edit this profile once it's installed
function Edit-Profile
{
    if ($host.Name -match "ise")
    {
        # $psISE.CurrentPowerShellTab.Files.Add($profile.CurrentUserAllHosts)
        $psISE.CurrentPowerShellTab.Files.Add($profile)
    } else
    {
        # notepad $profile.CurrentUserAllHosts
        v $profile
    }
}

function ll
{ Get-ChildItem -Path $pwd -File 
}

function Get-PubIP
{
    (Invoke-WebRequest http://ifconfig.me/ip ).Content
}
function uptime
{
    #Windows Powershell only
    If ($PSVersionTable.PSVersion.Major -eq 5 )
    {
        Get-WmiObject win32_operatingsystem |
            Select-Object @{EXPRESSION={ $_.ConverttoDateTime($_.lastbootuptime)}} | Format-Table -HideTableHeaders
    } Else
    {
        net statistics workstation | Select-String "since" | foreach-object {$_.ToString().Replace('Statistics since ', '')}
    }
}

function Reload-Profile
{
    & $profile
}
function find-file($name)
{
    Get-ChildItem -recurse -filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
        $place_path = $_.directory
        Write-Output "${place_path}\${_}"
    }
}
function unzip ($file)
{
    Write-Output("Extracting", $file, "to", $pwd)
    $fullFile = Get-ChildItem -Path $pwd -Filter .\cove.zip | ForEach-Object { $_.FullName }
    Expand-Archive -Path $fullFile -DestinationPath $pwd
}
function ix ($file)
{
    curl.exe -F "f:1=@$file" ix.io
}
function grep($regex, $dir)
{
    if ( $dir )
    {
        Get-ChildItem $dir | select-string $regex
        return
    }
    $input | select-string $regex
}
function touch($file)
{
    "" | Out-File $file -Encoding ASCII
}
# function df {
#     get-volume
# }
function sed($file, $find, $replace)
{
    (Get-Content $file).replace("$find", $replace) | Set-Content $file
}
# function which($name) {
#     Get-Command $name | Select-Object -ExpandProperty Definition
# }
function export($name, $value)
{
    set-item -force -path "env:$name" -value $value;
}
function pkill($name)
{
    Get-Process $name -ErrorAction SilentlyContinue | Stop-Process
}
function pgrep($name)
{
    Get-Process $name
}

# Powwershell profile from https://github.com/craftzdog/dotfiles-public/blob/master/.config/powershell/user_profile.ps1

[console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

function which ($command)
{
    Get-Command -Name $command -ErrorAction SilentlyContinue |
        Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue
}
