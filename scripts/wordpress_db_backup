#!/bin/bash
getPhpDefinedVariable() {
	egrep -i "^define\(.$1." wp-config.php | egrep -o "'[^']*'" | tail -1 | egrep -o "[^\"']*"
}

dbUser=$(getPhpDefinedVariable DB_USER)
dbHost=$(getPhpDefinedVariable DB_HOST)
dbName=$(getPhpDefinedVariable DB_NAME)
dbPass=$(getPhpDefinedVariable DB_PASSWORD)
timestring=$(date +%Y-%m-%d_%H-%M)

if [ "$dbPass" != "" ]; then
	passString="--password='$dbPass'"
fi

command="mysqldump -u $dbUser -h $dbHost $passString $dbName > $dbHost-$timestring.sql"
echo "Running command:"
echo $command
eval $command
