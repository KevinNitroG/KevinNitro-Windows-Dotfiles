# KEVINNITRO WINDOWS DOTFILES

## Setup public dotfiles

-   Setup

```setupDotfiles.ps1
git init --bare $env:USERPROFILE/kevinnitro_windows_dotfiles

function df {
	git --git-dir=$env:USERPROFILE/kevinnitro_windows_dotfiles/ --work-tree=$env:USERPROFILE $args
}

df config --local core.autocrlf false

df config --local status.showUntrackedFiles no
df config --local user.name "KevinNitroG"
df config --local user.email "trannguyenthaibinh46@gmail.com"

# SSH
# df remote add origin git@github.com:KevinNitroG/KevinNitro-Windows-Dotfiles.git

# HTTPS
df remote add origin https://github.com/KevinNitroG/KevinNitro-Windows-Dotfiles.git

df push --set-upstream origin main
```

-   Restore

```restoreDotfiles.ps1
# Ignore kevinnitro_windows_dotfiles folder
Add-Content -Path .gitignore -Value "kevinnitro_windows_dotfiles"

# HTTPS Clone
git clone --bare https://github.com/KevinNitroG/KevinNitro-Windows-Dotfiles.git kevinnitro_windows_dotfiles

# SSH Clone
# git clone --bare git@github.com:KevinNitroG/KevinNitro-Windows-Dotfiles.git kevinnitro_windows_dotfiles

# Backup old dotfiles
df checkout
# If error then move those files to backup folder
mkdir -p kevinnitro_backup_old_dotfiles

function df {
	git --git-dir=$env:USERPROFILE/kevinnitro_windows_dotfiles/ --work-tree=$env:USERPROFILE $args
}

df config --local core.autocrlf false
df config --local status.showUntrackedFiles no
```

## Choco

1. Install Choco _(Powershell admin)_

```installChoco.ps1
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
```

2. Install apps

```installChocoApps.ps1
choco install putty spotify 7zip winrar internet-download-manager vscode authy-desktop warp git gpg4win javaruntime vlc nodejs python obs-studio.install parsec powershell-core powertoys sublimetext3 ultraviewer winfsp winscp -y
```

3. Patch apps mod

-   Spotify

```patchSpotX.ps1
[Net.ServicePointManager]::SecurityProtocol = 3072; iex "& { $(iwr -useb 'https://spotx-official.github.io/run.ps1') } -new_theme"
```

-   IDM:

```patchIDM.ps1
iex(irm is.gd/idm_reset)
```

-   Active Windows + Office

```activeWindowsOffice.ps1
irm https://massgrave.dev/get | iex
```

## Other apps

-   PITVN: https://docs.google.com/spreadsheets/d/e/2PACX-1vRlK-vRwPJHDaANT81EjyG4m5ZnLXdKRYfS0eKXyCzGymEfUDmKHRhxvUbtWYTfVn7MJ3E2jk7v3cGi/pubhtml#

-   VisualCppRedist AIO: https://github.com/abbodi1406/vcredist/releases/latest/download/VisualCppRedist_AIO_x86_x64.exe
-   Winrar Keygen PITVN: https://drive.google.com/file/d/16gzzhBWkthRnovMBeiKAhiDgeV2LbxjY/view
-   Itunes: https://support.apple.com/downloads/itunes
-   3U Tools: https://www.3u.com/
-   iSlide: https://islide-powerpoint.com/en/downloads-en
-   Guitarpro:
-   Keystore Explorer
-   Legacy Launcher _(Minecraft)_: https://llaun.ch/en
-   Mathtype
-   Microsoft Teams
-   Office: https://otp.landian.vip/en-us/
-   MPC - HC: https://github.com/clsid2/mpc-hc
-   qbittorrent _(qt6)_: https://github.com/c0re100/qBittorrent-Enhanced-Edition/releases/latest

-   OBS Background Removal: https://github.com/occ-ai/obs-backgroundremoval/releases/latest

## Powershell customise

-   Install

```install.ps1
# oh-my-posh
winget install JanDeDobbeleer.OhMyPosh -s winget

# PSReadline
Install-Module -Name PSReadLine -Force -SkipPublisherCheck

# Terminal icons
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
```

-   Update oh-my-posh

```updateOhMyPosh.ps1
winget install JanDeDobbeleer.OhMyPosh -s winget
```

-   PSReadLine remove history

```PSReadLineRemoveHistory.ps1
Get-PSReadlineOption | select -expand historysavepath | Remove-Item
```

## Dotfiles track shortcut files

-   Add

```ps1
df update-index --assume-unchanged [file]
```

-   Remove

```ps1
df update-index --no-assume-unchanged [file]
```

## Git stop tracking file and folder

-   File

```stopTrackingFile.ps1
df rm --cached <file>
```

-   Folder

```stopTrackingFolder.ps1
df rm -r --cached <folder>
```

## GPG Backup / Restore

<!-- -   GPG restart

```gpg_restart.ps1
gpg-connect-agent reloadagent /bye
``` -->

-   Backup

```gpg_backup.ps1
gpg -o $env:USERPROFILE/kevinnitro_gpg_key.gpg --export-options backup --export-secret-keys trannguyenthaibinh46@gmail.com
```

-   Restore

```gpg_restore.ps1
gpg --import-options restore --import .kevinnitro_files/kevinnitro_gpg_key.gpg
```

-   Setup GPG git

```setupGPGGit.ps1
# List key long
gpg --list-secret-keys --keyid-format=long

# Unset previous GPG key
git config --global --unset gpg.format

# Set new GPG key
git config --global user.signingkey 7BFAA5F4BCE07838
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey $env:USERPROFILE/.ssh/id_rsa.pub
```

## Windows Variable

https://learn.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables

## Datetime format

https://help.scribesoft.com/scribe/en/sol/general/datetime.htm
