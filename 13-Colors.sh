#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"

if [ $USERID -ne 0 ]
then
echo -e " $R Please run this script with root privilages $N"
exit 1

else
echo -e " $G You are runnig with root privilages $N"

fi

VALIDATE(){

if [ $1 -eq 0 ]
then
echo -e " $G Installing $2 is success $N"
else
echo -e " $R Installing $2 is failure. Please check the error and try again $N"
exit 1
fi
}

dnf list installed MySql

if [ $? -ne 0 ]
then
echo -e " $R MySql is not installed $N. $Y Installing the MySql package in your system $N"
dnf install mysql -y

VALIDATE $? "MYSql"

else
echo -e " $G MySql is already installed in your system $N"

fi 




dnf list installed Nginx

if [ $? -ne 0 ]
then
echo -e " $R Nginx is not installed $N. $Y Installing the Nginx package in your system $N"
dnf install nginx -y

VALIDATE $? "Nginx"

else
echo -e " $G Nginx is already installed in your system $N"

fi 




dnf list installed Python3

if [ $? -ne 0 ]
then
echo -e " $R Python3 is not installed $N. $Y Installing the Python3 package in your system $N"
dnf install python3 -y

VALIDATE $? "Python3"

else
echo -e " $G Python3 is already installed in your system $N"

fi 