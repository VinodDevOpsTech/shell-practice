#! /bin/bash

startTime=$(date +%s)

sleep 10
endTime=$(date +%s)

totalTime=$((startTime-endTime))
echo "total time is: $totalTime"