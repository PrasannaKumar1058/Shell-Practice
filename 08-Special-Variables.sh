#!/bin/bash

echo "All variables passed to the script: $@"
echo "Number of variables passed to the script: $#"
echo "The name of the script: $0"
echo "Current Directory: $PWD"
echo "Home Directory: $HOME"
echo "Which user is running the script: $USER"
echo "The process ID of the current script: $$"
sleep 20 &
echo "The process ID of the last background command: $!"