#!/bin/bash

array=()
pos=0
step=0

echo "Measures for mem.sh:" > "report.log"

while true; do
    array+=($pos $((pos+1)) $((pos+2)) $((pos+3)) $((pos+4)) $((pos+5)) $((pos+6)) $((pos+7)) $((pos+8)) $((pos+9)))
    #  echo ${array[@]}

    pos=$((pos+10))
    
    # echo "$step"
    step=$((step+1))
    if [ $step -eq "100000" ]; then # 100000
        step=0
        echo "${#array[@]}" >> "report.log" 
    fi

    # sleep 1
done