# Instances

## Web
ip: 192.168.1.50
open ports:
  WAN: 80, 443
  LAN: 22

## NAS
ip: 192.168.5.50
open ports:
  LAN: 22

## AnsibleMaster
ip: 192.168.5.51
floating ip: known after build
open ports:
  WAN: 22 (only to specific ip)
  
## VmServer
ip: 192.168.6.50
open ports:
  LAN: ?

## DbServer1
ip: 192.168.6.51
open ports: 
  LAN: ? 

## FileServer1
ip: 192.168.6.51
open ports:
  LAN: ?

## DbServer2
ip: 192.168.7.50
open ports:
  LAN: ?

## FileServer2
ip: 192.168.7.51
open ports:
  LAN: ?
