Clear-Host

Set-Location $PSScriptRoot
$Leaf = Split-Path "$($PSScriptRoot)" -Leaf
Import-Module $PSScriptRoot\$Leaf.psm1

Import-DataFromCSV ..\Bulk-VTLookup\valid.csv -Verbose


# $Location = $PSScriptRoot
# $Command = "Set-Location $($Location); Write-Host 'Location set to: $(Get-Location)'; Write-Host ''; Start-Sleep -Seconds 30"
# $ArgumentList = "-Command $($Command);"
# Start-Process PowerShell.exe -ArgumentList $ArgumentList

# # I have no idea what I'm doing