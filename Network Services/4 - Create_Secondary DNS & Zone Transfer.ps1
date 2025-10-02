# ----------------------------
#  VARIABLES
# ----------------------------
$Monitor = "11"

$ServerIP = "10"
$ZoneName = "rivan$Monitor.com"
$ClassMonitors = @(
    "11"
    "12"
    "21"
    "22"
    "31"
    "32"
    "41"
    "42"
    "51"
    "52"
    "61"
    "62"
    "71"
    "72"
    "81"
    "82"
    "91"
    "92"
)

# List of other DNS Server IPs
$NotifyList = @()
foreach ($record in $ClassMonitors) {
    if ($Monitor -ne $record) {
        $NotifyList += "10.$record.1.$ServerIP"
    }
}


# ----------------------------
#  DNS SECONDARY ZONE
# ----------------------------

# SECONDARY
foreach ($Record in $ClassMonitors) {
    if ($Record -ne $Monitor) {
        Add-DnsServerSecondaryZone -Name "rivan$Record.com" -ZoneFile "rivan$Record.com.dns" -MasterServers "10.$Record.1.$ServerIP"
    }
}

# Modify Zone Transfer
    Set-DnsServerPrimaryZone -name $ZoneName -SecureSecondaries TransferAnyServer -Notify NotifyServers -NotifyServers $NotifyList
