#!/bin/bash

input_file="/etc/passwd"

awk -F ':' '{
    print $1, $3
}' "$input_file" | sort -n -k 2