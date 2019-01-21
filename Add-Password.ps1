param(
  [Parameter(Mandatory=$true)]
  $psdfile,
  $description,
  $account,
  $password,
  $email
)

$psdTable = .\Get-Password.ps1 $psdfile

$newline=New-Object PSCustomObject -Property @{
  description = $description
  account = $account
  password = $password
  email = $email
}

$psdTable+=$newline

$psdTable | Convertto-Csv | Out-File temp.csv
ConvertTo-Encrypted temp.csv $psdfile
