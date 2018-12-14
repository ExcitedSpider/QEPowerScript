param([string]$dir)

if(-not(Test-Path $dir))
{
  'Usage: Get-Dirlength <dirname>'
  return
}

$length=0
Get-ChildItem $dir -Recurse | ForEach-Object {
  if(-not $_.PSIsContainer)
  {
  $length+=$_.Length
  }
}
'please wait...'
'The length: ' | Write-Host -NoNewline
if($length -lt 1MB){
  '{0}KB' -f ($length)
}elseif ($length -lt 1GB) {
  '{0}MB' -f ($length/1MB)
}else
{
  '{0}GB' -f ($length/1GB)
}
