#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$2 is... FAILED"
    else  
        echo "$2 is... SUCCESS"
    fi 
}
if [ $USERID -ne 0 ]
then
    echo "Root Priveleges required"
    exit 1
fi

dnf list installed git # To check whether git is installed or not

if [ $? -ne 0 ]
then
    echo " Git is not installed.. intalling it"
    dnf install git -y #installing here 
    VALIDATE $? "Installing Git"
else
    echo "Git is already installed, nothing to do..."
fi


dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "MySQL is not installed...going to install"
    dnf install mysql -y
    VALIDATE $? "Installing MySQL"
else
    echo "MySQL is already installed..nothing to do"
fi


   
    