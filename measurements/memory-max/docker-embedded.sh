#!/bin/bash

#startuptime for embedded tomcat
#args: i: number of worker for assigning ports

i=$1
name=exampleode-embedded
port=9000
locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

#bash $locationOfScript/memory-docker.sh $(($port+$i)) $name
echo "0"
