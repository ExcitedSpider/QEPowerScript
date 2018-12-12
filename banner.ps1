$time = Get-Date
$name=Get-WmiObject -Class Win32_UserAccount -Filter "Name='$env:username' and Domain='$env:userdomain'"
$username=$name.Name
IF($username -eq '36064'){
    $username = 'QE'
}

$freemem=(get-wmiobject -class Win32_PerfFormattedData_PerfOS_Memory   -namespace "root\cimv2").AvailableMBytes
$mem =(((Get-WmiObject -Class Win32_PhysicalMemory).capacity | Measure-Object -Sum).sum /1mb)

@"
=================================================
|`tTODAY`t==>`t{0}`t|
|`tTIME`t==>`t{1}`t`t`t|
|`tMEM`t==>`t{2}`t`t|
|`tSHELL`t==>`tPowerShell`t`t|
|`tUSER`t==>`t{3}`t`t`t|
=================================================
"@ -f ("$($time.Year)-$($time.Month)-$($time.Day), $($time.DayOfWeek)","$($time.Hour):$($time.Minute)","$freemem mb/$mem mb",$username) | Write-Host -ForegroundColor Blue


# @"
# ===========================================================
#        _               _    _   _                   _    _ 
#       | |             | |  (_) | |                 | |  (_)
#    ___| |__   ___  ___| | ___  | |__  _ __ ___  ___| | ___ 
#   / __| '_ \ / _ \/ _ \ |/ / | | '_ \| '__/ _ \/ _ \ |/ / |
#  | (__| | | |  __/  __/   <| | | |_) | | |  __/  __/   <| |
#   \___|_| |_|\___|\___|_|\_\_| |_.__/|_|  \___|\___|_|\_\_|

# ===========================================================
# `n
# "@ | Write-Host -ForegroundColor Yellow