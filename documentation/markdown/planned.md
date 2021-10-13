# Planned features

## Prometheus + Grafana

We wanted to implement Prometheus and Grafana services but due to the lack of time we couldn't make it. We worked on it a bit but got worried about implementing into the cloud enviroment. One group member set it up and got it working on their computer, but didn't know how to set it up securely OpenStack.  

## Backups

### OpenStack volumes

We wanted to set up some kind of a backup system for the server enviroment. We wanted to implement the 3-2-1 module. We looked into creating snapshots of volumes however we needed to shutdown the servers to not accidently get bad data. 

## VPN

We never got the VPN to work, we figured to improve the networks security it would be beneficial to implement a kind of VPN to encrypt traffic.

## Nginx reverse proxy

We wanted a reverse proxy human readable to access our applications and also have an SSL certificate/HTTPS for NextCloud, Collabora and Jellyfin.  
