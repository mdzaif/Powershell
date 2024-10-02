# different types of loops

$array = @( "for", "forEach", 'while', 'do..while' )

write-host "for loop"
for ( $i = 0; $i -lt $array.length; $i++ ){ $array[$i] }

write-host "forEach loop"
foreach( $item in $array ){ $item }

write-host "while loop"
$counter = 0
while($counter -lt $array.length)
{
    $array[$counter]
    $counter++
}

write-host "do-while loop"
$counter = 0
do{
    $array[$counter]
    $counter++
}while($counter -lt $array.Length)