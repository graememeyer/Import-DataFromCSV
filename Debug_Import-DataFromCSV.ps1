Clear-Host

Set-Location $PSScriptRoot
$Leaf = Split-Path "$($PSScriptRoot)" -Leaf
Import-Module $PSScriptRoot\$Leaf.psm1

$obj = Import-DataFromCSV ..\Bulk-VTLookup\valid.csv -ColumnIndex 2
Write-Host "Derp"
Write-Output $obj


# $Location = $PSScriptRoot
# $Command = "Set-Location $($Location); Write-Host 'Location set to: $(Get-Location)'; Write-Host ''; Start-Sleep -Seconds 30"
# $ArgumentList = "-Command $($Command);"
# Start-Process PowerShell.exe -ArgumentList $ArgumentList

# # I have no idea what I'm doing