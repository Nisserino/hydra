#!/bin/bash

iptables -A INPUT -s 0.0.0.0 -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -j DROP
