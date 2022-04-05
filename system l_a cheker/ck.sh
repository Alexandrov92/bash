#!/bin/bash

INITLIMIT=1.20 #set neded OS load average (l_a) limit, approximate 80%
echo "limit $INITLIMIT"
CORES="$(cat /proc/cpuinfo | grep processor | wc -l)" #find core"s count
echo "cores count: $CORES"  
LIMIT="$(echo "$CORES*$INITLIMIT" | bc -l)" #find approximate l_a limit for our CPU 
echo "local limit $LIMIT" 
while true; do
AVERVALUE="$(uptime | tail -c 17)" # get l_a *viewed like *,**, *,**, *,**
AVERP="$(echo $AVERVALUE | head -c 4  )"; #get load average in 1 minute
AVERCONVERT="$(echo $AVERP | sed "s/[*,*]/./g")" #convert *,** to *.**
if (( "$(echo "$AVERCONVERT >= $LIMIT" | bc -l)" )); then  #use basic calculator to compare 
 echo "ALERT at $(date) average is $AVERCONVERT" >> average_log; #add alert to log_file 
 python3 ck.py $AVERCONVERT $INITLIMIT # translate to python script
fi
sleep 1 # check every 10 seconds
done
