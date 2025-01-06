#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

SOURCE_DIR="/var/log/shellscript-logs"

FOLDER_NAME="/var/log/Expense-shell"
FILE_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$FOLDER_NAME/$FILE_NAME-$TIMESTAMP.log"


VALIDATE(){
if [ $1 -ne 0 ]
then
    echo -e "$2 $R FAILURE $N"
else
    echo -e "$2 $G SUCCESS $N"
fi
}

echo "Sript started executing from here":$TIMESTAMP

FILE_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

while read -r file
do 
    echo "deleted files :"$file
    rm -rf $file
done < $FILE_TO_DELETE

