
<#
.SYNOPSIS
    Imports Indicators of Compromise (IOCs) from a specified CSV file. 
.DESCRIPTION
    Powershell Module to import Indicators of Compromise (IOCs) from a target CSV file.
.NOTES
    File Name : Import-IOCFromCSV.ps1
    Author    : Graeme Meyer (@graememeyer)
    Version   : 1.0
.LINK
    https://github.com/graememeyer/Import-IOCFromCSV
#>

function Import-IOCFromCSV {
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
        $Columns = $CSV[0].psobject.properties.name
        Write-Host "Import seems to have succeeded."
    }
    catch{
        Write-Error -Exception $E -Message "Import from $FilePath failed. "
        Write-Error "$_.Exception.Message"
    }

    if($PSCmdlet.MyInvocation.BoundParameters["Verbose"].IsPresent)
    {
        # Print 5 rows from the CSV
        Write-Verbose "Preview of imported contents:"
        for ($i=0; $i -le 3; $i++){
            Write-Verbose "$($CSV[$i])"
        }
        
        # Print 5 rows from column 1
        Write-Verbose "Preview of column $($ColumnIndex) contents:"
        for ($i=0; $i -le 3; $i++){
            Write-Verbose "$($CSV[$i].$($Columns[$ColumnIndex -1]))"
        }
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