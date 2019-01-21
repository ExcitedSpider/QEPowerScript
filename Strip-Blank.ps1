
[string]$str = Get-ClipboardText
$str = $str.Trim()
Set-ClipboardText $str

