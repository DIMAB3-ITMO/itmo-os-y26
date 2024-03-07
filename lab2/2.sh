#!/bin/bash

# Вывести в файл список PID всех процессов, которые были запущены командами, расположенными в /sbin/
sbin_output_file="2_output"

ps -Ao pid,command | awk '$2 ~ /^\/sbin\// {print $1}' > "$sbin_output_file"
# external '/' means bounds of regular expressions
# ^ - any symbol
# \/sbin/\ - pattern