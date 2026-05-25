#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "ERROR: please run this in root user"
    exit 1
else
    echo "run this in root user"
fi
