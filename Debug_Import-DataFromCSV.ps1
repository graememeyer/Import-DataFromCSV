Clear-Host

Set-Location $PSScriptRoot
$Leaf = Split-Path "$($PSScriptRoot)" -Leaf
Import-Module $PSScriptRoot\$Leaf.psm1


$Location = Get-Location
$Command = "Set-Location $($Location); Write-Host 'Location set to: $(Get-Location)'; Write-Host ''; Read-Host"
$ArgumentList = "-Command $($Command);"
Start-Process PowerShell.exe -ArgumentList $ArgumentList

# I have no idea what I'm doing