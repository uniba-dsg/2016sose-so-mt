#!/bin/bash

if [ $# -ne 2 ]; then
echo "Measures the HDD occupation. Give a Port as first arg and the docker-container name as second arg. The HelloWorld2 Process must be deployed by ODE."
echo "hdd-docker.sh 8000 exampleode-embedded";
exit 1;
fi


containerName=$2
portNr=$1

locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

imageSize=$(docker images | grep "$containerName " | awk -F " " '{print $(NF-1)}')


#start container and wait until complete start
containerId=$(sudo docker run --detach=true --publish=$portNr:8080 $containerName)
response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )
while [ "$response" != "1" ]; do
response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )
done



#size of running container on top; NF is awk last field
runningSize=$(docker ps --size=true --no-trunc=true | grep $containerId | awk -F " " '{print $(NF-4)}')

sudo docker stop $containerId > /dev/null

sudo docker rm $containerId > /dev/null

size=$(awk 'BEGIN{printf "%.2f", ("'"$imageSize"'" + "'"$runningSize"'")}')

echo $size
