configure
set system host-name srx3
set system login user kmarquis uid 2001
set system login user kmarquis class super-user
set system login user kmarquis authentication encrypted-password "$1$nR20IgMM$TaNGxKNu/NPnJX/7cN941."
set system services ssh root-login allow
set system services netconf ssh
set system services web-management http interface ge-0/0/0.0
set system syslog user * any emergency
set system syslog file messages any any
set system syslog file messages authorization info
set system syslog file interactive-commands interactive-commands any
set interfaces ge-0/0/1 description "LINK to SRX2"
set interfaces ge-0/0/1 unit 0 family inet address 10.1.1.3/31
set interfaces ge-0/0/1 unit 0 family mpls
set interfaces ge-0/0/2 unit 0 family inet 
set interfaces ge-0/0/3 unit 0 family inet
set interfaces ge-0/0/4 description "LINK to SRX1"
set interfaces ge-0/0/4 unit 0 family inet address 10.1.1.4/31
set interfaces ge-0/0/4 unit 0 family mpls
set interfaces lo0 unit 0 family inet address 192.168.100.3/32
set routing-options router-id 192.168.100.3
set protocols rsvp interface ge-0/0/1.0
set protocols rsvp interface ge-0/0/4.0
set protocols mpls interface ge-0/0/1.0
set protocols mpls interface ge-0/0/4.0
set protocols ospf area 0.0.0.0 interface ge-0/0/1.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface ge-0/0/4.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface lo0.0 passive
set protocols ldp interface ge-0/0/1.0
set protocols ldp interface ge-0/0/4.0
set security forwarding-options family iso mode packet-based
set security forwarding-options family inet6 mode packet-based
set security forwarding-options family mpls mode packet-based
commit
quit