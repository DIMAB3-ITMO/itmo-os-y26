#!/bin/bash

while true; do
  read -r input

  case $input in
    '+')
      kill -USR1 $(cat .pid)
      ;;
    '*')
      kill -USR2 $(cat .pid)
      ;;
    'TERM')
      kill -SIGTERM $(cat .pid)
      kill -SIGTERM $(cat .pid)
      break
      ;;
    *)
      ;;
  esac
done