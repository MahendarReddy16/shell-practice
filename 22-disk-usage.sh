#!/bin/bash

DISK_USAGE=$(df -hT | grep Xfs)
DISK_THRESHOLD=5

while IFS= read -r line
do
USAGE=$(echo $line | grep Xfs | awk -F " " {print $6F} | cut -d "%" -f1)
PARTITION=$(echo $line | grep Xfs | awk -F " " {print $NF})

if [ $USAGE -gt $DISK_THRESHOLD ]
then 
    echo "$PARTITION is greater than the $DISK_THRESHOLD, current value $USAGE, please check"
fi
done <<< $DISK_USAGE