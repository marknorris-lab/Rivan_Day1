# ----------------------------
#  VARIABLES
# ----------------------------
$Monitor = "11"

$ServerIP = "10"
$ZoneName = "rivan$Monitor.com"

# ReverseLookup
$NetworkID_1 = "10.$Monitor.1.0/24"
$NetworkID_10 = "10.$Monitor.10.0/24"
$NetworkID_50 = "10.$Monitor.50.0/24"
$NetworkID_100 = "10.$Monitor.100.0/24"
$NetworkID_ = "10.$Monitor.$Monitor.0/24"

$RevZoneName_1 = "1.$Monitor.10.in-addr.arpa"
$RevZoneName_10 = "10.$Monitor.10.in-addr.arpa"
$RevZoneName_50 = "50.$Monitor.10.in-addr.arpa"
$RevZoneName_100 = "100.$Monitor.10.in-addr.arpa"
$RevZoneName_ = "$Monitor.$Monitor.10.in-addr.arpa"


# ----------------------------
#  DNS FORWARD LOOKUP ZONE
# ----------------------------
# PRIMARY
Add-DnsServerPrimaryZone -name $ZoneName -ZoneFile "$ZoneName.dns" -DynamicUpdate NonSecureAndSecure


# ----------------------------
#  DNS REVERSE LOOKUP ZONE
# ----------------------------
# ReverseLookupZone
Add-DnsServerPrimaryZone -NetworkId $NetworkID_1 -ZoneFile $RevZoneName_1 -DynamicUpdate NonSecureAndSecure
Add-DnsServerPrimaryZone -NetworkId $NetworkID_10 -ZoneFile $RevZoneName_10 -DynamicUpdate NonSecureAndSecure
Add-DnsServerPrimaryZone -NetworkId $NetworkID_50 -ZoneFile $RevZoneName_50 -DynamicUpdate NonSecureAndSecure
Add-DnsServerPrimaryZone -NetworkId $NetworkID_100 -ZoneFile $RevZoneName_100 -DynamicUpdate NonSecureAndSecure
Add-DnsServerPrimaryZone -NetworkId $NetworkID_ -ZoneFile $RevZoneName_ -DynamicUpdate NonSecureAndSecure
