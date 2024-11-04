@echo off
:: Display script purpose, solution, and author information
echo This script removes registry keys causing the "managed by your organization" message in settings
echo Solution: Deletes policy-related registry keys; prompts user to restart to apply changes
echo Author: Neeraj Sihag
echo GitHub Profile: https://github.com/Neeraj-Sihag
echo.

:: Check for administrator privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo This script must be run as Administrator.
    echo Restarting with elevated privileges...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

:: Prompt user to confirm whether to start the script
set /p startResponse="Do you want to start the script? (Yes/No): "
if /I not "%startResponse%"=="Yes" (
    echo Script canceled by the user.
    exit /b
)

:: Array of registry paths to delete
set registryPaths=(
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies"
    "HKCU\Software\Microsoft\WindowsSelfHost"
    "HKCU\Software\Policies"
    "HKLM\Software\Microsoft\Policies"
    "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies"
    "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate"
    "HKLM\Software\Microsoft\WindowsSelfHost"
    "HKLM\Software\Policies"
    "HKLM\Software\WOW6432Node\Microsoft\Policies"
    "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies"
    "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate"
)

:: Loop through each registry path and delete
for %%i in (%registryPaths%) do (
    reg delete %%i /f >nul 2>&1
    if %errorLevel% equ 0 (
        echo Successfully deleted: %%i
    ) else (
        echo Failed to delete: %%i. It might not exist.
    )
)

:: Prompt the user to restart the system
set /p restartResponse="All specified registry paths processed. Would you like to restart now? (Yes/No): "
if /I "%restartResponse%"=="Yes" (
    echo Restarting system...
    shutdown /r /t 0
) else (
    echo Please remember to restart the system to apply changes fully.
)
