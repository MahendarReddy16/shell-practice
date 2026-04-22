#!/bin/bash

#It terminates the execution when the error occurs.
set -e

echo "Hello World"
#doo
echo Mahi

#We can see that the 7th line is not getting printed as the execution got terminated after the 6th line.

# -ex for the debug
#set -ex

#echo "Hello World"
#echo Mahi


####

set -e # setting the automatic exit, if we get error, set -ex for debug

failure(){
    echo "Failed at: $1:$2"
}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal

echo "Hello World success"
echooooo "Hello Wolrd failure"
echo "Hello World after failure"