#!/bin/bash

# Используя псевдофайловую систему /proc найти процесс, 
# которому выделено больше всего оперативной памяти. 
# Сравнить результат с выводом команды top.

max_mem=0
max_pid=0

for pid_dir in /proc/[0-9]*/; do
    pid=$(basename "$pid_dir")
    mem=$(awk '/VmRSS/ {print $2}' "$pid_dir/status")

    if [[ -n $mem && $mem -gt $max_mem ]]; then # -n -string not empty
        max_mem=$mem
        max_pid=$pid
    fi
done

echo "Process with PID $max_pid has allocated the most memory: $max_mem KB"
