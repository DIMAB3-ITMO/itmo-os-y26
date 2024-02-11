#!/bin/bash

if [[ "$1" -eq "$2" && "$2" -eq "$3" ]]; then
	echo "no correct answer, all numbers are equal!"

elif [[ "$1" -gt "$2" ]]; then
	if [[ "$1" > "$3" ]]; then
		echo "$1"

	elif [[ "$1" -eq "$3" ]]; then
		echo "no correct answer, first and third numbers are equal"

	elif [[ "$3" -gt "$1" ]]; then
		echo "$3"

	else
		echo "$1"
	fi

elif [[ "$2" -gt "$1" ]]; then
	if [[ "$2" -gt "$3" ]]; then
		echo "$2"

	elif [[ "$2" == "$3" ]]; then
		echo "no correct answer, second and third numbers are equal"

	elif [[ "$3" > "$2" ]]; then
		echo "$3"

     	else
		echo "$2"
	fi

elif [ "$3" -gt "$1" ] || [ "$3" -gt "$2" ]; then
	echo "$3"

else
	echo "no correct answer, first and second numbers are equal and both greater than third number"
fi
