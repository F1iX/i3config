# Vorhandene Regeln löschen
for table in filter nat mangle
do
	iptables -t $table -F
	iptables -t $table -X
	iptables -t $table -Z
done

# Standardverhalten: Nur ausgehend erlauben
iptables -P INPUT   DROP
iptables -P OUTPUT  ACCEPT
iptables -P FORWARD DROP



# Loopback-Traffic erlauben
iptables -A INPUT -i lo -j ACCEPT

# ICMP-Pakete durchlassen
iptables -A INPUT -p icmp -j ACCEPT

# Eingehende Antworten auf bestehende Verbindungen erlauben
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT



# SSH: tcp/22
iptables -A INPUT -p tcp --dport  22 -j ACCEPT

# CUPS/IPP: tcp/631
#iptables -A INPUT -p tcp --dport 631 -j ACCEPT

