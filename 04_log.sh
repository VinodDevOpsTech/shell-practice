

#!/bin/bash

USERID=$(id -u)
LOG_DIR=/home/ec2-user/shell-log
LOG_FILE=$LOG_DIR/$0.log

if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this in root user"
    exit 1
fi

#first arg -> What are you trying to install
#second arg -> Exit Code

FUNCTION(){
    if [ $? -ne 0 ]; then
        echo "installing $1....FAILED"
        exit 1

    else
        echo "installing $1....SUCCESS!!!"
    fi
}

dnf list installed mysql -y &>>$LOG_FILE
if [ $? -eq 0 ]; then
    echo "mySQL is already installed.... SKIPPING"
    exit 1
else    
    echo "installing mySQL"
    dnf install mysql -y &>>$LOG_FILE
    FUNCTION MySQL $?
    
fi    