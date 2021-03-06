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
set interfaces ge-0/0/2 unit 0 family inet address 172.168.1.1/24
set interfaces ge-0/0/3 unit 0 family inet address 172.168.2.1/24
set interfaces lo0 unit 0 family inet address 192.168.100.3/32
set interfaces st0 unit 0 family inet address 192.168.90.0/31
set routing-options router-id 192.168.100.3
set routing-options autonomous-system 100
set protocols bgp group bgp type internal
set protocols bgp group bgp export bgp_export
set protocols bgp group bgp neighbor 10.1.1.1
set protocols ospf area 0.0.0.0 interface lo0.0 passive
set protocols ospf area 0.0.0.0 interface ge-0/0/1.0 interface-type p2p
set policy-options prefix-list subnets 172.168.0.0/22
set policy-options policy-statement bgp_export term T1 from prefix-list-filter subnets orlonger
set policy-options policy-statement bgp_export term T1 then accept
delete security
set security address-book global address srx1 10.1.1.1/32
set security address-book global address srx3 10.1.1.3/32
set security address-book global address loopback 192.168.100.3/32
set security policies from-zone lan to-zone lan policy allow match source-address any
set security policies from-zone lan to-zone lan policy allow match destination-address any
set security policies from-zone lan to-zone lan policy allow match application any
set security policies from-zone lan to-zone lan policy allow then permit
set security policies from-zone wan to-zone wan policy bgp match source-address srx1
set security policies from-zone wan to-zone wan policy bgp match destination-address srx3
set security policies from-zone wan to-zone wan policy bgp match application junos-bgp
set security policies from-zone wan to-zone wan policy bgp then permit
set security policies from-zone wan to-zone lan policy ping match source-address any
set security policies from-zone wan to-zone lan policy ping match destination-address loopback
set security policies from-zone wan to-zone lan policy ping match application junos-icmp-all
set security policies from-zone wan to-zone lan policy ping then permit
set security zones functional-zone management interfaces ge-0/0/0.0 host-inbound-traffic system-services all
set security zones functional-zone management interfaces ge-0/0/0.0 host-inbound-traffic protocols all
set security zones security-zone wan host-inbound-traffic system-services ping
set security zones security-zone wan host-inbound-traffic system-services ike
set security zones security-zone wan host-inbound-traffic protocols ospf
set security zones security-zone wan host-inbound-traffic protocols bgp
set security zones security-zone wan interfaces ge-0/0/1.0
set security zones security-zone lan host-inbound-traffic system-services all
set security zones security-zone lan host-inbound-traffic protocols all
set security zones security-zone lan interfaces ge-0/0/2.0
set security zones security-zone lan interfaces ge-0/0/3.0
set security zones security-zone lan interfaces lo0.0
commit
quit