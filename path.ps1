<#
.SYNOPSIS
    Handle env:path in current powershell session.
.DESCRIPTION
    Handle env:path in current powershell session. Can get, put and delete value
.EXAMPLE
    PS C:\> path *java*
    PS C:\> path -get *java*
    get the path like C:\java and D:\java8

    PS C:\> path -put C:\java
    put C:\java into path

    PS C:\> path -del *java*
    del the path like C:\java and D:\java8
#>

[CmdletBinding(DefaultParameterSetName="GET")]
param(
    [Parameter(ParameterSetName="PUT")]
    [switch]$put,
    [Parameter(Position=1,ParameterSetName="PUT")]
    [string]$putValue,
    [Parameter(ParameterSetName="GET")]
    [switch]$get,
    [Parameter(Position=0,ParameterSetName="GET")]
    [string]$regs,
    [Parameter(ParameterSetName="DELETE")]
    [switch]$delete,
    [Parameter(Position=1,ParameterSetName="DELETE")]
    [string]$dvalue
)


function getPath {
    if($regs -eq "")
    {
        ($env:Path).Split(';')
    }else
    {
    ($env:Path).Split(';') | Where-Object { $_ -like $regs}
    }
}
function putPath {
    $env:Path+=';'+$putValue
}

function delPath {
    $newEnvPath = ""
    $firstvalue=$true;
    ($env:Path).Split(';') | Where-Object { -not ($_ -like $dvalue) } | foreach { 
        if($firstvalue){
            $newEnvPath=$_ 
            $firstvalue=$false
        }else{
            $newEnvPath+=';'+$_
        }
            
    }
    $env:Path = $newEnvPath
}
switch ($PSCmdlet.ParameterSetName) {
    "GET" { getPath }
    "PUT" { putPath }
    "DELETE" { delPath }
}