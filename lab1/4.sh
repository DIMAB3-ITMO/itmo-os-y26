#!/bin/bash
if [[ $HOME=$0 ]]; then
	echo "$HOME"
else
	exit 1
fi
