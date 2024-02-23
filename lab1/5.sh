#!/bin/bash
# /var/log/messages instead /var/log/anaconda/syslog

input_file="/root/itmo-os-y26/lab1/messages"
output_file="info.log"

awk '{$6 = "info"}' "$input_file" | grep "info" "$input_file" > "$output_file"

echo "content of info.log is: "
cat "$output_file"