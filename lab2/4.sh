#!/bin/bash

# Для всех зарегистрированных в данный момент в системе процессов 
# определить среднее время непрерывного использования процессора (CPU_burst) и 
# вывести в один файл строки 
# ProcessID=PID : Parent_ProcessID=PPID : Average_Running_Time=ART. 
# Значения PPid взять из файлов status, которые находятся в директориях с названиями, 
# соответствующими PID процессов в /proc. Значения ART получить, разделив значение sum_exec_runtime 
# на nr_switches, взятые из файлов sched в этих же директориях. Отсортировать эти строки по идентификаторам 
# родительских процессов.

#!/bin/bash

output_file="4_output"

for pid_dir in /proc/[0-9]*/; do
    pid=$(basename "$pid_dir")
    ppid=$(grep -s "PPid:" "$pid_dir/status" | awk '{print $2}')
    sum_exec_runtime=$(grep -s "se.sum_exec_runtime" "$pid_dir/sched" | awk -F: '{print $2}' | tr -d ' ')
    nr_switches=$(grep -s "nr_switches" "$pid_dir/sched" | awk -F: '{print $2}'| tr -d ' ')
    art=()
    for ((i=0; i<${#sum_exec_runtime[@]}; i++)); do
        div=$(bc <<< "scale=2; ${sum_exec_runtime[$i]} / ${nr_switches[$i]}")
        art+=($div)
    done
    formatted_string="ProcessID=$pid : Parent_ProcessID=$ppid : Average_Running_Time=$art"
    echo "$formatted_string"
done | sort -t '=' -k3n > "$output_file"