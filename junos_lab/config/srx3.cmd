configure
set system host-name srx3
set system root-authentication encrypted-password "$1$nq.N1UsY$JxA/ESAj3KuXseXE597gg0"
set system root-authentication ssh-rsa "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCrdnMpEKvfHXs2qayAGi+fjCoAKxVxJJPXle0LbS/Q5DudcaG7EeOgk+MKqRGlnXX+RRsiFGUQoO6X+GNivvjY7fX0jhvPCVblxJJePoGJfDGud0jhLv5fmucGxks0vBz0dzo/X37a4Sbs3WvfZaHTP/ErPstIJ07NSmvj/sLr778ipUW664UVyhfm0Jpm5h98mQBRyDwSknIb7Gy31V3VMVsXrFLzUyaSv3PK7eQMV28AmCotFerZAKXL+QgvF8ViyEB7fB+3DN/ccATAhevBD3P+E5Ul0cJjontd0ln7zQrbmVpT7FmSZSdmFoD9pym6kd8RzePmtirFvmVuarih vagrant"
set system login user kmarquis uid 2001
set system login user kmarquis class super-user
set system login user kmarquis authentication encrypted-password "$1$nR20IgMM$TaNGxKNu/NPnJX/7cN941."
set system login user vagrant uid 2000
set system login user vagrant class super-user
set system login user vagrant authentication ssh-rsa "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
set system services ssh root-login allow
set system services netconf ssh
set system services web-management http interface ge-0/0/0.0
set system syslog user * any emergency
set system syslog file messages any any
set system syslog file messages authorization info
set system syslog file interactive-commands interactive-commands any
set system license autoupdate url https://ae1.juniper.net/junos/key_retrieval
set interfaces ge-0/0/0 description "Vagrant mgmt"
set interfaces ge-0/0/0 unit 0 family inet dhcp
set interfaces ge-0/0/1 description "LINK to SRX2"
set interfaces ge-0/0/1 unit 0 family inet address 10.1.1.3/31
set interfaces ge-0/0/1 unit 0 family mpls
set interfaces ge-0/0/2 description "VM Host 2"
set interfaces ge-0/0/2 vlan-tagging
set interfaces ge-0/0/2 unit 4 vlan-id 4
set interfaces ge-0/0/2 unit 4 family inet address 192.168.4.1/24
set interfaces ge-0/0/2 unit 5 vlan-id 5
set interfaces ge-0/0/2 unit 5 family inet address 192.168.2.1/24
set interfaces ge-0/0/3 description "VM Host 4"
set interfaces ge-0/0/3 vlan-tagging
set interfaces ge-0/0/3 unit 6 vlan-id 6
set interfaces ge-0/0/3 unit 6 family inet address 192.168.6.1/24
set interfaces ge-0/0/3 unit 7 vlan-id 7
set interfaces ge-0/0/3 unit 7 family inet address 192.168.7.1/24
set interfaces ge-0/0/4 description "LINK to SRX1"
set interfaces ge-0/0/4 unit 0 family inet address 10.1.1.4/31
set interfaces ge-0/0/4 unit 0 family iso
set interfaces ge-0/0/4 unit 0 family mpls
set interfaces ge-0/0/5 description "LINK to SRX4"
set interfaces ge-0/0/5 unit 0 family inet address 10.1.1.11/31
set interfaces ge-0/0/5 unit 0 family iso
set interfaces ge-0/0/5 unit 0 family mpls
set interfaces lo0 unit 0 family inet address 192.168.100.3/32
set interfaces lo0 unit 0 family iso address 49.0001.0192.0168.0100.0003.00
set routing-options static route 192.168.4.0/22 discard
set routing-options router-id 192.168.100.3
set routing-options autonomous-system 65103
set protocols rsvp interface ge-0/0/1.0
set protocols rsvp interface ge-0/0/4.0
set protocols rsvp interface ge-0/0/5.0
set protocols mpls icmp-tunneling
set protocols mpls interface ge-0/0/1.0
set protocols mpls interface ge-0/0/4.0
set protocols mpls interface ge-0/0/5.0
set protocols bgp group eBGP type external
set protocols bgp group eBGP multihop ttl 2
set protocols bgp group eBGP local-address 192.168.100.3
set protocols bgp group eBGP export export_bgp
set protocols bgp group eBGP neighbor 192.168.100.2 peer-as 65102
set protocols bgp group eBGP neighbor 192.168.100.1 peer-as 65100
set protocols isis traffic-engineering family inet shortcuts
set protocols isis level 1 disable
set protocols isis level 2 wide-metrics-only
set protocols isis interface ge-0/0/1.0 ldp-synchronization
set protocols isis interface ge-0/0/1.0 point-to-point
set protocols isis interface ge-0/0/4.0 ldp-synchronization
set protocols isis interface ge-0/0/4.0 point-to-point
set protocols isis interface ge-0/0/5.0 ldp-synchronization
set protocols isis interface ge-0/0/5.0 point-to-point
set protocols isis interface lo0.0 passive
set protocols ospf traffic-engineering shortcuts
set protocols ospf area 0.0.0.0 interface ge-0/0/1.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface ge-0/0/4.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface ge-0/0/5.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface lo0.0 passive
set protocols ldp interface ge-0/0/1.0
set protocols ldp interface ge-0/0/4.0
set protocols ldp interface ge-0/0/5.0
set protocols lldp interface all
set policy-options prefix-list statics 192.168.4.0/22
set policy-options policy-statement export_bgp term static from prefix-list statics
set policy-options policy-statement export_bgp term static then accept
set policy-options policy-statement export_bgp then reject
set security forwarding-options family inet6 mode packet-based
set security forwarding-options family mpls mode packet-based
set security forwarding-options family iso mode packet-based
commit
quit