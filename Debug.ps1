Clear-Host

Set-Location $PSScriptRoot
$Leaf = Split-Path "$($PSScriptRoot)" -Leaf
Import-Module $PSScriptRoot\$Leaf.psm1

$obj = Import-IOCFromCSV ..\Bulk-VTLookup\valid.csv -ColumnIndex 1
Write-Host "Before object print..."
Write-Output $obj
Write-Host "After object print..."