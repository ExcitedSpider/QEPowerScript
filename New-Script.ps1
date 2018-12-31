param(
  [Parameter(Mandatory=$true)]
  [string]$scriptName
)

$path = $env:ScriptHome
if($null -eq $path){
  Write-Error "No env:ScriptHome defined. Failed to create new script."
}
$file=New-Item -Path ("{0}\{1}.ps1" -f($path,$scriptName))

code $file