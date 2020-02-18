# Import-DataFromCSV

<#

cd $env:UserProfile\OneDrive\Desktop\code\Import-DataFromCSV\
Import-Module .\Import-DataFromCSV.psm1
Import-DataFromCSV $env:UserProfile\OneDrive\Desktop\code\Bulk-VTLookup\valid.csv

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
        Write-Host "Import seems to have succeeded."
    }
    catch{
        Write-Error -Exception $E -Message "Import from $FilePath failed. "
        Write-Error "$_.Exception.Message"
    }

    # Validate the CSV.

    # Print 5 rows from the CSV

    Write-Verbose "Preview of imported contents:"
    for ($i=0; $i -le 3; $i++){
        Write-Verbose "$($CSV[$i])"
    }
    # Print 5 rows from column 1

}
