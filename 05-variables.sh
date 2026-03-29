#!/bin/bash
#username and password giving in git leads mis use of confidential information, So we need to get data during runtime.
#So we use below to get details during runtime
echo "Please enter your username::"
#read --> used to take the input from the user
read USERNAME

echo "username entered is: $USERNAME"

echo "Please enter your password::"
# read -s --> Used to hide the input provided we use (-s)
read -s PASSWORD

echo "password entered is: $PASSWORD"