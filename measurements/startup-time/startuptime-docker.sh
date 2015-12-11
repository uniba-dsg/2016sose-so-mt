#!/bin/bash

#Measures the time for startup and deployment. Give a Port as first arg and the docker-container name as second arg. The HelloWorld2 Process must be deployed by ODE.

#portNr='8000'
#containerName='exampleode-embedded'

if [ $# -ne 2 ]; then
echo "Measures the time for startup and deployment. Give a Port as first arg and the docker-container name as second arg. The HelloWorld2 Process must be deployed by ODE."
echo "startuptime-poll.sh 8000 exampleode-embedded";
exit 1;
fi

locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

portNr=$1
containerName=$2


#measurement:
before=$(date +%s%4N)
containerId=$(sudo docker run --detach=true --publish=$portNr:8080 $containerName)

#sleep 3

response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )

while [ "$response" != "1" ]; do
response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )
done

after=$(date +%s%4N)

sudo docker stop $containerId > /dev/null

sudo docker rm $containerId > /dev/null

#calculation
timeDiff=$(($after - $before))

echo $timeDiff

#echo "elapsed time:" $timeDiff "seconds + nanoseconds (4 stellen ns)"
#echo "seconds: " $(($timeDiff/10000))
