param([string]$dir)

if(-not(Test-Path $dir))
{
  'Usage: Get-Dirlength <dirname>'
  return
}

'please wait...'
$length=0
Get-ChildItem $dir -Recurse | ForEach-Object {
  if(-not $_.PSIsContainer)
  {
  $length+=$_.Length
  }
}

'The length of {0}: ' -f ($dir) | Write-Host -NoNewline
if($length -lt 1MB){
  '{0:N2}KB' -f ($length)
}elseif ($length -lt 1GB) {
  '{0:N2}MB' -f ($length/1MB)
}else
{
  '{0:N2}}GB' -f ($length/1GB)
}
