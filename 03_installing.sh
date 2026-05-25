#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this in root user"
    exit 1
else
    echo "USER:"
fi

dnf list installed mysql -y
if [ $? -eq 0 ]; then
    echo "mySQL is already installed.... SKIPPING"
    exit 1
else    
    echo "installing mySQL"
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "installing mySQL....FAILED"
        exit 1

    else
        echo "installing mySQL....SUCCESS!!!"
    fi
fi    
