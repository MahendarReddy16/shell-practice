#!/bin/bash

#Array index starts from 0 and Size from 1

Fruits=("Orange" "KIWI" "Apple" "Banana") #Array

echo "First fruit is: ${Fruits[0]}"
echo "Second fruit is: ${Fruits[1]}"
echo "Third fruit is: ${Fruits[2]}"
echo "Fourth fruit is: ${Fruits[3]}"
echo "Fourth fruit is: $Fruits[3]"

# here @ indicates all names in the list
echo "All fruits is: ${Fruits[@]}"
echo "All fruits is: $Fruits[@]"