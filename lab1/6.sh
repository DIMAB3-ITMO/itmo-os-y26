#!/bin/bash

input_file="/root/itmo-os-y26/lab1/messages"
output_file="full.log"

grep "CentOS" "$input_file" | sed 's/CentOS/centos/g' > "$output_file"
grep "info" "$input_file" | sed 's/info/INFO/g' >> "$output_file"