#!/bin/bash

filename=$1

script_dir=$(dirname "$0")
script_parent_dir=$(dirname "$script_dir")

found_file=("$script_parent_dir"/*"$filename"*)

echo "$found_file"