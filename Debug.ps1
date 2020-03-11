Clear-Host

Set-Location $PSScriptRoot
$ProjectFolderName = Split-Path "$($PSScriptRoot)" -Leaf # Extract the folder name to use as a file-import name.
Import-Module $PSScriptRoot\$ProjectFolderName.psm1 # Import $ProjectFolderName.psm1 

Write-Host "Launching the module..."

$obj = Import-IOCFromCSV ".\Test Files\valid.csv" -ColumnIndex 1

Write-Host "Printing returned object..."
Write-Output $obj
Write-Host "Object printed."