# Instances

## Default ports
lo: 22


## Web
ip: 192.168.1.50
open ports:
  WAN: 80, 443
  LAN: 22

## NAS
ip: 192.168.5.50
open ports:
  LAN: 22 INPUT  
	(Only open to inside network 192.168.0.0/16)  
closed ports:  
	LAN: INPUT DROPPED  

## AnsibleMaster
ip: 192.168.5.51
floating ip: known after build
open ports:
  WAN: 22  
	(only to specific ip)  
  
## VmServer
ip: 192.168.6.50
open ports:
  LAN: 3306, 8080, 8096, 9980 INPUT and OUTPUT  
	(Only open to inside network 192.168.0.0/16)  

## DbServer1
ip: 192.168.6.51
open ports: 
  LAN: 3306 INPUT and OUTPUT  
	(Only open to inside network 192.168.0.0/16)  

## FileServer1
ip: 192.168.6.51
open ports:
  LAN: 445 INPUT and OUTPUT  
	(Only open to inside network 192.168.0.0/16)  

## DbServer2
ip: 192.168.7.50
open ports:
  LAN: 3306 INPUT and OUTPUT  
	(Only open to inside network 192.168.0.0/16)  

## FileServer2
ip: 192.168.7.51
open ports:
  LAN: 445 INPUT and OUTPUT  
	(Only open to inside network 192.168.0.0/16)  
