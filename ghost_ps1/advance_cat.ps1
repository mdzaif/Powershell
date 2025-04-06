<#
    Description: Make more usefull cat command
#>

param(
    $arg1
)
Get-Content $arg1s | ForEach-Object {"$($_.ReadCount) $_"}