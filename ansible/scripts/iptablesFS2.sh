#!/bin/bash

iptables -A INPUT -s 192.168.0.0/16 -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -j DROP
