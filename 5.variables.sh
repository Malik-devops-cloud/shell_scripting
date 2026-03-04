#!/bin/bash

echo "all variables passed to the scripts: $@"
echo "all variables passed to the scripts: $*"
echo "script name: $0"
echo "current working directory: $PWD"
echo "who si running this directory: $USER"
echo "Home directory of user: $HOME"
echo "PID of this script: $$"
sleep 50&
echo "PID of the last command in background is : $!"