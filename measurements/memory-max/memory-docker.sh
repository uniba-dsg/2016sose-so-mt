#!/bin/bash

######################
### RUN WITH BASH! ###
######################

#Measures the time for startup and deployment. Give a Port as first arg and the docker-container name as second arg. The HelloWorld2 Process must be deployed by ODE.

#portNr='8000'
#containerName='exampleode-embedded'

if [ $# -ne 2 ]; then
echo "Measures the time for startup and deployment. Give a Port as first arg and the docker-container name as second arg. The HelloWorld2 Process must be deployed by ODE. WARNING: script has to run under sudo su"
echo "startuptime-poll.sh 8000 exampleode-embedded";
exit 1;
fi

locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

portNr=$1
containerName=$2

containerId=$(sudo docker run --detach=true --publish=$portNr:8080 $containerName)


response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )

while [ "$response" != "1" ]; do
response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )
done

lastValue=$(awk -F" " 'NR==2 {print $2}' /sys/fs/cgroup/memory/docker/$containerId/memory.stat)
lastValue=$[$lastValue / 1048576]
sleep 1

sudo docker stop $containerId > /dev/null

sudo docker rm $containerId > /dev/null

echo $lastValue

