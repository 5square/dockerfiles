#!/bin/bash

docker build -f git -t cli/git . 

docker build -f mysql -t cli/mysql .

docker build -f composer -t cli/composer .

docker build -f bower -t cli/bower .

echo
echo Make sure that file 
echo ~/.bash_profile
echo exists and loads alias shell script like this:
echo . /Users/jan/code/dockerfiles/cli/alias 
echo
