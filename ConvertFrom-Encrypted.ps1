param(
  [String]$EncryptedFilePath,
  $keySeed
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

if($null -eq $keySeed)
{
  $keySeed = Read-Host 'Enter the key[INT32]'
}
$thekey = get192bitRanBySeed $keySeed


try
{
  $SecurePassword = Get-Content -Path $EncryptedFilePath -Raw|
  ConvertTo-SecureString -Key $thekey -ErrorAction Stop
}
catch
{
  'Wrong Key!'
  return
}

$BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
$UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

$UnsecurePassword