Clear-Host

Set-Location $PSScriptRoot
$Leaf = Split-Path "$($PSScriptRoot)" -Leaf
Import-Module $PSScriptRoot\$Leaf.psm1

$obj = Import-IOCFromCSV ".\Test Files\valid.csv" -ColumnIndex 1

Write-Host "Printing returned object..."
Write-Output $obj
Write-Host "Object printed."