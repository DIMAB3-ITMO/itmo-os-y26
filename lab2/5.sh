#!/bin/bash

# В полученном на предыдущем шаге файле после каждой группы записей с 
# одинаковым идентификатором родительского процесса вставить строку вида 
# Average_Running_Children_of_ParentID=N is M, где N = PPID, а M – среднее, 
# посчитанное из ART для всех процессов этого родителя

output_file="4_output"

total_time=0
count=0
prev_ppid=""

while IFS= read -r line; do
    parend_id_line=$(awk -F':' '{print $2}' <<< "$line")
    ppid=$(awk -F'=' '{print $2}' <<< "$parend_id_line")
    art_line=$(awk -F':' '{print $3}' <<< "$line")
    art=$(awk -F'=' '{print $2}' <<< "$art_line")
    
    if [[ "$ppid" == "$prev_ppid" ]]; then
        total_time=$(bc <<< "$total_time + $art")
        ((count++))
    else
        if [[ "$prev_ppid" != "" ]]; then
            average=$(bc -l <<< "$total_time / $count")
            sed -i -e "/$line/a \Average_Running_Children_of_ParentID=$prev_ppid is $average" "$output_file"
        fi

        total_time=$art
        count=1
        prev_ppid=$ppid
    fi

done < "$output_file"