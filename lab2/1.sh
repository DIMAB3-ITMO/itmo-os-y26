#!/bin/bash

# Посчитать количество процессов, запущенных пользователем user, 
# и вывести в файл получившееся число, 
# а затем пары PID:команда для таких процессов.
output_file="1_output"

ps -u root | wc -l > "$output_file"
# -l count newlines

ps -Ao pid,command >> "$output_file"
# From man instrucntions: To see every process with a user-defined format:
# ps -Ao pid,tt,user,fname,tmout,f,wchan
#-A     Select all processes.  Identical to -e.