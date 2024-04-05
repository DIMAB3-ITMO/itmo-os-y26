#!/bin/bash

value=1
echo $$ > .pid

usr1() 
{
    value=$((value + 2))
}

usr2() 
{
    value=$((value * 2))
}

trap 'echo "Handler received SIGTERM, exiting..."; exit' SIGTERM

trap 'usr1' USR1
trap 'usr2' USR2
while true; do
    echo "Current value: $value"
    sleep 2
done