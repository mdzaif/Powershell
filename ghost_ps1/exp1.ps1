<#
	This script is run c/c++/python 
	Tested By: MD_ZAIF_IMAM_MAHI
	Date: 10-10-2024
#>

param(
	[Parameter(Position=0)] [string]$file
)
$bas= (get-item $file).baseName
$ext = (get-item $file).extension

if ($ext -eq '.c') {
    gcc -o $bas $file
    time {& .\$bas }  # No need for extra syntax, just reference $bas directly
} elseif ($ext -eq '.cpp') {
    g++ -o $bas $file
    time { & .\$bas }
} elseif ($ext -eq '.py') {
    time { python $file }
} else {
    Write-Host "$file not existed!"
}
