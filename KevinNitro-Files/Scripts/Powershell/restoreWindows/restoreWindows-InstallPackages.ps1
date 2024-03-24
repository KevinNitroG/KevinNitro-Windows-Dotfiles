# INSTALL POWERSHELL MODULES

Install-Module -Name PSReadLine -Force -SkipPublisherCheck
Install-Module -Name Terminal-Icons -Repository PSGallery -Force
Install-Module -Name posh-wakatime -Force
Install-Module posh-git -Force

choco install `
# NECESSARY
    winget-cli `
    wget `
    winrar `
    7zip `
    internet-download-manager `
    openssl `
# CODE EDITOR / IDE
    neovim `
    vscode `
    sublimetext3 `
# ENVIRONMENT, LANGUAGE
    llvm `
    mingw `
    gnuwin32-coreutils.install `
    nodejs `
    python `
    javaruntime `
    rust `
# APPS
    powertoys `
    warp `
    vlc `
    spotify `
    # spicetify-cli `
    # spicetify-marketplace `
    # authy-desktop `
    obs-studio.install `
    anydesk `
    parsec `
# OTHER APPS
    ultraviewer `
    putty `
    winfsp `
    winscp `
    docker-desktop `
    itunes `
# OTHER TOOLS
    winfetch `
    ffmpeg `
    yt-dlp `
    zoxide `
    fzf `
    ripgrep `
    fd `
    whois `
    adb `
    gh `
    vivetool `
    lazygit `
    -y

# INSTALL OH-MY-POSH

winget install JanDeDobbeleer.OhMyPosh -s winget
