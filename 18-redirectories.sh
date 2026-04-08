#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIME_SCRIPT=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u)
R="\e[31m" #Red Color
G="\e[32m" #Green Color
N="\e[0m" #Normal color
Y="\e[33m" #Yellow color

CHECK_ROOT(){
    if [$USERID -ne 0 ]
    then
        echo -e "$R Root Priveleges required $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N" | tee -a $LOG_FILE
    else  
        echo -e "$2 is... $G SUCCESS $N" | tee -a $LOG_FILE
    fi 
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 16-redirectories.sh package1 package2..."
    exit 1
}

echo ":Script started execution at: $(date)" | tee -a $LOG_FILE

CHECK_ROOT

if [$# -eq 0]
then
    USAGE
fi

# sh 15_for-loop.sh git mysql postfix nginx
for package in $@ # $@ refers to all the arguments passed to it
do 
   dnf list installed $package &>>$LOG_FILE # To check whether package is installed or not
   if [$? -ne 0]
   then
       echo "$package is not installed.. intalling it" | tee -a $LOG_FILE
       dnf install $package -y &>>$LOG_FILE #installing here 
       VALIDATE $? "Installing $package"
   else
       echo -e "$package is already  $Y installed, nothing to do...$N" | tee -a $LOG_FILE
   fi
done