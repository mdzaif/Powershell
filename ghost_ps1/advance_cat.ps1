<#
    Description: Make more usefull cat command
#>

param(
    $arg1
)
Get-Content $arg1 | ForEach-Object {"$($_.ReadCount) $_"}