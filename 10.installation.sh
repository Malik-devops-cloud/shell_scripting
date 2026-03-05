#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "error::please run this script with root previlage"
   exit 1
fi   

dnf install mysql -y

if [ $? -ne 0 ]; then
   echo "error::installing mysql is failure"
else
   echo "installing mysql is success"
fi   