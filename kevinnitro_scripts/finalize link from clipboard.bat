@echo off
setlocal EnableDelayedExpansion

@REM script is generated by ChatGPT: https://chat.openai.com/share/f008aa0f-a803-4255-9e49-f670721877d7

:: Get the value from the clipboard
for /f "tokens=*" %%a in ('powershell -command "Get-Clipboard"') do set "clipboard_value=%%a"

:: Remove unwanted characters
set "modified_value=!clipboard_value: =!"
set "modified_value=!modified_value:(=!"
set "modified_value=!modified_value:)=!"
set "modified_value=!modified_value:[=!"
set "modified_value=!modified_value:]=!"
set "modified_value=!modified_value:{=!"
set "modified_value=!modified_value:}=!"
set "modified_value=!modified_value:<=!"
set "modified_value=!modified_value:>=!"
set "modified_value=!modified_value:,=!"
set "modified_value=!modified_value:\*=!"
set "modified_value=!modified_value:`=!"
set "modified_value=!modified_value:\~=!"

:: Copy the modified value back to the clipboard
echo !modified_value!| clip

:: Display the modified value
echo Modified value: !modified_value!

endlocal