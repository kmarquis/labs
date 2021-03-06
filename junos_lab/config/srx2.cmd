configure
set system host-name srx2
set system root-authentication encrypted-password "$1$nq.N1UsY$JxA/ESAj3KuXseXE597gg0"
set system root-authentication ssh-rsa "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDEOLlnR+lHEbc9202+wf30YgMsHL7InBmNM29m5w0XXYXvmNugab9SxWDqTiuLGp7AZnuohfte57ejliRLBSEwATk4MdeW+3Ynr19+HUNBCDL5eUVpwUdiRBEBHffixKWhzs5iKovd0Mpv9JMIOkuKnjp5v5ZJJMliPU4JoChjeXvqf2sH7OYNa2RUTohxie7VJ4x34Hi9HuyhvgRB170VjLKpGXnDA/vCSIGINwPDb2zVKIMkxm5nnpeO0a6tKmmv9dS5IyxpxxXgchcjJ68cKasiq290MHvLRhPl+DUbDXXEu54K1ulMdHq+939hHTw57HZzAOHR23qNdrNfr2Z5 vagrant"
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
set interfaces ge-0/0/1 description "LINK to SRX1"
set interfaces ge-0/0/1 unit 0 family inet address 10.1.1.0/31
set interfaces ge-0/0/1 unit 0 family iso
set interfaces ge-0/0/1 unit 0 family mpls
set interfaces ge-0/0/2 description "LINK to SRX2"
set interfaces ge-0/0/2 unit 0 family inet address 10.1.1.2/31
set interfaces ge-0/0/2 unit 0 family iso
set interfaces ge-0/0/2 unit 0 family mpls
set interfaces ge-0/0/3 description "VM Host 5 192.168.5.0/24"
set interfaces ge-0/0/3 unit 0 family inet address 192.168.5.1/24
set interfaces ge-0/0/4 description "LINK to SRX4"
set interfaces ge-0/0/4 unit 0 family inet address 10.1.1.9/31
set interfaces ge-0/0/4 unit 0 family iso
set interfaces ge-0/0/4 unit 0 family mpls
set interfaces lo0 unit 0 family inet address 192.168.100.2/32
set interfaces lo0 unit 0 family iso address 49.0001.0192.0168.0100.0002.00
set routing-options static route 192.168.5.0/24 discard
set routing-options router-id 192.168.100.2
set routing-options autonomous-system 65102
set protocols rsvp interface ge-0/0/1.0
set protocols rsvp interface ge-0/0/2.0
set protocols rsvp interface ge-0/0/4.0
set protocols mpls icmp-tunneling
set protocols mpls interface ge-0/0/1.0
set protocols mpls interface ge-0/0/2.0
set protocols mpls interface ge-0/0/4.0
set protocols bgp group iBGP type external
set protocols bgp group iBGP multihop ttl 2
set protocols bgp group iBGP local-address 192.168.100.2
set protocols bgp group iBGP neighbor 192.168.100.1 peer-as 65100
set protocols bgp group iBGP neighbor 192.168.100.3 peer-as 65103
set protocols isis traffic-engineering family inet shortcuts
set protocols isis level 1 disable
set protocols isis level 2 wide-metrics-only
set protocols isis interface ge-0/0/1.0 ldp-synchronization
set protocols isis interface ge-0/0/1.0 point-to-point
set protocols isis interface ge-0/0/2.0 ldp-synchronization
set protocols isis interface ge-0/0/2.0 point-to-point
set protocols isis interface ge-0/0/4.0 ldp-synchronization
set protocols isis interface ge-0/0/4.0 point-to-point
set protocols isis interface lo0.0 passive
set protocols ospf traffic-engineering
set protocols ospf area 0.0.0.0 interface ge-0/0/1.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface lo0.0 passive
set protocols ospf area 0.0.0.0 interface ge-0/0/2.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface ge-0/0/4.0 interface-type p2p
set protocols ldp interface ge-0/0/1.0
set protocols ldp interface ge-0/0/2.0
set protocols ldp interface ge-0/0/4.0
set protocols lldp interface all
set policy-options prefix-list statics 192.168.5.0/24
set policy-options policy-statement export_bgp term static from protocol static
set policy-options policy-statement export_bgp term static from prefix-list statics
set policy-options policy-statement export_bgp term static then accept
set policy-options policy-statement export_bgp then reject
set security forwarding-options family inet6 mode packet-based
set security forwarding-options family mpls mode packet-based
set security forwarding-options family iso mode packet-based
commit
quit