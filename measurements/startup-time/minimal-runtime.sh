#!/bin/bash

#startuptime for embedded tomcat
#args: i: number of worker for assigning ports

i=$1
name=minimal-runtime-service-helloworld2
port=5000
locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

sh $locationOfScript/startuptime-docker.sh $(($port+$i)) $name
