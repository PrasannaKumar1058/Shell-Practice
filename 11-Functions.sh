#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Please run this script with root privilages"
exit 1

else
echo "You are runnig with root privilages"

fi

VALIDATE(){

if [ $1 -eq=0 ]
then
echo "Installing $2 is success"
else
echo "Installing $2 is failure. Please check the error and try again"
exit 1
fi
}

dnf list installed MySql

if [ $? -ne 0 ]
then
echo "MySql is not installed. Installing the MySql package in your system"
dnf install mysql -y

VALIDATE $1 "MYSql"

else
echo "MySql is already installed in your system"

fi 




dnf list installed Nginx

if [ $? -ne 0 ]
then
echo "Nginx is not installed. Installing the Nginx package in your system"
dnf install nginx -y

VALIDATE $1 "Nginx"

else
echo "Nginx is already installed in your system"

fi 




dnf list installed Python3

if [ $? -ne 0 ]
then
echo "Python3 is not installed. Installing the Python3 package in your system"
dnf install python3 -y

VALIDATE $1 "Python3"

else
echo "Python3 is already installed in your system"

fi 