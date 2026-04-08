#!/bin/bash

USERID=$(id -u)

if[$USERID -ne 0]
then
    echo "Root Priveleges required"
    exit 1
fi

dnf list installed git # To check whether git is installed or not

if[$? -ne 0]
then
    echo " Git is not installed.. intalling it"
    dnf install git -y #installing here 
    if[$? -ne 0]
    then 
        echo "Git installation failed.. check on it"
    else
        echo "Git is successfully installed"
    fi
else
    echo "Git is already installed, nothing to do..."
fi


 dnf list installed mysql # To check whether mysql is installed or not

if[$? -ne 0]
then
    echo " mysql is not installed.. intalling it"
    dnf install mysql -y #installing here 
    if[$? -ne 0]
    then 
        echo "mysql installation failed.. check on it"
    else
        echo "mysql is successfully installed"
    fi
else
    echo "mysql is already installed, nothing to do..."
fi
   
    