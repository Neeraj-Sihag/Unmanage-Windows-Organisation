# Display script purpose, solution, and author information
Write-Host "This script removes registry keys causing the 'managed by your organization' message in settings" -ForegroundColor Cyan
Write-Host "Solution: Deletes policy-related registry keys; prompts user to restart to apply changes" -ForegroundColor Cyan
Write-Host "Author: Neeraj Sihag" -ForegroundColor Cyan
Write-Host "GitHub Profile: https://github.com/Neeraj-Sihag" -ForegroundColor Cyan
Write-Host ""

# Check if script is running as Administrator, if not, restart with admin privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Script is not running as Administrator. Restarting with elevated privileges..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

# Prompt user to confirm whether to start the script
$startResponse = Read-Host "Do you want to start the script? (Yes/No)"
if ($startResponse -ne "Yes") {
    Write-Host "Script canceled by the user." -ForegroundColor Cyan
    exit
}

# Array of registry paths to delete
$registryPaths = @(
    "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies",
    "HKCU\Software\Microsoft\WindowsSelfHost",
    "HKCU\Software\Policies",
    "HKLM\Software\Microsoft\Policies",
    "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies",
    "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate",
    "HKLM\Software\Microsoft\WindowsSelfHost",
    "HKLM\Software\Policies",
    "HKLM\Software\WOW6432Node\Microsoft\Policies",
    "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Policies",
    "HKLM\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate"
)

# Loop through and delete each registry path
foreach ($path in $registryPaths) {
    try {
        reg delete $path /f
        Write-Host "Successfully deleted: $path" -ForegroundColor Green
    }
    catch {
        Write-Host "Failed to delete: $path. It might not exist." -ForegroundColor Yellow
    }
}

# Prompt the user to restart the system
$restartResponse = Read-Host "`nAll specified registry paths processed. Would you like to restart now? (Yes/No)"

if ($restartResponse -eq "Yes") {
    Write-Host "Restarting system..." -ForegroundColor Cyan
    Restart-Computer -Force
} else {
    Write-Host "Please remember to restart the system to apply changes fully." -ForegroundColor Cyan
}
