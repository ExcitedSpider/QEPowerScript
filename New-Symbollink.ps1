param(
  [Parameter(Mandatory=$true)]
  [string]$filename,
  $path='{0}\Desktop' -f ($HOME)
  )

New-Item -ItemType SymbolicLink -Path ('{0}\{1}' -f ($path,$filename)) -Target $filename

#Default need to run as admin.