# INSTALL POWERSHELL MODULES

Install-Module -Name PSReadLine -Force -SkipPublisherCheck
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name posh-wakatime -Force
Install-Module posh-git -Force

choco install winget-cli `
    zoxide `
    fzf `
    putty `
    spotify `
    spicetify-cli `
    spicetify-marketplace `
    7zip `
    winrar `
    internet-download-manager `
    vscode `
    authy-desktop `
    warp `
    javaruntime `
    vlc `
    nodejs `
    python `
    obs-studio.install `
    parsec `
    powertoys `
    sublimetext3 `
    ultraviewer `
    winfsp `
    winscp `
    docker-desktop `
    neovim `
    itunes `
    -y

# INSTALL OH-MY-POSH

winget install JanDeDobbeleer.OhMyPosh -s winget