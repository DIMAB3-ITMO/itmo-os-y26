#!/bin/bash

# Вывести на экран PID процесса, запущенного последним (с последним временем запуска)

ps -Ao pid,start | sort -k 2 -gr | head -1 | awk '{print $1}'