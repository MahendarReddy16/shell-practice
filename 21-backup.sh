#!/bin/bash

#/bin/ec2-user/app-logs
#/bin/ec2-user/backup-logs

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE () {
    echo -e "$R USAGE: $N sh output.sh <source_path> <dest_path> <days(optional)>"
}

if [ $# -lt 2 ]
then 
    USAGE
    exit 1
fi

if [ -d $SOURCE_DIR ]
then 
    echo -e "$SOURCE_DIR $R doesn't exist... $N Please check"
fi

if [ -d $DEST_DIR ]
then 
    echo -e "$DIST_DIR $R doesn't exist... $N Please check"
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime ${DAYS})
echo "FILES: $FILES"
