#!/bin/bash

#It terminates the execution when the error occurs.
set -e

echo "Hello World"
#doo
echo Mahi

#We can see that the 7th line is not getting printed as the execution got terminated after the 6th line.

# -ex for the debug
set -ex

echo "Hello World"
echo Mahi

