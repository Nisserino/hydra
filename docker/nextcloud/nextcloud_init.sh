#!/bin/bash

alias nc-app-exec="docker exec --user www-data nextcloud-app php"

NEXTCLOUD_CMD=("occ app:install calendar" \
"occ app:install apporder" \
"occ app:install richdocuments" \
"occ app:install spreed" )

#echo ${NEXTCLOUD_CMD[*]}

for CMD in "${NEXTCLOUD_CMD[@]}"
do	
   nc-app-exec $CMD
done


#richdocuments = collabora online (office 365 equvelent)
#spreed = nextcloud talk
#possible apps: deck notes

#groups
#occ group:add [--display-name DISPLAY-NAME] [--] <groupid>

#users
#occ user:add [--password-from-env] [--display-name [DISPLAY-NAME]] [-g|--group [GROUP]] [--] <uid>


