configure
set system host-name srx4
set system root-authentication encrypted-password "$1$nq.N1UsY$JxA/ESAj3KuXseXE597gg0"
set system root-authentication ssh-rsa "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDnxJQqxrvQzhna1oM3rqnV97eTDsm+RNJnYH6ri3SvY1Eni7l7/0iVEu4VycW4Be8y/cQslnfrVIMEn7sGC+mf6SK28bTMjPv4Qma8ZSWxZAVmcL4uaujxQTFhXimD6f4PH0j8Q1dyFbYdy1+XJRDxbCtHpbFQ77Vx/PRVELWnDeUhhWtzxYRdEJr0gJFMkgcI9SiFSGcsEt9KEKwjpuvQaOtb4g0kfn/hWN6C/p1J05Smc6Q4/VgsHMKIoOXtdAiFCUTCvZ5QgxfTkuLxen3LqLmE5QH4Rba3TLSiZv8p+iXpcoNFTcjDYbrkLNV/8TftuWrcRpFM4zEFnE2Pv3ix vagrant"
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
set interfaces ge-0/0/1 unit 0 family inet address 10.1.1.6/31
set interfaces ge-0/0/1 unit 0 family iso
set interfaces ge-0/0/1 unit 0 family mpls
set interfaces ge-0/0/2 description "LINK to SRX2"
set interfaces ge-0/0/2 unit 0 family inet address 10.1.1.8/31
set interfaces ge-0/0/2 unit 0 family iso
set interfaces ge-0/0/2 unit 0 family mpls
set interfaces ge-0/0/3 description "LINK to SRX3"
set interfaces ge-0/0/3 unit 0 family inet address 10.1.1.10/31
set interfaces ge-0/0/3 unit 0 family iso
set interfaces ge-0/0/3 unit 0 family mpls
set interfaces lo0 unit 0 family inet address 192.168.100.4/32
set interfaces lo0 unit 0 family iso address 49.0001.0192.0168.0100.0004.00
set routing-options router-id 192.168.100.4
set protocols rsvp interface ge-0/0/1.0
set protocols rsvp interface ge-0/0/2.0
set protocols rsvp interface ge-0/0/3.0
set protocols mpls icmp-tunneling
set protocols mpls interface ge-0/0/1.0
set protocols mpls interface ge-0/0/2.0
set protocols mpls interface ge-0/0/3.0
set protocols isis level 1 disable
set protocols isis level 2 wide-metrics-only
set protocols isis interface ge-0/0/1.0 ldp-synchronization
set protocols isis interface ge-0/0/1.0 point-to-point
set protocols isis interface ge-0/0/2.0 ldp-synchronization
set protocols isis interface ge-0/0/2.0 point-to-point
set protocols isis interface ge-0/0/3.0 ldp-synchronization
set protocols isis interface ge-0/0/3.0 point-to-point
set protocols isis interface lo0.0 passive
set protocols ospf traffic-engineering
set protocols ospf area 0.0.0.0 interface ge-0/0/1.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface ge-0/0/2.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface ge-0/0/3.0 interface-type p2p
set protocols ospf area 0.0.0.0 interface lo0.0 passive
set protocols ldp interface ge-0/0/1.0
set protocols ldp interface ge-0/0/2.0
set protocols ldp interface ge-0/0/3.0
set protocols lldp interface all
set security forwarding-options family inet6 mode packet-based
set security forwarding-options family mpls mode packet-based
set security forwarding-options family iso mode packet-based
commit
quit