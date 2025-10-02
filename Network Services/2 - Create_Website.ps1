# ----------------------------
#  VARIABLES
# ----------------------------
$Monitor = "11"
$ZoneName = "rivan$Monitor.com"

# ----------------------------
#  CREATE WEBSITE
# ----------------------------
New-Website -Name $ZoneName -hostheader "www.$ZoneName" -physicalpath "d:\webs\datingbiz"