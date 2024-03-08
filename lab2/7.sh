#!/bin/bash

# Написать скрипт, определяющий три процесса, которые за 1 минуту, 
# прошедшую с момента запуска скрипта, считали максимальное количество байт из устройства 
# хранения данных. Скрипт должен выводить PID, строки запуска и объем считанных данных, 
# разделенные двоеточием.

chars_after_sleep=()
chars_before_sleep=()
initial_pids=()
cmdlines=()

for pid in $(ps -axo pid); do
    if [[ -r /proc/$pid/io ]]; then
        initial_pids[$pid]=$pid
        chars_before_sleep[$pid]=$(grep -s "rchar" "/proc/$pid/io" | awk '{print $2}')
        cmdlines[$pid]=$(cat "/proc/$pid/cmdline" | tr -d '\0')
    fi
done

sleep 2

for pid in $(ps -axo pid); do
    chars_after_sleep[$pid]=$(grep -s "rchar" "/proc/$pid/io" | awk '{print $2}')
done


for pid in "${initial_pids[@]}"; do
    diff=($(echo "${chars_after_sleep[$pid]}"-"${chars_before_sleep[$pid]}" | bc))
    cmd="${cmdlines[$pid]}"
    echo "$pid:$diff:$cmd" >> "7_output"
done 

sort -t ':' -n -r -k 2 "7_output" | head -3