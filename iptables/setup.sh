cp /etc/iptables/iptables.rules /etc/iptables/iptables.rules.orig
iptables-save > /etc/iptables/iptables.rules
systemctl enable iptables.service
