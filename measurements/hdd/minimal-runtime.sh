#!/bin/bash

#args: i: number of worker for assigning ports

i=$1
name=minimal-runtime-service-helloworld2
port=6000
locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

sh $locationOfScript/hdd-docker.sh $(($port+$i)) $name
