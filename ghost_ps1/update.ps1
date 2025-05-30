# face Get-WinGetPackage this module not working so: visit the site: https://www.powershellgallery.com/packages/Microsoft.WinGet.Client/1.6.3133.0
# ok then  run this command shown their Install-Module -Name Microsoft.WinGet.Client -RequiredVersion 1.6.3133.0 # note that you can chnage version given list under the command section
# also, make sure you using powershell version 5+. I test this script in powershell version 7. 
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

function Get-Index {
    
    while($true){
        # take index input
        $user_in = Read-Host "Enter index number for selection saparate with space and to select all press enter"

        # spliting input
        if ($user_in.length -eq 0){
            $user_in = @()
            return $user_in
        }
        else{
            $user_in = $user_in -split '\s+'
        }

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

Write-Host "`nChecking for available package updates..."
winget update

$installed = Get-WinGetPackage -Source winget
$updatable = $installed | Where-Object IsUpdateAvailable | Select-Object -ExpandProperty Id

$update_list = @($updatable)

# index and list
Write-Host "`n-------------Index number for Package ID---------------------`n"
for ( $i = 0; $i -lt $update_list.length; $i++ ){ write-host $i $update_list[$i] }

# select package
$index_num = Get-Index

if($index_num.length -eq 0){
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



