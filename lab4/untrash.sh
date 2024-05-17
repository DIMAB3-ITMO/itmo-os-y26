#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "You must provide exactly one argument, the name of the file to untrash."
    exit 1
fi

filename="$1"
home_dir="$HOME"
trash_dir="$home_dir/.trash"
log_file="$home_dir/.trash/trash.log"

if [ ! -d "$trash_dir" ]; then
    echo "Trash directory does not exist."
    exit 1
fi

if [ ! -f "$log_file" ]; then
    echo "Trash log file does not exist."
    exit 1
fi

# mapfile is mapfile [-d delim] [-n count] [-O origin] [-s count] [-t] [-u fd] [-C callback] [-c quantum] [array] (-t remove trailing newline sign)
mapfile -t entries < <(grep -E ".*$filename.*" "$log_file")

if [ -z "$entries" ]; then
    echo "No entries found for file '$filename'."
    exit 1
fi

# ln "$hard_link" "$original_file";
create_hard_link () {
    if ln "$1" "$2"; then
        echo "File restored successfully"
        rm "$1" && echo "Old hard link from .trash dir deleted successfully"
        return 0
    else
        read -p "Enter a new name for the file: " newname
        if [ -z "$newname" ]; then
            echo "Invalid name. Please provide a new name."
            return 1
        fi
        return create_hard_link "$1" "$newname"
    fi
}

for line in "${entries[@]}"; do
    original_file=$(echo "$line" | awk -F '|' '{print $1}' | sed 's/^[[:space:]]*//') # to delete first space: s/regexp/replacement/
    hard_link=$(echo "$line" | awk -F '|' '{print $2}' | sed 's/^[[:space:]]*//') # to delte first space: s/regexp/replacement/

    echo "Original file: $original_file"
    echo "Hard link: $hard_link"

    read -p "Restore file '$original_file'? (y/n) " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        original_dir=$(dirname "$original_file")
        echo "orig dir: $original_dir"
        if [ ! -d "$original_dir" ]; then
            echo "Original directory '$original_dir' does not exist. Restoring to home directory."
            original_file="$home_dir/$(basename "$original_file")"
        fi

        while ! create_hard_link "$hard_link" "$original_file"; do
            echo "Error was occured, while restoring file."
        done

        sed -i "/^${line//\//\\/}/d" "$log_file" # escape any forward slashes (/) 
    fi
done