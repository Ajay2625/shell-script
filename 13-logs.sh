#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

FILE_FOLDER_NAME="/var/log/shell-scripting.logs"
LOG_FILE=$(echo "$0" | cut -d "." -f)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$FILE_FOLDER_NAME/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .... $R FAILURE $N"
        exit 1
    else
        echo -e "$2... $G SUCCESS $N"
    fi
}

echo "Script started executing at : $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
then
    echo "ERROR:: you must have sudo access to exicute this script"
    exit 1
fi

dnf list installed mysql &>>$LOG_FILE_NAME


if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME

    VALIDATE $? "Installing Mysql"
else
    echo -e "MYSQL already .... $Y INSTALLED $N"
fi

dnf list installed git &>>$LOG_FILE_NAME


if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME

    VALIDATE $? "Installing Git"
else
    echo -e "GIT Already... $Y INSTALLED $N"
fi 
