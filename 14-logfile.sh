#!/bin/bash

USERID=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

LOGS_FOLDER=/var/log/shell-script
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FILE
echo "script executing at:$(date)"

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

dnf list installed mysql &>>$LOGS_FILE
if [ $1 -ne 0 ]; then
    dnf install mysql -y &>>$LOGS_FILE
    VALIDATE $? "mysql"
else 
    echo -e "mysql already installed ... $Y skipping $N"    
fi

dnf list installed nginx &>>$LOGS_FILE
if [ $1 -ne 0 ]; then
   dnf install nginx -y &>>$LOGS_FILE
   VALIDATE $? "nginx"
else 
    echo -e "nginx already installed ... $Y skipping $N"    
fi

dnf list installed python3 &>>$LOGS_FILE
if [ $1 -ne 0 ]; then
   dnf install python3 -y &>>$LOGS_FILE
   VALIDATE $? "python3" 
else 
    echo -e "python3 already installed ... $Y skipping $N"    
fi   