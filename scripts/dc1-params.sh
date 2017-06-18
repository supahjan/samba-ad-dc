INTERFACE_NAME="enp0s17"
IP_ADDRESS="10.45.10.3"
SUBNET_MASK="255.255.254.0"
GATEWAY="10.45.11.254"
DOMAIN_FQDN="sfg.ad.sd57.bc.ca"
DOMAIN="SFG"
REALM="SFG.AD.SD57.BC.CA"
ADMIN_PASSWORD="secRet!23"
HOSTNAME="dc1"
NTP_SERVER1="time.sd57.bc.ca"
REV_DNS_ZONE="10.45.10.in-addr.arpa"

HOST_NUM=$(echo ${IP_ADDRESS} | cut -f4 -d.)

if which smbd >&/dev/null; then
CONFIGFILE=$(smbd -b |egrep CONFIGFILE |cut -f2- -d':' |sed 's/^ *//')
LOCKDIR=$(smbd -b |egrep LOCKDIR |cut -f2- -d':' |sed 's/^ *//')
STATEDIR=$(smbd -b |egrep STATEDIR |cut -f2- -d':' |sed 's/^ *//')
CACHEDIR=$(smbd -b |egrep CACHEDIR |cut -f2- -d':' |sed 's/^ *//')
PRIVATE_DIR=$(smbd -b |egrep PRIVATE_DIR |cut -f2- -d':' |sed 's/^ *//')
fi
