#!/bin/bash
# 1. Скрипт rmtrash 
# a. Скрипту передается один параметр – имя файла в текущем каталоге вызова скрипта. 
# b. Скрипт проверяет, создан ли скрытый каталог trash в домашнем каталоге пользователя. Если он не создан – создает его. 
# c. После этого скрипт создает в этом каталоге жесткую ссылку на переданный файл с уникальным именем 
#   (например, присваивает каждой новой ссылке имя, соответствующее следующему натуральному числу) и удаляет файл в текущем каталоге. 
# d. Затем в скрытый файл trash.log в домашнем каталоге пользователя помещается запись, содержащая полный исходный путь 
#   к удаленному файлу и имя созданной жесткой ссылки.

filename=""
arguments="$*"
if [ "$#" -ne 1 ]; then
    echo "You passed more than 1 argument, since that it will be interpreted as file name with spaces"
    for arg in "${arguments[@]}"; do
        filename+="$arg"
    done
else
    filename="$1"
fi

current_dir=$(pwd)
home_dir="$HOME"
trash_dir="$home_dir/.trash"
log_file="$home_dir/.trash/trash.log"

script_dir=$(dirname "$0")
script_parent_dir=$(dirname "$script_dir")

found_file=("$script_parent_dir"/*"$filename"*)

echo "found file: $found_file"

if [ ! -n "$found_file" ]; then
    echo "File '$filename' not found in the current directory."
    exit 1    
fi

if [ ! -d "$trash_dir" ]; then
    mkdir "$trash_dir"
    echo "directory created"
fi

touch "$log_file"
hard_link="$trash_dir/$filename-$(date +%s)"
echo "$hard_link"

realpath_file=$(realpath "$found_file")
echo "$realpath_file"

ln "$realpath_file" "$hard_link" || { echo "Error creating hard link."; exit 1; }

rm "$realpath_file" || { echo "Error removing file."; exit 1; }

echo "'$realpath_file'|'$hard_link'" >> "$log_file" || { echo "Error writing to log file."; exit 1; }