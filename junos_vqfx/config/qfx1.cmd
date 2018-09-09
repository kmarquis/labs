configure
set system host-name srx1
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
set interfaces em3 unit 0 family inet address 10.1.1.1/31
set interfaces em3 unit 0 family mpls
set interfaces em4 unit 0 family inet address 10.1.1.5/31
set interfaces em4 unit 0 family mpls
set interfaces lo0 unit 0 family inet address 192.168.100.1/32
set protocols rsvp interface ge-0/0/2.0
set protocols rsvp interface ge-0/0/4.0
set protocols mpls interface ge-0/0/2.0
set protocols mpls interface ge-0/0/4.0
set protocols ospf area 0.0.0.0 interface ge-0/0/4.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface lo0.0 passive
set protocols ospf area 0.0.0.0 interface ge-0/0/2.0 interface-type p2p
set protocols ldp interface ge-0/0/2.0
set protocols ldp interface ge-0/0/4.0
set security forwarding-options family iso mode packet-based
set security forwarding-options family inet6 mode packet-based
set security forwarding-options family mpls mode packet-based
commit
quit