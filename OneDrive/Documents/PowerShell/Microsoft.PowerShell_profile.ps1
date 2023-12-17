oh-my-posh init pwsh --config 'C:\Users\trann\AppData\Local\Programs\oh-my-posh\themes\hunk.omp.json'| Invoke-Expression

# import-module PsReadLine
Import-Module -Name Terminal-Icons

Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Key Tab -Function Complete
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle ListView

# Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineOption -EditMode Windows

# Ctrl Arrow to left right
# Set-PSReadLineKeyHandler -Chord Ctrl+LeftArrow BackwardWord
# Set-PSReadLineKeyHandler -Chord Ctrl+RightArrow ForwardWord

# Find-Module Az.Tools.Predictor -AllowPrerelease
# cls

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

function pdf {
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
