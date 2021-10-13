#!/bin/bash
iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 3306 -j ACCEPT
iptables -A OUTPUT -s 192.168.0.0/16 -p tcp --sport 3306 -j ACCEPT
