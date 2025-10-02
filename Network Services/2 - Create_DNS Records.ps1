# ----------------------------
#  VARIABLES
# ----------------------------
$Monitor = "11"

$ServerIP = "10"
$ZoneName = "rivan$Monitor.com"

# ----------------------------
#  DNS RECORDS
# ----------------------------
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "@" -IPv4Address "10.$Monitor.1.$ServerIP" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "ns" -IPv4Address "10.$Monitor.1.$ServerIP" -CreatePTR

Add-DnsServerResourceRecord -ZoneName $ZoneName -CName -Name "www" -HostName "$ZoneName"
Add-DnsServerResourceRecord -ZoneName $ZoneName -CName -Name "imap" -HostName "$ZoneName"
Add-DnsServerResourceRecord -ZoneName $ZoneName -CName -Name "pop" -HostName "$ZoneName"
Add-DnsServerResourceRecord -ZoneName $ZoneName -CName -Name "smtp" -HostName "$ZoneName"

Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "mail" -IPv4Address "10.$Monitor.1.$ServerIP"
Add-DnsServerResourceRecord -ZoneName $ZoneName -MX -Name "@" -MailExchange "mail.$ZoneName" -Preference 10

# Day1 Devices
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "ct" -IPv4Address "10.$Monitor.1.2" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "cb" -IPv4Address "10.$Monitor.1.4" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "cm" -IPv4Address "10.$Monitor.100.8" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "ed" -IPv4Address "10.$Monitor.$Monitor.1" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "p1" -IPv4Address "10.$Monitor.100.101" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "p2" -IPv4Address "10.$Monitor.100.102" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "c1" -IPv4Address "10.$Monitor.50.6" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "c2" -IPv4Address "10.$Monitor.50.8" -CreatePTR
Add-DnsServerResourceRecord -ZoneName $ZoneName -A -Name "ap" -IPv4Address "10.$Monitor.10.3" -CreatePTR
