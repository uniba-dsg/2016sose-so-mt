#!/bin/bash
# Delete all containers

#be shure, there are no docker containers should run in background...
while [ -n "$(docker ps -a -q)" ]; do
docker rm -f $(docker ps -a -q)
done

# Delete all images
docker rmi -f $(docker images -q)

