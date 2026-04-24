#!/bin/bash

SOURCE_DIR=/home/ec2-user/logs

if [ -d $SOURCE_DIR ]
then
   echo "$SOUREC_DIR exist"
else
   echo "$SOURCE_DIR doesn't exist"
   exit
fi