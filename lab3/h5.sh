#!/bin/bash

mode="addition"
result=1

(tail -f pipe) |
while true; 
do
    read line

    if [ "$line" == "QUIT" ]
    then
        echo "Planned stop."
        echo "Result: $result"
        break
    fi

    if [ "$line" == "+" ]
    then
        echo "switch to addition"
        mode="addition"
    elif [ "$line" == "*" ]
    then
        echo "switch to multiplication"
        mode="multiplication"
    else
        echo "catched the number!"
        if [ "$mode" == "addition" ]
        then
            result=$(($result + $line))
            echo "$result"
        elif [ "$mode" == "multiplication" ]
        then
            result=$(($result * $line))
            echo "$result"
        fi
    fi
done