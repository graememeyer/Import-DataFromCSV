# Import-DataFromCSV

<#

cd $env:UserProfile\OneDrive\Desktop\code\VTAPI\
Import-Module .\Import-DataFromCSV.psm1
Import-DataFromCSV 

#>


<#
.SYNOPSIS
    Imports data from the specified CSV file. 
.DESCRIPTION
    Powershell Module to import specified data from a target CSV file.
.NOTES
    File Name : ImportDataFromCSV.ps1
    Author    : Graeme Meyer (@graememeyer)
    Version   : 0.1
.LINK
    https://github.com/graememeyer/
#>

function Import-DataFromCSV {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateScript({Test-Path $_})]
        [string]
        $FilePath,

        [Parameter(Mandatory=$false)]
        [ValidateRange(1, [int]::MaxValue)]
        [int] $ColumnIndex
    )

    Write-Host "Importing from $($FilePath)"

    # Import the CSV.
    try{ 
        $CSV = Import-Csv $FilePath
        Write-Host "Import from $($FilePath) seems to have succeeded."
    }
    catch{
        Write-Error -Exception $E -Message "Import from $FilePath failed. "
        Write-Error "$_.Exception.Message"
    }

    # Validate the CSV.

}
