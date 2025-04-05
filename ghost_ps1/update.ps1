# Update function
function  Update-Pkg {
    param (
        [array]$pkgs
    )
    Write-Host "`nThe following packages will update:"
    $pkgs

    $uin = Read-Host "`nDo you want to contine(y/n)"

    if ($uin -match '^[yY]$'){
        Write-Host "`nStarting update...`n"
        foreach ($pkg in $pkgs){
            winget upgrade $pkg
        }
    }
    elseif ($uin -match '^[nN]$'){
        Write-Host "`nUser stopped the program"
    }
    else{
        write-Host "`nInput Error!"
    }
    
}

function Collect-Index {
    
    while($true){
        # take index input
        $user_in = Read-Host "Enter index number for selection saparate with space and to select all type -1"

        # spliting input
        $user_in = $user_in -split '\s+'

        # index array
        $user_in = $user_in | ForEach-Object { 
            try {
                [int]$_
            } catch {
                return $null
            }
        }

        if($user_in -contains $null){
            Write-Host "`nInvaild index found!"
        }
        else{
            return $user_in
        }
    }

}

# Clear Screen
Clear-Host

# Executa o comando winget upgrade para verificar atualizações disponíveis
Write-Host "`nChecking for available package updates..."
winget update

# Obtém a lista de pacotes instalados e identifica os que têm atualizações disponíveis
$installed = Get-WinGetPackage -Source winget
$updatable = $installed | Where-Object IsUpdateAvailable | Select-Object -ExpandProperty Id

$update_list = @($updatable)

# index and list
Write-Host "`n-------------Index number for Package ID---------------------`n"
for ( $i = 0; $i -lt $update_list.length; $i++ ){ write-host $i $update_list[$i] }

# select package
$index_num = Collect-Index

if($index_num[0] -eq -1){
    Update-Pkg -pkgs $update_list
}
else{
    $i = 0
    $select_in = @()
    while( $i -lt $index_num.length){
        $select_in += $update_list[$index_num[$i]]
        $i++
    }
    Update-Pkg -pkgs $select_in
}



