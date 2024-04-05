#!/bin/bash

file1="inf1.sh"
file2="inf2.sh"
file3="inf3.sh"

bash inf1.sh &
pid_1=($(pidof -f "$file_1"))

bash inf2.sh &
pid_2=($(pidof -f "$file_2"))

bash inf3.sh &
pid_3=($(pidof -f "$file_3"))

echo "$pid_1, $pid_2, $pid_3"

renice -p "$pid_1" +10

kill "$pid_3"