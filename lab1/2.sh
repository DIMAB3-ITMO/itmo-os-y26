#!/bin/bash
clear
STR=""
while IFS= read -r line; do
	if [ "$line" = "q" ]; then
		break
	fi

	STR="$STR$line "
done

echo "$STR"
