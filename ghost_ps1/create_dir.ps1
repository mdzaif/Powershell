<#
	Description: Create multi directory
#>

param (
	[string]$arg0,
	$arg1
)
$arg1 | ForEach-Object { New-Item -ItemType Directory -Name "$arg0$_" -Force }