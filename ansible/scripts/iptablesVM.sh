#!/bin/bash

iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 3306 -j ACCEPT

iptables -A OUTPUT -s 192.168.0.0/16 -p tcp --match --sport 3306 -j ACCEPT


iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 8080 -j ACCEPT

iptables -A OUTPUT -s 192.168.0.0/16 -p tcp --sport 8080 -j ACCEPT


iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 8096 -j ACCEPT

iptables -A OUTPUT -s 192.168.0.0/16 -p tcp --sport 8096 -j ACCEPT

iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 9980 -j ACCEPT

iptables -A OUTPUT -s 192.168.0.0/16 -p tcp --sport 9980 -j ACCEPT


