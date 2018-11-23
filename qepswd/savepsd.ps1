
param(
    # the name of psd tend to save, not psd itself
    [Parameter(Mandatory = $true)]
    [string]
    $name
)

class PSDItem {
    [string]$name
    [string]$key

    PSDItem([string]$name, [string]$key) {
        $this.name = $name
        $this.key = $key
    }
}

function existSameName {

    param([System.Object[]]$list, [String]$n)

    for ($i = 0; $i -lt $list.Count; $i++) {
        if ($list[$i].name -eq $n) {
            return $true
        }
    }
    return $false

}

$psdpath = '.\data\password.json'

IF (-not (Test-Path $psdpath)) {
    IF (-not (Test-Path .\data)) {
        mkdir .\data
    }
    $psdtable = @{}
    $psdtable.content = [PSDItem[]]@()
    $psdtip = [PSDItem]::new("the key to find psd", "The encrypted psd string")
    $psdtable.content += $psdtip
    $psdtable | ConvertTo-Json | Out-File $psdpath
    'no psd data file detected, create new one'
}


$psdlist = Get-Content $psdpath | ConvertFrom-Json

while (existSameName -list $psdlist.content -n $name) {
    'found same name, please enter a new name or ^c to exit: '
    $name = Read-Host
}
"insert new psd name {0}" -f ($name)
"pls enter psd: "
$secureString = Read-Host -AsSecureString
$psdlist.content += [PSDItem]::new(($name), (ConvertFrom-SecureString $secureString))
$psdlist | ConvertTo-Json | Out-File $psdpath
'ok! i will save your psd carefully!'