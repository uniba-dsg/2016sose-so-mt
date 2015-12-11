#!/bin/bash

#args: i: number of worker for assigning ports

i=$1
name=exampleode-embedded
port=9000
locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

#sh $locationOfScript/hdd-docker.sh $(($port+$i)) $name
echo "0"
