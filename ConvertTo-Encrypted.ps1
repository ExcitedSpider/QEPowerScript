param(
  [String]$PlainFilePath,
  [String]$OutFilePath
)

function get192bitRanBySeed {
  param (
    [int32]$seed
  )
  $key192=@()
  for([int32]$i=0;$i -lt 24;$i++)
  {
    [int32]$s = [int32]$seed+[int32]$i
    $one = Get-Random -SetSeed $s -Maximum 255 -Minimum 0
    $key192+=$one
  }
  return $key192 
}

$keySeed = Read-Host 'Enter the key[INT32]'
[System.Object[]]$thekey = get192bitRanBySeed $keySeed

$Secret = Get-Content $PlainFilePath -Raw

try
{
  $Secret |
    ConvertTo-SecureString -AsPlainText -Force |
    ConvertFrom-SecureString -key $thekey |
    Out-File -FilePath $OutFilePath

  'OK, path:{0}' -f ($OutFilePath)
}
catch
{
  'error!'  
}

