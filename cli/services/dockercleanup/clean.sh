#!/bin/sh

function disk_usage {
	DISK_USAGE=$(df -h | grep /host/Volumes)
	echo 
	echo "Filesystem:"
	echo "Size:  $(echo $DISK_USAGE | awk '{printf $2}')"
	echo "Used:  $(echo $DISK_USAGE | awk '{printf $3}')"
	echo "Avail: $(echo $DISK_USAGE | awk '{printf $4}')"
	echo
}

disk_usage
if [ $# -eq 1 ]
  then
    echo "Removing all images with repository name $1"
    docker rmi $(docker image ls $1 -q) 2> /dev/null
fi

disk_usage
echo "Removing stopped containers"
docker rm -f $(docker ps --filter "status=exited" -q)

disk_usage
echo "Removing dangling images"
docker rmi $(docker images --filter="dangling=true" -q) 2> /dev/null

disk_usage
echo "Removing unused volumes"
docker volume rm $(docker volume ls -qf dangling=true) 2> /dev/null

disk_usage
