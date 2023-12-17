# KEVINNITRO WINDOWS DOTFILES

## SETUP PUBLIC WINDOWS DOTFILES

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

## SETUP PRIVATE WINDOWS DOTFILES

-   Setup

```setupDotfiles.ps1
git init --bare $env:USERPROFILE/kevinnitro_private_windows_dotfiles

function pdf {
	git --git-dir=$env:USERPROFILE/kevinnitro_private_windows_dotfiles/ --work-tree=$env:USERPROFILE $args
}

pdf config --local core.autocrlf false

pdf config --local status.showUntrackedFiles no
pdf config --local user.name "KevinNitroG"
pdf config --local user.email "trannguyenthaibinh46@gmail.com"

# SSH
# pdf remote add origin git@github.com:KevinNitroG/KevinNitro-Private-Windows-Dotfiles.git

# HTTPS
pdf remote add origin https://github.com/KevinNitroG/KevinNitro-Private-Windows-Dotfiles.git

pdf push --set-upstream origin main
```

-   Restore

```restoreDotfiles.ps1
# Ignore kevinnitro_private_windows_dotfiles folder
Add-Content -Path .gitignore -Value "kevinnitro_private_windows_dotfiles"

# HTTPS Clone
git clone --bare https://github.com/KevinNitroG/KevinNitro-Private-Windows-Dotfiles.git kevinnitro_private_windows_dotfiles

# SSH Clone
# git clone --bare git@github.com:KevinNitroG/KevinNitro-Private-Windows-Dotfiles.git kevinnitro_private_windows_dotfiles

# Backup old dotfiles
pdf checkout
# If error then move those files to backup folder
mkdir -p kevinnitro_backup_old_private_dotfiles

function pdf {
	git --git-dir=$env:USERPROFILE/kevinnitro_private_windows_dotfiles/ --work-tree=$env:USERPROFILE $args
}

pdf config --local core.autocrlf false
pdf config --local status.showUntrackedFiles no
```

## CHOCO

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

## OTHER APPS

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

-   Wakatime for Office
    -   https://github.com/wakatime/office-wakatime/releases/download/latest/ExcelSetup.zip
    -   https://github.com/wakatime/office-wakatime/releases/download/latest/PowerPointSetup.zip
    -   https://github.com/wakatime/office-wakatime/releases/download/latest/WordSetup.zip

## POWERSHELL CUSTOMISE

-   Install

```install.ps1
# oh-my-posh
winget install JanDeDobbeleer.OhMyPosh -s winget

# PSReadline
Install-Module -Name PSReadLine -Force -SkipPublisherCheck

# Terminal icons
Install-Module -Name Terminal-Icons -Repository PSGallery -Force

# Wakatime
Install-Module -Name posh-wakatime -Force

# Posh git
Install-Module posh-git -Force
```

-   Update oh-my-posh

```updateOhMyPosh.ps1
winget install JanDeDobbeleer.OhMyPosh -s winget
```

-   PSReadLine remove history

```PSReadLineRemoveHistory.ps1
Get-PSReadlineOption | select -expand historysavepath | Remove-Item
```

-   List all modules installed in Powershell

```getModule.ps1
Get-Module -ListAvailable
```

## DOTFILES TRACK SHORTCUT FILES

-   Add

```ps1
df update-index --assume-unchanged [file]
```

-   Remove

```ps1
df update-index --no-assume-unchanged [file]
```

## GIT COMMAND

-   Stop tracking file

```stopTrackingFile.ps1
df rm --cached <file>
```

-   Stop tracking folder

```stopTrackingFolder.ps1
df rm -r --cached <folder>
```

-   List all tracked files

```listAllTrackedFiles.ps1
df ls-tree --full-tree --name-only -r HEAD
```

## GPG BACKUP / RESTORE

<!-- -   GPG restart

```gpg_restart.ps1
gpg-connect-agent reloadagent /bye
``` -->

-   GPG Public Key (`7BFAA5F4BCE07838`)

```
-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=rtqw
-----END PGP PUBLIC KEY BLOCK-----
```

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

# Get public GPG Key
gpg --armor --export 7BFAA5F4BCE07838

# Unset previous GPG key
git config --global --unset gpg.format

# Set new GPG key
git config --global user.signingkey 7BFAA5F4BCE07838
git config --global commit.gpgsign true
git config --global gpg.format ssh
git config --global user.signingkey $env:USERPROFILE/.ssh/id_rsa.pub
```

## SSH Key

-   Show Public SSH Key

```showPublicSSHKey.ps1
# Show Public SSH Key
type ~\.ssh\id_rsa.pub
```

-   Public SSH Key

```
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDap/5GnLxYYNJ2QB1rYRgXyHLQud0L3Y6sfiPL6iAdqZRm+f+006DeZtJ4oP2IN8oS6nF6tfWhCaQ91jv3fZWO+olhyBZulSGbb75WdcqLcctfDwc9er+BZZZMBsF0inEbCgHEooo5kelkuuPIEUmeqn9ozUtQ4A6mLIurjsGfy2nD2bCjYys3UxUa09xEiQxvgHnlvSPCh9XvG1h4eX611GI6EbtJoOvzFPYzaxdNosbombq1HMnNGXk3TMS9fghE1GjnMiBbrortGn6mT0aNi//N9Wgr9AYR0dY2BWk1CZXF78G4MWZoaLOLW5sriMjU881UbfmJx6MmvMAEHDrfJDIQAIoRsjAJbw00SoZjspEg3R8f8ekNjduzikG65noMJGd+jTD7MtBDe+YNCuZp6UQAPwbPQLtlbKOysEWzPupKMHIsPkzUJpdYp1ML1ljV/q+FLRKje4FvWUKTk8KekWxp2tUyn5gWUIrG7DGkE5MKpBp0njFJ17n8H81xQJs= trannguyenthaibinh46@gmail.com
```

## SET WINDOWS ENVIRONMENT VARIABLE & PATH _(ADMIN)_

-   Set env variable

```setWindowsEnvVariable.ps1
# Cargo
setx /M CARGO_HOME "E:\packages\cargo"

# NPM config cache
setx /M npm_config_cache "E:\cache\npm"

# Python Pip cache
setx /M PIP_CACHE_DIR "E:\cache\pip"

# VCPKG binary cache
setx /M VCPKG_BINARY_CACHE "E:\packages\vcpkg"
```

-   Set path

```setWindowsPath.ps1
# Get the current value of the Path variable (User)
$currentPath = [System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)

# Define multiple paths as an array
$newPaths = @(
	"D:\My Apps\ENV Tools\Java 8\bin",
	"D:\My Apps\ENV Tools\NodeJS\",
    "D:\My Apps\ENV Tools\OCI CLI\bin",
    "D:\My Apps\ENV Tools\ffmpeg\bin",
    "D:\My Apps\ENV Tools\yt-dlp",
	"D:\My Apps\ENV Tools\SilentCMD",
	"D:\My Apps\Other Softwares\Rclone",
	"D:\My Apps\ENV Tools\Koyeb CLI",
	"D:\My Apps\ENV Tools\wget-1.21.4-win64",
	"D:\My Apps\ENV Tools\OpenSSL-Win64\bin",
	"D:\My Apps\ENV Tools\adb",
	"D:\My Apps\ENV Tools\WhoIs",
	"D:\My Apps\ENV Tools\Solution Merge",
	"D:\My Apps\ENV Tools\ViVeTool",
	"D:\My Apps\ENV Tools\MinGW x64\bin",
	"D:\My Apps\ENV Tools\gh_2.38.0_windows_386\bin",
	"D:\My Apps\ENV Tools\vcpkg"
)

# Join paths with a newline character
$newPathsString = $newPaths -join "`n"

# Set the updated Path variable (User)
[System.Environment]::SetEnvironmentVariable("Path", "$currentPath;$newPaths", [System.EnvironmentVariableTarget]::User)

```

-   View current path

```
# System path
[System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)

# User path
[System.Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::User)
```

## WINDOWS VARIABLE

https://learn.microsoft.com/en-us/windows/deployment/usmt/usmt-recognized-environment-variables

-   `%USERPROFILE%`: C:\Users\KevinNitro
-   `%HOMEPATH%`: \Users\KevinNitro
-   `%APPDATA%`: C:\Users\KevinNitro\AppData\Roaming
-   `%LOCALAPPDATA%`: C:\Users\KevinNitro\AppData\Local
-   `%PROGRAMDATA%`: C:\ProgramData
-   `%PROGRAMFILES%`: C:\Program Files
-   `%PROGRAMFILES(X86)%`: C:\Program Files (x86)
-   `%SYSTEMROOT%`: C:\Windows
-   `%TEMP%` & `%TMP%`: C:\Users\KevinNitro\AppData\Local\Temp
-   `%WINDIR%`: C:\Windows
-   `%USERDOMAIN%`: DESKTOP-7QJ8Q7V
-   `%USERNAME%`: KevinNitro
-   `%HOMEDRIVE%`: C:

## DATETIME FORMAT

https://help.scribesoft.com/scribe/en/sol/general/datetime.htm
