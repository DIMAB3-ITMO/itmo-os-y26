#!/bin/bash

array=()
pos=0

while true; do
    array+=($pos $((pos+1)) $((pos+2)) $((pos+3)) $((pos+4)) $((pos+5)) $((pos+6)) $((pos+7)) $((pos+8)) $((pos+9)))

    pos=$((pos+10))
    
    if [ ${#array[@]} -eq "$1" ]; then
        exit 0;
    fi
done