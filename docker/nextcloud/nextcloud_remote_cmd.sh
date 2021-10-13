#!/bin/bash
echo "Now accessing nextcloud-app's cmd, Press [CTRL+C] to stop:"
ncAppExec="docker exec --user www-data nextcloud-app php"

while :
do
	read varcmd
	${ncAppExec} ${varcmd}
done
