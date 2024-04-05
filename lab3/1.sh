#!/bin/bash
mkdir -p /home/dimonlimon/test 
status=$? # get status of previous (mkdir) command

if [ "$status" -eq 0 ]; then
  echo "catalog test was created successfully" >> "report"
  touch "/home/dimonlimon/test/$(date +%F_%T)_Start_Script"
else
  echo "$(date +%F_%T) error: failed to create test directory" >> "report"
fi

ping -c 1 www.numeroquadro.space
ping_status=$? # get status of previous (ping) command

if [ "$ping_status" -eq 0 ]; then
  echo "$(date +%F_%T) numeroquadro.space is available" >> "report"
else
  echo "$(date +%F_%T) error: numeroquadro.space is not available" >> "report"
fi