#!/bin/bash

shopt -s expand_aliases

docker build -f cli -t cli/git . 
alias git="docker run -ti --rm -v $(pwd):/git bwits/docker-git-alpine"
