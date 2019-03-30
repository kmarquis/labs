configure
set system host-name srx1
set system root-authentication encrypted-password "$1$nq.N1UsY$JxA/ESAj3KuXseXE597gg0"
set system root-authentication ssh-rsa "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDj8aTT+/qEEh+tOyrOAfavgscHnl+ANG6ZoQ6t7ayVRdvv1gV5oq9RZOsP1H6PRF1qn416GK4qL9OsZK6TF+NueQ1zamgni/l/totv925HrzjsaUKOqJRVsm2CZhjp3p6mpZHeY+cYM4LSwGoc2dh3/MZBcdprVi0uiT3NbShQ16RkTWVr3xgmltO8NES5zh/4q9fYLh+hG+XeQuSnDqbziMr281zOTAMpw9Kf3I7JB1jDJXDzC4lY4dxe8HEfDWqpBSQOrUHysuG2NNaVDJM6M/p/DHRbSaMDSYmycXYzdlwwxT0kTKgYuYO4e1krC8nFnF8uSTYojDOrSypR/3s1 vagrant"
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
set chassis aggregated-devices ethernet device-count 10
set interfaces ge-0/0/0 description "Vagrant mgmt"
set interfaces ge-0/0/0 unit 0 family inet dhcp
set interfaces ge-0/0/1 description "VM Host 1"
set interfaces ge-0/0/1 vlan-tagging
set interfaces ge-0/0/1 vlan-id 9
set interfaces ge-0/0/1 unit 9 family inet address 192.168.0.1/24
set interfaces ge-0/0/1 vlan-id 1
set interfaces ge-0/0/1 unit 1 family inet address 192.168.1.1/24
set interfaces ge-0/0/2 description "LINK to SRX2"
set interfaces ge-0/0/2 unit 0 family inet address 10.1.1.1/31
set interfaces ge-0/0/2 unit 0 family iso
set interfaces ge-0/0/2 unit 0 family mpls
set interfaces ge-0/0/3 description "VM Host 3"
set interfaces ge-0/0/3 vlan-tagging
set interfaces ge-0/0/3 vlan-id 2
set interfaces ge-0/0/3 unit 2 family inet address 192.168.2.1/24
set interfaces ge-0/0/3 vlan-id 3
set interfaces ge-0/0/3 unit 3 family inet address 192.168.3.1/24
set interfaces ge-0/0/4 description "LINK to SRX3"
set interfaces ge-0/0/4 unit 0 family inet address 10.1.1.5/31
set interfaces ge-0/0/4 unit 0 family iso
set interfaces ge-0/0/4 unit 0 family mpls
set interfaces ge-0/0/5 description "LINK to SRX4"
set interfaces ge-0/0/5 unit 0 family inet address 10.1.1.7/31
set interfaces ge-0/0/5 unit 0 family iso
set interfaces ge-0/0/5 unit 0 family mpls
set interfaces lo0 unit 0 family inet address 192.168.100.1/32
set interfaces lo0 unit 0 family iso address 49.0001.0192.0168.0100.0001.00
set interfaces vlan unit 200 family inet address 192.168.200.1/24
set routing-options static route 192.168.0.0/22
set routing-options autonomous-system 65100
set protocols rsvp interface ge-0/0/2.0
set protocols rsvp interface ge-0/0/4.0
set protocols rsvp interface ge-0/0/5.0
set protocols mpls icmp-tunneling
set protocols mpls interface ge-0/0/2.0
set protocols mpls interface ge-0/0/4.0
set protocols mpls interface ge-0/0/5.0
set protocols bgp group eBGP type external
set protocols bgp group eBGP multihop ttl 2
set protocols bgp group eBGP export export_bgp
set protocols bgp group eBGP neighbor 192.168.100.2 peer-as 65102
set protocols bgp group eBGP neighbor 192.168.100.3 peer-as 65103
set protocols isis traffic-engineering family inet shortcuts
set protocols isis level 1 disable
set protocols isis level 2 wide-metrics-only
set protocols isis interface ge-0/0/2.0 ldp-synchronization
set protocols isis interface ge-0/0/2.0 point-to-point
set protocols isis interface ge-0/0/4.0 ldp-synchronization
set protocols isis interface ge-0/0/4.0 point-to-point
set protocols isis interface ge-0/0/5.0 ldp-synchronization
set protocols isis interface ge-0/0/5.0 point-to-point
set protocols isis interface lo0.0 passive
set protocols ospf traffic-engineering
set protocols ospf area 0.0.0.0 interface ge-0/0/4.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface lo0.0 passive
set protocols ospf area 0.0.0.0 interface ge-0/0/2.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface ge-0/0/5.0 interface-type p2p
set protocols ldp interface ge-0/0/2.0
set protocols ldp interface ge-0/0/4.0
set protocols ldp interface ge-0/0/5.0
set protocols lldp interface all
set policy-options prefix-list statics 192.168.0.0/22
set policy-options policy-statement export_bgp term static from prefix-list statics
set policy-options policy-statement export_bgp term static then accept
set policy-options policy-statement export_bgp then reject
set policy-options policy-statement reject then reject
set security forwarding-options family inet6 mode packet-based
set security forwarding-options family mpls mode packet-based
set security forwarding-options family iso mode packet-based
commit
quit