oh-my-posh init pwsh --config 'C:\Users\trann\AppData\Local\Programs\oh-my-posh\themes\hunk.omp.json'| Invoke-Expression

import-module PsReadLine
# Import-Module -Name Terminal-Icons
Import-Module -Name posh-wakatime
Import-Module -Name posh-git

# PSReadLine config
Set-PSReadLineKeyHandler -Chord Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineOption -EditMode Windows

# Dotfiles config
function df {
	git --git-dir=$env:USERPROFILE/kevinnitro_windows_dotfiles/ --work-tree=$env:USERPROFILE $args
}

function dfs {
	df pull
	df add -u
	df commit -m "Update Windows Dotfiles at $(Get-Date -Format 'h:mm tt on d/M/y')"
	df push
}

function dfa {
	df add $args
}

# Private dotfiles config
function pdf {
	git --git-dir=$env:USERPROFILE/kevinnitro_private_windows_dotfiles/ --work-tree=$env:USERPROFILE $args
}

function pdfs {
	pdf pull
	pdf add -u
	pdf commit -m "Update Private Windows Dotfiles at $(Get-Date -Format 'h:mm tt on d/M/y')"
	pdf push
}

function pdfa {
	pdf add $args
}

# ALL DOTFILES

# Sync all Public & Private dotfiles
# All Dot Files Sync
function adfs {
	dfs
	pdfs
}

# BATTERY CHECK

function batteryCheck {
	powercfg /batteryreport
	& "$env:USERPROFILE\battery-report.html"
	Start-Sleep -Seconds 1
	Remove-Item -Path "$env:USERPROFILE\battery-report.html" -Force
}

# SPICETIFY UPDATE
function spicetifyUpdate {
	& "$env:USERPROFILE\kevinnitro_scripts\spicetifyUpdateScript.ps1"
}

# CLEAR PSREADLINE HISTORY
function clearPSReadLineHistory {
	Get-PSReadlineOption | select -expand historysavepath | Remove-Item
}