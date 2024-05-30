#!/bin/bash
mem_line=""
process_line=""
swap_line=""

mem_csv=""
swap_csv=""
process_info_csv=""
top5_csv=""

if [[ $1 == "mem.sh" ]]; then
    mem_line=$(echo "help_raws/1mem_line.txt")
    process_line=$(echo "help_raws/1process_line.txt")
    swap_line=$(echo "help_raws/1swap_line.txt")

    mem_csv=$(echo "csvs/1mem.csv")
    swap_csv=$(echo "csvs/1swap.csv")
    process_info_csv=$(echo "csvs/1process_info.csv")
    top5_csv=$(echo "csvs/1top5.csv")
elif [[ $1 == "mem2.sh" ]]; then
    mem_line=$(echo "help_raws/2mem_line.txt")
    process_line=$(echo "help_raws/2process_line.txt")
    swap_line=$(echo "help_raws/2swap_line.txt")

    mem_csv=$(echo "csvs/2mem.csv")
    swap_csv=$(echo "csvs/2swap.csv")
    process_info=$(echo "csvs/2process_info.csv")
    top5_csv=$(echo "csvs/2top5.csv")
fi

echo "total,free,used,buff" > "$mem_csv"
echo "total,free,used,avail_mem" > "$swap_csv"
echo "pid,user,pr,ni,virt,res,shr,s,cpu,mem,time,command" > "$process_info_csv"
echo "first_pid,first_mem,second_pid,second_mem,third_pid,third_mem,fourth_pid,fourth_mem,fifth_pid,fifth_mem" > "$top5_csv"

echo "info from MiB Mem line" > "$mem_line"
echo "info from MiB Swap line" > "$swap_line"

while true; do
    pid=$(ps -ef | grep -i "$1" | grep -v "grep" | grep -v "observer" | awk  '{print $2}')

    top_output=$(top -b -n 1)

    echo $(echo "$top_output" | head -n 12 | tail -n 5 | awk '{printf "%s,%s,", $1, $10}' | sed 's/,$//') >> "$top5_csv"
    
    if [[ -z $pid ]]; then
        echo "waiting for start script"
    else
        echo "$top_output" | grep -w "MiB Mem" > "$mem_line"
        echo "$top_output" | grep -w "MiB Swap" > "$swap_line"
        echo "$top_output" | grep -w "$pid root" > "$process_line"

        cat "$mem_line" | awk '{print $4","$6","$8","$10}' >> "$mem_csv"
        cat "$swap_line" | awk '{print $3","$5","$7","$9}' >> "$swap_csv"
        cat "$process_line" | awk '{print $1","$2","$3","$4","$5","$6","$7","$8","$8","$9","$10","$11","$12}' >> "$process_info_csv"
    fi
done
