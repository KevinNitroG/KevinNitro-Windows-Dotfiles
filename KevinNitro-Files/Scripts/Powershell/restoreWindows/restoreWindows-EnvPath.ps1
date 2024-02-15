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
	"D:\My Apps\ENV Tools\wget",
	"D:\My Apps\ENV Tools\OpenSSL-Win64\bin",
	"D:\My Apps\ENV Tools\adb",
	"D:\My Apps\ENV Tools\WhoIs",
	"D:\My Apps\ENV Tools\Solution Merge",
	"D:\My Apps\ENV Tools\ViVeTool",
	"D:\My Apps\ENV Tools\MinGW x64\bin",
	"D:\My Apps\ENV Tools\gh\bin",
	"D:\My Apps\ENV Tools\vcpkg",
	"D:\My Apps\ENV Tools\fastfetch",
	"D:\My Apps\ENV Tools\goodbyedpi"
)

# Join paths with a newline character
$newPathsString = $newPaths -join ";"

# Set the updated Path variable (User)
[System.Environment]::SetEnvironmentVariable("Path", "$currentPath;$newPathsString", [System.EnvironmentVariableTarget]::User)


# ENV

# Cargo
setx /M CARGO_HOME "E:\packages\cargo"

# NPM config cache
setx /M npm_config_cache "E:\cache\npm"

# Python Pip cache
setx /M PIP_CACHE_DIR "E:\cache\pip"

# VCPKG binary cache
setx /M VCPKG_BINARY_CACHE "E:\packages\vcpkg"