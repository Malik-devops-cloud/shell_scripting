#!/bin/bash

USERID=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

if [ $USERID -ne 0 ]; then
   echo "error::please run this script with root previlage"
   exit 1
fi   

VALIDATE() { 
if [ $1 -ne 0 ]; then
   echo -e "error::installing $2  $R failure $N"
   exit 1
else
   echo -e "installing $2 is $G success $N"
fi   
}

dnf list installed mysql 
if [ $1 -ne 0 ]; then
    dnf install mysql -y
    VALIDATE $? "mysql"
else 
    echo -e "mysql already installed ... $Y skipping $N"    
fi

dnf list installed nginx 
if [ $1 -ne 0 ]; then
   dnf install nginx -y
   VALIDATE $? "nginx"
else 
    echo -e "nginx already installed ... $Y skipping $N"    
fi

dnf list installed python3 
if [ $1 -ne 0 ]; then
   dnf install python3 -y
   VALIDATE $? "python3" 
else 
    echo -e "python3 already installed ... $Y skipping $N"    
fi   