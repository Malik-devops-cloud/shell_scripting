#!/bin/bash

USERID=$(id -u)

if [ $USERID -nq 0 ]; then
   echo "error::please run this script with root previlage"
fi   

dnf install mysql -y

if [ $? -nq 0 ]; then
   echo "error::installing mysql is failure"
else
   echo "installing mysql is success"
fi   