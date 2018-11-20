$time = Get-Date
$name=Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:username' and Domain='$env:userdomain'"
$username=$name.Name
IF($username -eq '36064'){
    $username = 'QE'
}

$freemem=(get-wmiobject -class Win32_PerfFormattedData_PerfOS_Memory   -namespace "root\cimv2").AvailableMBytes
$mem =(((Get-WmiObject -Class Win32_PhysicalMemory).capacity | Measure-Object -Sum).sum /1mb)

$outobject = New-Object object
$outobject | Add-Member NoteProperty TODAY "$($time.Year)-$($time.Month)-$($time.Day), $($time.DayOfWeek)"
$outobject | Add-Member NoteProperty TIME "$($time.Hour):$($time.Minute)"
$outobject | Add-Member NoteProperty PID $PID
$outobject | Add-Member NoteProperty CULTRUE $PSUICulture
$outobject | Add-Member NoteProperty MEM "$freemem mb/$mem mb"

"WELLCOME $username! "

$outobject | Format-List *

@"
===========================================================
       _               _    _   _                   _    _ 
      | |             | |  (_) | |                 | |  (_)
   ___| |__   ___  ___| | ___  | |__  _ __ ___  ___| | ___ 
  / __| '_ \ / _ \/ _ \ |/ / | | '_ \| '__/ _ \/ _ \ |/ / |
 | (__| | | |  __/  __/   <| | | |_) | | |  __/  __/   <| |
  \___|_| |_|\___|\___|_|\_\_| |_.__/|_|  \___|\___|_|\_\_|

===========================================================
`n
"@ | Write-Host -ForegroundColor Yellow