#!/bin/bash

docker build -f git -t cli/git . 

docker build -f mysql -t cli/mysql .

echo
echo Make sure that file 
echo ~/.bash_profile
echo exists and loads alias shell script like this:
echo source /Users/jan/code/dockerfiles/cli/alias 
echo
