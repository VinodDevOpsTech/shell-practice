#!/bin/bash

# conditions
NUM=$1

if [ $NUM -gt 20 ]; then
    echo "given number is greater than 20"
else
    echo "given number is less than or equal to 20"
fi
echo "hello world"