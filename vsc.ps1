#Open With VSCode，if no file define, open current dir with VSCode 
param($filename)

function open{
    param($filename)
    IF($null -eq $filename){
        D:\program\MicrosoftVSCode\Code.exe .
        'Open '+$PSScriptRoot+' with VS code'
    }
    ELSEIF(Test-Path $filename){
        D:\program\MicrosoftVSCode\Code.exe $filename
        'Open '+$filename+' with VS code'
    }ELSE{
        New-Object $filename
        D:\program\MicrosoftVSCode\Code.exe $filename
        'Open '+$filename+' with VS code'
    } 
}

open $filename > $null