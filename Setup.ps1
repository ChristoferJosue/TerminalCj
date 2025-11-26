Write-Host "Instalando Oh My Posh..."
winget install JanDeDobbeleer.OhMyPosh --source winget

Write-Host "Elige la fuente "
oh-my-posh font install 

Write-Host "Instalando Terminal Icons..."
Install-Module -Name Terminal-Icons -Repository PSGallery 

$profileFile = $PROFILE

# Limpiar archivo si ya existe, si no crear uno nuevo
if (Test-Path $profileFile) {
    Clear-Content $profileFile
} else {
    New-Item -Path $profileFile -ItemType File -Force | Out-Null
}

Write-Host "Agregando configuración al perfil..."

Add-Content $profileFile 'oh-my-posh init pwsh --config "https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/atomic.omp.json" | Invoke-Expression'
Add-Content $profileFile 'Import-Module Terminal-Icons'
Add-Content $profileFile 'Set-PSReadLineOption -PredictionViewStyle ListView'


Write-Host "Recuerda cambiar la fuente en la configuracion de powershell"


Write-Host "Configuración completada."

