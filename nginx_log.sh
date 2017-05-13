#!/bin/bash
mkdir -p ./result
LogFile=/root/access.log
if [ "$1" = 'IP' ]; then
awk '{print $1}' $LogFile | sort | uniq -c | sort -rn > ./result/Ipbased_hotlist_stat
fi
if [ "$1" = 'RESPONSE' ]; then
awk '{print $9}' $LogFile | sort | uniq -c | sort -rn > ./result/Responsecode_based_stat 
fi
if [ "$1" = 'USERAGENT' ]; then
awk -F'"' '/GET/ {print $6}' $LogFile | cut -d' ' -f1 | sort | uniq -c | sort -rn  > ./result/Useragentbased_stat 
fi
if [ "$1" = 'URL' ]; then
awk -F\" '{print $2}' $LogFile | awk '{print $2}' | sort | uniq -c | sort -r > ./result/Mostrequested_url_stat
fi
cat $LogFile  | grep -i "MISS" > ./result/Miss_stat
cat $LogFile  | grep -i "HIT" > ./result/Hit_stat

MISS=`cat $LogFile  | grep -i "MISS" | wc -l`
echo "MISS : $MISS"
HIT=`cat $LogFile  | grep -i "HIT" | wc -l`
echo "HIT : $HIT"
RATIO=$((HIT/MISS))
echo "HIT/MISS RATIO : $RATIO" 