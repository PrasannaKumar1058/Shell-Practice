#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo "Please run this script with root privilages"
exit 1

else
echo "You are runnig with root privilages"

fi

dnf list installed mysql

if [ $? -ne 0 ]
then
echo "MySQL is not installed. Installing the MySQL package in your system"
dnf install mysql -y

if [ $? -eq 0 ]
then
echo "Installing mysql is success"

else

echo "Installing mysql is failure. Please check the error and try again"
exit 1

fi

else
echo "MySQL is already installed in your system"

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