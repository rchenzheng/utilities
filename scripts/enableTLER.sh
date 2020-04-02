#!/bin/bash
#enable TLER on Synology NAS
#add script to /usr/local/etc/rc.d/  


drives=$(smartctl --scan | grep '/dev/sd' | awk '{print $1}')

for drive in $drives; do
    smartctl -d sat -l scterc,70,70 "$drive"
done
