#!/bin/bash

NUMBER=$1
COUNT=0

for ((i=1; i<=NUMBER; i++))
 do 
    if [ $((NUMBER % i)) eq 0]; then
    then
       COUNT=$((COUNT+1))
  done

  if [ $COUNT -eq 2 ]; then
     echo "given number $NUMBER is prime number"
  else
     echo "given number $NUMBER is not prime number"   
  fi        
