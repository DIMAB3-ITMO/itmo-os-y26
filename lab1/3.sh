#!/bin/bash
echo "1: nano"
echo "2: vim"
echo "3: browser"
echo "4: exit"

read -p "Type number in menu to navigate: " input
case $input in
1)  nano ;;
2) vim ;;
3) links;;
4) clear; exit;;
esac
