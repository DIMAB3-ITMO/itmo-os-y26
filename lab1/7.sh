#!/bin/bash

input_directory="/etc"
output_file="emails.lst"

grep -EIorh '[a-z0-9_]+@[a-z]+\.[a-z]{2}' "$input_directory" | tr '\n' ',' > "$output_file"

# E-flag - regexp
# I-flag - biniry files does not contain mathcing data
# o-flag - only mathced parts of strings
# h-flag - do not contain names of files before matched strings
# tr - for replace '\n' to ','