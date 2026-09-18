#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1) 
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log" 


#Use the variable name without $ when you are assigning a value to that variable. Use $ when you want Bash to read and use the value already stored in it.

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1

else
echo -e " $G You are runnig with root privilages $N" | tee -a $LOG_FILE

fi

# validate functions takes input as exit status, what command they tried to install

VALIDATE(){

if [ $1 -eq 0 ]
then
echo -e " $G Installing $2 is success $N" | tee -a $LOG_FILE
else
echo -e " $R Installing $2 is failure. Please check the error and try again $N" | tee -a $LOG_FILE
exit 1
fi
}

dnf list installed mysql &>>$LOG_FILE

if [ $? -ne 0 ]
then
echo -e " $R MySql is not installed $N. $Y Installing the MySql package in your system $N" | tee -a $LOG_FILE
dnf install mysql -y &>>$LOG_FILE

VALIDATE $? "MYSql"

else
echo -e " $G MySql is already installed in your system $N" | tee -a $LOG_FILE

fi 




dnf list installed nginx &>>$LOG_FILE

if [ $? -ne 0 ]
then
echo -e " $R Nginx is not installed $N. $Y Installing the Nginx package in your system $N" | tee -a $LOG_FILE
dnf install nginx -y &>>$LOG_FILE

VALIDATE $? "Nginx"

else
echo -e " $G Nginx is already installed in your system $N" | tee -a $LOG_FILE

fi 




dnf list installed python3 &>>$LOG_FILE

if [ $? -ne 0 ]
then
echo -e " $R Python3 is not installed $N. $Y Installing the Python3 package in your system $N" | tee -a $LOG_FILE
dnf install python3 -y &>>$LOG_FILE

VALIDATE $? "Python3"

else
echo -e " $G Python3 is already installed in your system $N" | tee -a $LOG_FILE

fi 