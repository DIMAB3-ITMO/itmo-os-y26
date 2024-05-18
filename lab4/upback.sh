#!/bin/bash

restore_dir=/home/user/restore
source_dir=/home/user/source
backup_dir=/home/user

current_date=$(date +%Y-%m-%d)
if [ ! -d "$backup_dir/Backup-$current_date" ]; then
    for ((i=1; i<=7; i++)); do
        last_date=$(date -d "-$i days" +%Y-%m-%d) # is used to calculate the date for a specific number of days in the past
        if [ -d "$backup_dir/Backup-$last_date" ]; then
            backup_dir_name="Backup-$last_date"
            break
        fi
    done

    if [ -z "$backup_dir_name" ]; then
        backup_dir_name="Backup-$current_date"
        mkdir "$backup_dir/$backup_dir_name"
        echo "Created new backup directory: $backup_dir_name" >> /home/user/backup-report
    fi
else
    backup_dir_name="Backup-$current_date"
fi

for file in "$backup_dir/$backup_dir_name"/*; do
    pure_filename=$(basename $file)

    cp "$file" "$restore_dir/"
done