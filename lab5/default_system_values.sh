#!/bin/bash
report_file="lab5_report.md"

page_size=$(getconf PAGE_SIZE)
total_mem=$(free | grep "Mem:" | awk '{print $2}')
free_mem=$(free | grep "Mem:" | awk '{print $4}')
swap_total_mem=$(free | grep "Swap:" | awk '{print $2}')
swap_free_mem=$(free | grep "Swap:" | awk '{print $4}')

echo "Общий объем оперативной памяти: $total_mem" > "$report_file"
echo "Объем раздела подкачки: $swap_total_mem" >> "$report_file"
echo "Размер страницы виртуальной памяти: $page_size" >> "$report_file"
echo "Объем свободной физической памяти в ненагруженной системе: $free_mem" >> "$report_file"
echo "Объем свободного пространства в разделе подкачки в ненагруженной системе: $swap_free_mem" >> "$report_file"