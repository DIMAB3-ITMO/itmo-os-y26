#!/bin/bash
echo "total,free,used,buff" > "csvs/mem.csv"
echo "total,free,used,avail_mem" > "csvs/swap.csv"
echo "pid,user,pr,ni,virt,res,shr,s,cpu,mem,time,command" > "csvs/process_info.csv"

echo "info from MiB Mem line" > "help_raws/mem_line.txt"
echo "info from MiB Swap line" > "help_raws/swap_line.txt"

while true; do
    pid=$(ps -ef | grep -i "mem.sh" | grep -v "grep" | grep -v "observer" | awk  '{print $2}')
    if [[ -z $pid ]]; then
        echo "waiting for start script"
    else
        top_output=$(top -b -n 1)

        echo "$top_output" | grep -w "MiB Mem" > "help_raws/mem_line.txt"
        echo "$top_output" | grep -w "MiB Swap" > "help_raws/swap_line.txt"
        echo "$top_output" | grep -w "$pid root" > "help_raws/process_line.txt"

        cat "help_raws/mem_line.txt" | awk '{print $4","$6","$8","$10}' >> "csvs/mem.csv"
        cat "help_raws/swap_line.txt" | awk '{print $3","$5","$7","$9}' >> "csvs/swap.csv"
        cat "help_raws/process_line.txt" | awk '{print $1","$2","$3","$4","$5","$6","$7","$8","$8","$9","$10","$11","$12}' >> "csvs/process_info.csv"
    fi
done
