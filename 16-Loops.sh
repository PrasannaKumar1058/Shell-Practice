#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "Script started executing at: $(date)" | tee -a $LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR:: Please run this script with root access $N" | tee -a $LOG_FILE
    exit 1 
else
    echo "You are running with root access" | tee -a $LOG_FILE
fi


VALIDATE(){

if [ $1 -eq 0 ]
then
echo -e " $G Installing $2 is success $N" | tee -a $LOG_FILE
else
echo -e " $R Installing $2 is failure. Please check the error and try again $N" | tee -a $LOG_FILE
exit 1
fi
}

#for package in ${PACKAGES[@]}
for package in $@
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed... going to install it" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "$package"
    else
        echo -e "Nothing to do $package... $Y already installed $N" | tee -a $LOG_FILE
    fi
done


# $1 = apple
# $2 = mango
# $3 = banana
# $@ = apple mango banana
# That is the full meaning of $@


# &>> and tee -a
# Both lines use the same log file, but they send output differently
# bash
# &>>"$LOG_FILE" means:
# Send the command’s normal output and error messages into the log file only
# bash
# tee -a "$LOG_FILE" means:
# Show the message on the terminal and also add the same message to the log file