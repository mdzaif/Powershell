Write-Host "hello world"
#echo "hello world"

# Get alias
Get-Alias

get-command > command.txt # output directed by overwrite

Get-ChildItem >> command.txt # output directed by append

