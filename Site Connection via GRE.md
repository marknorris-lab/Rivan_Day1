
<!-- #$34T# = Your Monitor Number -->

## Site to Site connection via VTI (GRE)

### SET GATEWAY
~~~
!@EDGE
conf t
 int g0/0/1
  ip add 200.0.0.#$34T# 255.255.255.0
  no shut
  exit
 ip route 0.0.0.0 0.0.0.0 200.0.0.1
 end
~~~

&nbsp;
---
&nbsp;

### CONFIGURE NAT
1. Define INSIDE and OUTSIDE
~~~
!@EDGE
conf t
 int g0/0/1
  ip nat outside
 int g0/0/0
  ip nat inside
~~~

<br>

2. Create an ACL to match traffic to be translated.
~~~
!@EDGE
conf t
 access-list 1 permit any
 end
~~~

<br>

3. Define NAT
~~~
!@EDGE
conf t
 ip nat inside source list 1 int g0/0/1 overload
~~~

<br>
<br>

Verify: 
~~~
!@TAAS, BABA, CUCM, EDGE
ping 8.8.8.8
ping 8.8.4.4
~~~

~~~
!@EDGE
show ip nat translations
~~~

&nbsp;
---
&nbsp;

### MODIFY ROUTING FOR INSIDE
~~~
!@EDGE
conf t
 no router ospf 1
router ospf 1
 router-id #$3AT#.0.0.1
 network 10.#$3AT#.#$3AT#0 0.0.0.255 area 0
 default-information origiate always
 end
~~~

&nbsp;
---
&nbsp;

### CONFIGURE GRE TUNNELS
~~~
!@EDGE
conf t
 int tun 11
  ip add 172.16.11.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.11
  tunnel mode gre ip
  exit
 int tun 12
  ip add 172.16.12.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.12
  tunnel mode gre ip
  exit
 int tun 21
  ip add 172.16.21.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.21
  tunnel mode gre ip
  exit
 int tun 22
  ip add 172.16.22.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.22
  tunnel mode gre ip
  exit
 int tun 31
  ip add 172.16.31.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.31
  tunnel mode gre ip
  exit
 int tun 32
  ip add 172.16.32.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.32
  tunnel mode gre ip
  exit
 int tun 41
  ip add 172.16.41.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.41
  tunnel mode gre ip
  exit
 int tun 42
  ip add 172.16.42.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.42
  tunnel mode gre ip
  exit
 int tun 51
  ip add 172.16.51.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.51
  tunnel mode gre ip
  exit
 int tun 52
  ip add 172.16.52.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.52
  tunnel mode gre ip
  exit
 int tun 61
  ip add 172.16.61.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.61
  tunnel mode gre ip
  exit
 int tun 62
  ip add 172.16.62.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.62
  tunnel mode gre ip
  exit
 int tun 71
  ip add 172.16.71.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.71
  tunnel mode gre ip
  exit
 int tun 72
  ip add 172.16.72.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.72
  tunnel mode gre ip
  exit
 int tun 81
  ip add 172.16.81.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.81
  tunnel mode gre ip
  exit
 int tun 82
  ip add 172.16.82.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.82
  tunnel mode gre ip
  exit
 int tun 91
  ip add 172.16.91.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.91
  tunnel mode gre ip
  exit
 int tun 92
  ip add 172.16.92.#$34T# 255.255.255.0
  tunnel source g0/0/1
  tunnel destination 200.0.0.92
  tunnel mode gre ip
  end
~~~

&nbsp;
---
&nbsp;


### SET STATIC ROUTING THROUGH GRE TUNNELS
~~~
!@EDGE
conf t
 ip route 10.11.0.0 255.255.0.0 172.16.11.11
 ip route 10.12.0.0 255.255.0.0 172.16.12.12
 ip route 10.21.0.0 255.255.0.0 172.16.21.21
 ip route 10.22.0.0 255.255.0.0 172.16.22.22
 ip route 10.31.0.0 255.255.0.0 172.16.31.31
 ip route 10.32.0.0 255.255.0.0 172.16.32.32
 ip route 10.41.0.0 255.255.0.0 172.16.41.41
 ip route 10.42.0.0 255.255.0.0 172.16.42.42
 ip route 10.51.0.0 255.255.0.0 172.16.51.51
 ip route 10.52.0.0 255.255.0.0 172.16.52.52
 ip route 10.61.0.0 255.255.0.0 172.16.61.61
 ip route 10.62.0.0 255.255.0.0 172.16.62.62
 ip route 10.71.0.0 255.255.0.0 172.16.71.71
 ip route 10.72.0.0 255.255.0.0 172.16.72.72
 ip route 10.81.0.0 255.255.0.0 172.16.81.81
 ip route 10.82.0.0 255.255.0.0 172.16.82.82
 ip route 10.91.0.0 255.255.0.0 172.16.91.91
 ip route 10.92.0.0 255.255.0.0 172.16.92.92
 !
 ip route 10.#$34T#.0.0 255.255.0.0 172.16.#$34T#.#$34T# 255
 end
~~~

<br>
<br>

Verify:

~~~
!@TAAS, BABA, CUCM, EDGE
traceroute 10.11.1.10
traceroute 10.12.1.10
~~~

&nbsp;
---
&nbsp;

### SET NAMESERVER 
> [!IMPORTANT] 
> MUST be WINSERVER.  
> NOT a public DNS

<br>

~~~
!@TAAS, BABA, CUCM, EDGE
conf t
 ip name-server 10.#$34T.1.10
 end
~~~

<br>

Configure WINSERVER with a DNS Forwarder for 8.8.8.8 and 1.1.1.1
