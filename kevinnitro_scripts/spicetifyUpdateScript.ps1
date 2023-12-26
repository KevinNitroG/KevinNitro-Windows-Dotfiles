# C:\Users\trann\AppData\Local\spicetify

function Update-Extension {
    param(
        [Parameter(Mandatory=$true)]
        [string]$extensionName,
        [Parameter(Mandatory=$true)]
        [string]$extensionURL
    )
    if (Test-Path "$env:LOCALAPPDATA\\spicetify\\Extensions\\$extensionName") {
        Remove-Item -Path "$env:LOCALAPPDATA\\spicetify\\Extensions\\$extensionName"
    }
    wget -O "$env:LOCALAPPDATA\\spicetify\\Extensions\\$extensionName" "$extensionURL"
}

# Update spiceify-cli

spicetify.exe update

# Update extensions

echo "Update Volume Percentage"
Update-Extension "volumePercentage.js" "https://raw.githubusercontent.com/daksh2k/Spicetify-stuff/master/Extensions/volumePercentage.js"
echo "Done updating Volume Percentage!"

echo "Update Beautiful Lyrics"
Update-Extension "beautiful-lyrics.js" "https://github.com/surfbryce/beautiful-lyrics/raw/main/dist/beautiful-lyrics.js"
echo "Done updating Beautiful Lyrics!"

# Theme update

echo "Update Themes - Catppuccin"
Remove-Item -Path "$env:LOCALAPPDATA\\spicetify\\Themes\\catppuccin" -Recurse
wget -O "$env:LOCALAPPDATA\\spicetify\\Themes\\catppuccin.zip" "https://codeload.github.com/catppuccin/spicetify/zip/refs/heads/main"
Expand-Archive -Path "$env:LOCALAPPDATA\\spicetify\\Themes\\catppuccin.zip" -DestinationPath "$env:LOCALAPPDATA\\spicetify\\Themes\\catppuccin-extracted"
Move-Item -Path "$env:LOCALAPPDATA\\spicetify\\Themes\\catppuccin-extracted\\spicetify-main\\catppuccin" -Destination "$env:LOCALAPPDATA\\spicetify\\Themes\\"
Remove-Item -Path "$env:LOCALAPPDATA\\spicetify\\Themes\\catppuccin.zip"
Remove-Item -Path "$env:LOCALAPPDATA\\spicetify\\Themes\\catppuccin-extracted" -Recurse
echo "Done updating Themes - Catppuccin!"

# SPICETIFY APPLY
spicetify.exe apply