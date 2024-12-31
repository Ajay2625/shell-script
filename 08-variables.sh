#!/bin/bash

echo "All Variables Passed: $@"
echo "Number of variables: $#"
echo "Script Name: $0"
echo "Present working directory: $PWD"
echo "Home Directory of Current user: $Home"
echo "Which user is executing this file:" $USER"
echo "process id of current Script: $$"
sleep 60 &
echo "process id of last command in background: $!"
