#!/bin/bash
iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 445 -j ACCEPT

iptables -A OUTPUT -s 192.168.0.0/16 -p tcp --sport 445 -j ACCEPT
