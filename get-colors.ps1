
[enum]::GetValues([System.ConsoleColor]) | Foreach-Object {Write-Host $_ -ForegroundColor $_}  

# referto : https://blogs.technet.microsoft.com/gary/2013/11/20/sample-all-powershell-console-colors/