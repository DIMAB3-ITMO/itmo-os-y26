#!/bin/bash

# man bash | uniq -c | sort -k 1
man bash | grep -o -i "[[:alpha:]]\{4,\}" | sort | uniq -ci | sort -k 1 | head -3

# uniq command: reads from a file or standard input, compares adjacent lines, and prints 
# a line if it's different from the previous one