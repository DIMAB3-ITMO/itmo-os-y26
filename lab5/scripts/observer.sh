#!/bin/bash
echo "total,free,used,buff" > "csvs/mem.csv"
echo "total,free,used,avail_mem" > "csvs/swap.csv"

echo "info from MiB Mem line" > "help_raws/mem_line.txt"
echo "info from MiB Swap line" > "help_raws/swap_line.txt"

catched_flag=1

while true; do
    pid=$(ps -ef | grep -i "mem.sh" | grep -v "grep" | grep -v "observer" | awk  '{print $2}')
    if [[ -z $pid ]]; then
        echo "waiting for start script"
    else
        top -b -n 1 | grep -w "MiB Mem" >> "help_raws/mem_line.txt"
        top -b -n 1 | grep -w "MiB Swap" >> "help_raws/swap_line.txt"
        cat "help_raws/mem_line.txt" | awk '{print $4","$6","$8","$10}' >> "csvs/mem.csv"
        cat "help_raws/swap_line.txt" | awk '{print $3","$5","$7","$9}' >> "csvs/swap.csv"
    fi
done
