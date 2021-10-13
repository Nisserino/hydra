# Docker Services

## NextCloud
> Hostname: VmServer
> ip: 192.168.6.50 <?>
> port: 8080:80
> container_name: nextcloud-app
> docker network: dockernet
> docker ip: 172.20.0.6

### Volumes
> $HOME/nextcloud/data/html
> $HOME/nextcloud/data/config
> $HOME/nextcloud/data/apps
> $HOME/nextcloud/data/data
> $HOME/nextcloud/data/themes
  
## MarinaDB
> Hostname: VmServer
> ip: 192.168.6.50 <?>
> port: 3306:3306
> container_name: nextcloud-mariadb
> docker network: dockernet
> docker ip: 172.20.0.4

### Volumes
> $HOME/nextcloud/data/mysql

## Collabora
> Hostname: VmServer
> ip: 192.168.6.50 <?>
> port: 9980:9980
> container_name: nextcloud-office
> docker network: dockernet
> docker ip: 172.20.0.5

### Volumes
> $HOME/nextcloud/data/collabora

## Jellyfin
> Hostname: VmServer
> ip: 192.168.6.50 <?>
> port: 8096:8096
> container_name: jellyfin
> docker network: dockernet
> docker ip: 172.20.0.7

### Volumes
> $HOME/jellyfin/data/config
> $HOME/jellyfin/data/cache
> $HOME/jellyfin/data/media
> $HOME/jellyfin/data/media2

## Jitsi
> Hostname: VmServer
> ip: 192.168.6.50
> port: 8089 

## Matrix-synapse
> Hostname: VmServer
> ip: 192.168.6.50
> port: <?>

##

# Other Services
Do we even have any?
