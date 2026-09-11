#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Please run this script with root privilages"
exit 1

else
echo "You are runnig with root privilages"

fi

dnf list installed Nginx

if [ $? -ne 0 ]
then
echo "Nginx is not installed. Installing the Nginx package in your system"
dnf install nginx -y

if [ $? -eq 0 ]
then
echo "Installing nginx is success"

else

echo "Installing nginx is failure. Please check the error and try again"
exit 1

fi

else
echo "Nginx is already installed in your system"

fi 

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
# echo "Installing mysql is success"

# else

# echo "Installing mysql is failure. Please check the error and try again"
# exit 1

# fi




































# To check if the package is installed or not, you can use the following command:
# dnf list installed mysql