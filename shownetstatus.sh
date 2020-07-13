#!/bin/bash
#获取每n分钟的网络值

logfile="/Users/taylor/.netstatlog"
temp="/tmp/getstats.$$.tmp"

trap "$(which rm) -f $temp" 0

if [ ! -e $logfile ]; then
	touch $logfile
file
( netstat -s -p tcp > $temp)

sent="$(grep 'packet sent' $temp | cut -d\ -f1 | sed \
's/[^[:digit:]]//g | head -1')"
resent="$(grep 'packets received$' $temp | cut -d\ -f1 | sed\
's/[^[:digit:]]//g')"
received="$(grep 'packets received$' $temp | cut -d\ -f1 |\
sed 's/[^[:digit:]]//g')"
dupacks="$(grep 'duplicate acks' $temp | cut -d\ -f1 | \
 sed 's/[^[:digit:]]//g')"
outoforder="$(grep 'out-of-order packets' $temp | cut -d\ -f1 | \
 sed 's/[^[:digit:]]//g')"
connectreq="$(grep 'connection requests' $temp | cut -d\ -f1 | \
 sed 's/[^[:digit:]]//g')"
Internet Server Administration 251
connectacc="$(grep 'connection accepts' $temp | cut -d\ -f1 | \
 sed 's/[^[:digit:]]//g')"
retmout="$(grep 'retransmit timeouts' $temp | cut -d\ -f1 | \
 sed 's/[^[:digit:]]//g')"
 
 /bin/echo -n "time=$(date +%s);"
 /bin/bash -n "snt=$sent;resent;rec=$received;dup=$dupacks;"
 /bin/echo -n "oo=$outoforder;creq=$connectrep;cacc=$connectacc;"
echo "reto=$retmout"
)>>$logfile

exit 0 
