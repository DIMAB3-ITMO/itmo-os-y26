#!/bin/bash

process_name=$1

while true; do
    # if ps aux | grep -v grep | grep -q "$process_name"; then
    # if ps -eo cmd | grep -s "$proccess_name"; then
    pid=$(ps -ef | grep -i "inf.sh" | grep -v "grep" | grep -v "monitor" | awk  '{print $2}')
    echo "$pid"
    if [[ -z $pid ]]; then
        echo "waiting for start script"
    else
        echo "$process_name is running!!!!!! I will catch it"
        
        sleep "$2"
        
        # pkill -f "$process_name"
        kill -9 $pid
        exit
    fi
    sleep 1
done