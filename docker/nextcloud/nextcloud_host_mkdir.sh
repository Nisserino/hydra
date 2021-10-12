#!/bin/bash
#mkdir for nextcloud docker
nextcloud_dir=($HOME/nextcloud \
	$HOME/nextcloud/data \
	$HOME/nextcloud/data/html \
	$HOME/nextcloud/data/config \
	$HOME/nextcloud/data/apps \
	$HOME/nextcloud/data/data \
	$HOME/nextcloud/data/themes \
	$HOME/nextcloud/data/mysql \
	$HOME/nextcloud/data/collabora)

for dir in "${nextcloud_dir[@]}"
do 
  mkdir $dir
done
