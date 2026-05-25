#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this in root user"
    exit 1
else
    echo "USER:"
fi

FUNCTION(){
    if [ $? -ne 0 ]; then
        echo "installing $1....FAILED"
        exit 1

    else
        echo "installing $1....SUCCESS!!!"
    fi
}

dnf list installed mysql -y
if [ $? -eq 0 ]; then
    echo "mySQL is already installed.... SKIPPING"
    exit 1
else    
    echo "installing mySQL"
    dnf install mysql -y
    FUNCTION MySQL $?
    
fi    
