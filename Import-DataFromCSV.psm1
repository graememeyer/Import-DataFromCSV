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
    File Name : Import-DataFromCSV.ps1
    Author    : Graeme Meyer (@graememeyer)
    Version   : 0.2
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
        [ValidateRange(0, [int]::MaxValue)]
        [int] $ColumnIndex = 0, 

        [Parameter(Mandatory=$false)]
        [string] $IOCType
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

    # Print 5 rows from the CSV
    Write-Verbose "Preview of imported contents:"
    for ($i=0; $i -le 3; $i++){
        Write-Verbose "$($CSV[$i])"
    }
    
    # Print 5 rows from column 1
    $Columns = $CSV[0].psobject.properties.name
    Write-Verbose "Preview of column $($ColumnIndex) contents:"
    for ($i=0; $i -le 3; $i++){
        Write-Verbose "$($CSV[$i].$($Columns[$ColumnIndex -1]))"
    }

    # TODO
    # If a column number isn't submitted, scan columns for valid IOCs and set to the first column that contains 5 valid IOCs in a row. 


    # Extract the IOCs to an object array and return it
    $Column = $CSV.$($Columns[$ColumnIndex]) 
    $Column
    # for ($i=1; $i -le $CSV.count; $i++){
    #     Write-Verbose "IOC $($i): $($CSV[$i - 1].$($Columns[$ColumnIndex -1]))"
    #     [int]$PC = $i / $CSV.count * 100
    #     Write-Progress -Activity "Importing IOCs..." -status "$($pc) complete." -PercentComplete $PC
    # }

}

function Validate-SHA256
{}


Clear-Host

