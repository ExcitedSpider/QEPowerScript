#Open With VSCode，if no file define, open current dir with VSCode 
param($filename)

function open{
    param($filename)
    IF($null -eq $filename){
        D:\program\MicrosoftVSCode\Code.exe .
        return
    }
    ELSEIF(-not (Test-Path $filename)){
        New-Item $filename
    }
    D:\program\MicrosoftVSCode\Code.exe $filename
}

open $filename > $null
'Open with VS code'