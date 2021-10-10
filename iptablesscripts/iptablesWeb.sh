iptables -A INPUT -j DROP

iptables -A INPUT -s 192.168.5.0/24 -p tcp --dport 22 -j ACCEPT

iptables -A INPUT -p tcp --dport 443 -j ACCEPT

iptables -A INPUT -p tcp --dport 80 -j ACCEPT
