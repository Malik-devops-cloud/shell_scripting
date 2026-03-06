#!/bin/bash

USERID=$(id -u)


R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[37m"

LOGS_FOLDER=/var/log/shell-script
SCRIPT_NAME=$( echo $0 | cut -d "." -f1 )
LOGS_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script executing at: $(date)" | tee -a $LOGS_FILE

if [ $USERID -ne 0 ]; then
   echo "error::please run this script with root previlage"
   exit 1
fi   

VALIDATE() { 
if [ $1 -ne 0 ]; then
   echo -e "error::installing $2  $R failure $N" | tee -a $LOGS_FILE
   exit 1
else
   echo -e "installing $2 is $G success $N" | tee -a $LOGS_FILE
fi   
}

#$@

for package in $@
 do 
   dnf list installed $package &>>$LOGS_FILE
     if [ $? -ne 0]; then
        dnf install $package -y &>>$LOGS_FILE
        validate $? "$package"
   else 
        echo "$package is already installed"
done    