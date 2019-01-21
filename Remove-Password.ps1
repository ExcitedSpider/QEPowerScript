param(
  [Parameter(Mandatory=$true)]
  $psdfile,
  [Parameter(Mandatory=$true)]
  $description
)

$table| where {$_.description -ne $description} | Export-Csv .\temp.csv
ConvertTo-Encrypted.ps1 .\temp.csv $psdfile