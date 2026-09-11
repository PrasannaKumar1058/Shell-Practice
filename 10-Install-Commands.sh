#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Please run this script with root privilages"
exit 1

else
echo "You are runnig with root privilages"

fi

dnf install mysql -y

if [ $? -eq 0 ]
then
echo "Installing mysql is success"

else

echo "Installing mysql is failure. Please check the error and try again"
exit 1

fi
