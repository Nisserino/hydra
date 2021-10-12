#!/bin/bash

NEXTCLOUD_CMD=(occ app:install calendar \
occ app:install apporder \
occ app:install richdocuments \)

for CMD in "${NEXTCLOUD_CMD[@]}"
do
  docker exec --user www-data nextcloud-app php occ $CMD
done


#collabora online (office 365 equvelent)


#groups
#occ group:add [--display-name DISPLAY-NAME] [--] <groupid>

#users
#occ user:add [--password-from-env] [--display-name [DISPLAY-NAME]] [-g|--group [GROUP]] [--] <uid>


