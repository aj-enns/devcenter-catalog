# Install Oh My Posh using WinGet
# This script runs in system context during Dev Box provisioning

# Install via WinGet (available on Dev Box base images)
winget install --id JanDeDobbeleer.OhMyPosh -e --source winget --accept-source-agreements --accept-package-agreements

# Optionally place a starter theme and update PowerShell profile for all users
$AllUsersProfile = "$Env:ProgramData\oh-my-posh"
New-Item -ItemType Directory -Force -Path $AllUsersProfile | Out-Null
$ThemePath = Join-Path $AllUsersProfile "amro.omp.json"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/amro.omp.json" -OutFile $ThemePath

$ProfileDir = "C:\Program Files\PowerShell\7\"
$ProfileAll = Join-Path $ProfileDir "profile.ps1"
if (!(Test-Path $ProfileAll)) { New-Item -ItemType File -Force -Path $ProfileAll | Out-Null }
Add-Content -Path $ProfileAll -Value 'oh-my-posh init pwsh --config "C:\ProgramData\oh-my-posh\amro.omp.json" | Invoke-Expression'
