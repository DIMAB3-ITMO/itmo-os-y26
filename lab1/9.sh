#!/bin/bash

target_directory="/var/log"

ls *.log "$target_directory" | wc -l