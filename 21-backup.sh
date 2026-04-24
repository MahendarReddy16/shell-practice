#!/bin/bash

#/bin/ec2-user/app-logs
#/bin/ec2-user/backup-logs

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}  #If $3 is empty, default is 14 days.

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USAGE(){
    echo -e "$R USAGE: $N sh output.sh <source_path> <dest_path> <days(optional)>"
}
#check the source and destination are provided

if [ $# -lt 2 ]
then 
    USAGE
    exit 1
fi

if [ ! -d $SOURCE_DIR ]
then 
    echo -e "$SOURCE_DIR $R doesn't exist... $N Please check"
    exit 1
fi

if [ ! -d $DEST_DIR ]
then 
    echo -e "$DEST_DIR $R doesn't exist... $N Please check"
    exit 1
fi

FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS)

echo "FILES: $FILES"

if [ ! -z $FILES ] #true if FILES is empty, ! makes it expression false
then 
    echo "Files are found"
    ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip"
    find ${SOURCE_DIR} -name "*.log" -mtime +$DAYS | zip "${ZIP_FILE}" -@

    #Check if the zip file is successfully created or not
    if [ -f $ZIP_FILE ]
    then 
        echo "Files are successfully zipped wihch are older than $DAYS"
        #remove the files after zipping
        while IFS= read -r file  #IFS,internal field seperatpor, empty it will ignore while space.-r is for not to ingore special charecters like /
        do
           echo "Deleting file: $file"
           rm -rf $file
        done <<< $FILES
    else
        echo -e "Zipping files $R FAILED $N"
        exit 1
    fi    
else
    echo -e "No files found $Y folder than $DAYS $N"
fi