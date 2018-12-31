param(
  [Parameter(Mandatory=$true)]
  [string]$notePath
)

$pattern = "<div class='noteText'>.*</h3>"

$content = Get-Content $notePath -Raw -Encoding UTF8
$matchStr=($content | Select-String -Pattern $pattern -AllMatches ).Matches

try{
$rawNote=New-Item -Path ("{0}-笔记.md" -f $notePath)
"# 导出笔记" -f $notePath | Out-File $rawNote
}catch{
  Write-Error "Failed to create file."
  return;
}
$i = 1

$matchStr | ForEach-Object { 
  $_.Value -match "<div class='noteText'>(.*)</h3>" | Out-Null
  "{0}. " -f ($i++) | Out-File $rawNote -Append 
  $matches[1].replace(" ","").
  replace('“','"').
  replace('”','"').
  replace('=','\=').
  replace('*','\*').
  replace('$','\$') | Out-File $rawNote -Append
  }