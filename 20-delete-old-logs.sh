#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

if [ -d $SOURCE_DIR ]
then
   echo -e "$SOURCE_DIR $G exist $N"
else
   echo "$SOURCE_DIR $R doesn't exist $N"
   exit 1
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +14)
echo "Logs Files older than 14days: $FILES"

#Used to read the output or reading the files
#IFS(Internal Field Seperator), empty it will ignore while space -r is for to not to ignore special charcters like /

while IFS= read -r line
do 
   echo "deleting old logs"
   rm -rf  $line
done <<< $FILES