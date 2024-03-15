oh-my-posh init pwsh --config 'C:\Users\kevinnitro\AppData\Local\Programs\oh-my-posh\themes\hunk.omp.json' | Invoke-Expression

# zoxide
Invoke-Expression (& { (zoxide init powershell --cmd cd | Out-String) })

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

# ALIAS
Set-Alias -Name which -Value Get-Command
Set-Alias -Name v -Value nvim
Set-Alias -Name grep -Value Select-String 

# Dotfiles config
. "$env:USERPROFILE\KevinNitro-Files\Scripts\Powershell\dotfilesFunctions.ps1"

# BATTERY CHECK

function batteryCheck {
	powercfg /batteryreport
	& "$env:USERPROFILE\battery-report.html"
	Start-Sleep -Seconds 1
	Remove-Item -Path "$env:USERPROFILE\battery-report.html" -Force
}

# SPICETIFY UPDATE
function spicetifyUpdate {
	& "$env:USERPROFILE\KevinNitro-Files\Scripts\Powershell\spicetifyUpdateScript.ps1"
}

# CLEAR PSREADLINE HISTORY
function clearPSReadLineHistory {
	Get-PSReadlineOption | Select-Object -expand HistorySavePath | Remove-Item
}

# OH MY POSH UPDATE
function ohmyposhUpdate {
	winget install JanDeDobbeleer.OhMyPosh -s winget
}
