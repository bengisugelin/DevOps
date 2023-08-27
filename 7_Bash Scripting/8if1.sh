#!/bin/bash

read -p "Enter a number: " NUM
echo

if [ $NUM -gt 100 ]
then
  echo "We have entered if block."
  sleep 3
   echo "Your number is greater than 100"
   echo
   date
else
echo "You have entered number less than 100"
fi

echo "Script executtion completed successully."
~
