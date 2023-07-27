
#function Check-URL {
<#
      .SYNOPSIS
      Check supplied UR links
	
      .DESCRIPTION
      Check which links are valid and return a table with True/False based on validity
	
      .PARAMETER CSVFile

      .EXAMPLE
      Check-URL -CSVFile file.csv
  #>	

[cmdletbinding(
    ConfirmImpact = 'low'
)]
Param (
    [Parameter(Mandatory = $True)] 
    [string] $CSVFile
)



Write-Debug -Message "Starting the test of supplied URL addresses."
$lines = Import-Csv -Path $CSVFile -Delimiter ";"
$count = 0
$lines | ForEach-Object {
    $count++
}

$iteration = 0
$ProgressPreference = 'SilentlyContinue'

[timespan]$executionTime = Measure-Command {try{
    $iteration += 1;
    $newLines = @($lines | ForEach-Object {
        $iteration += 1;
        $url = $_.url
        
        $res = Invoke-WebRequest -Uri $url -SkipHttpErrorCheck

        @{
            url = $url
            valid = ($res.StatusCode -ne 404)
        }
    })


}
catch{
    Write-Error -Message "There has been an exception thrown during $($iteration)th iteration out of $($count) lines"
}

$newLines | ForEach-Object{
    Export-Csv -Path "./CheckURL-export.csv" -InputObject $_ -Append
}}

Write-Output -Message "The script execution time was $($executionTime.TotalMinutes) minutes"

