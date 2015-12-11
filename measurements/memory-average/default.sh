#!/bin/bash

#startuptime for embedded tomcat
#args: i: number of worker for assigning ports

i=$1
name=default-service-helloworld2
port=8000
locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

#bash $locationOfScript/memory-docker.sh $(($port+$i)) $name
echo "0"
