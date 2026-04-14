#!/bin/bash

USERID=$(id -u)
R="\e[31m" #Red Color
G="\e[32m" #Green Color
N="\e[0m" #Normal color

CHECK_ROOT(){
    if [$USERID -ne 0 ]
    then
        echo "Root Priveleges required"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is...$R FAILED $N"
    else  
        echo -e "$2 is... $G SUCCESS $N"
    fi 
}

CHECK_ROOT

# sh 15_for-loop.sh git mysql postfix nginx
for package in $@ # $@ refers to all the arguments passed to it
do 
   dnf list installed $package # To check whether package is installed or not
   if [ $? -ne 0 ]
   then
       echo " $package is not installed.. intalling it"
       dnf install $package -y #installing here 
       VALIDATE $? "Installing $package"
   else
       echo "$package is already installed, nothing to do..."
   fi
done



   
    