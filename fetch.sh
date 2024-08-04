#!/bin/bash

/sbin/apcaccess status | awk -F': ' '
/^STATUS/ { gsub(/^ *| *$/, "", $2); print $2 }
/^LINEV/ { gsub(/[^0-9.].*/, "", $2); print "LINEV\n" int($2) }
/^LOADPCT/ { gsub(/[^0-9.].*/, "", $2); print "LOADPCT\n" int($2) }
/^BCHARGE/ { gsub(/[^0-9.].*/, "", $2); print "BCHARGE\n" int($2) }
/^TIMELEFT/ { gsub(/[^0-9.].*/, "", $2); print "TIMELEFT\n" int($2) }
'
#  /etc/snmp/snmpd.conf - extend .1.3.6.1.2.1.1.1.1 apcupsd /etc/snmp/apcupsd-upsc0
