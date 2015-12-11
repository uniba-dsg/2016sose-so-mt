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

#measurement:
#before=$(date +%s%4N)
containerId=$(sudo docker run --detach=true --publish=$portNr:8080 $containerName)

#write own PiD into cgroup tasks file of container
echo $$ >> /sys/fs/cgroup/memory/docker/$containerId/tasks

# our container have more than 450 MB size, they have approximately 540-580 MB
# we wait until size is bigger than 450 MB than try to send requests
i=0
lastRSSValue=$(awk -F" " 'NR==2 {print $2}' /sys/fs/cgroup/memory/docker/$containerId/memory.stat)
rssValues[$i]=$lastRSSValue
while [ $lastRSSValue -lt $((200 * 1048576)) ]; do # 1048576 = 1024 * 1024
i=$[$i+1]
sleep 1
lastRSSValue=$(awk -F" " 'NR==2 {print $2}' /sys/fs/cgroup/memory/docker/$containerId/memory.stat)
rssValues[$i]=$lastRSSValue
done

response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )
i=$[$i+1]
lastRSSValue=$(awk -F" " 'NR==2 {print $2}' /sys/fs/cgroup/memory/docker/$containerId/memory.stat)
rssValues[$i]=$lastRSSValue


while [ "$response" != "1" ]; do
response=$($locationOfScript/bin-sendsoap/sendsoap http://localhost:$portNr/ode/processes/helloWorld $locationOfScript/examples/HelloWorld2/testRequest.soap 2>/dev/null | grep --count helloResponse )
i=$[$i+1]
lastRSSValue=$(awk -F" " 'NR==2 {print $2}' /sys/fs/cgroup/memory/docker/$containerId/memory.stat)
rssValues[$i]=$lastRSSValue
done

# Value after first response
# lastValue=$(awk -F" " 'NR==2 {print $2}' /sys/fs/cgroup/memory/docker/$containerId/memory.stat)
# lastValue=$[$lastValue / 1048576]
# echo $lastValue

sudo docker stop $containerId > /dev/null

response='-1'
while [ "$response" != "1" ]; do
response=$(grep --invert-match --count $$ /sys/fs/cgroup/memory/docker/$containerId/tasks)
# our own PiD is in the file, and another which i cannot identify, so overall 2 PiDs in the tasksfile indicates a shutdown image
done

# NR==1 is cache
# NR==2 is rss
sumRSSValue=0

tLen=${#rssValues[@]}
for (( i=0; i<${tLen}; i++ ));
do
  sumRSSValue=$[$sumRSSValue +  ${rssValues[$i]}]
done

i=$[$i+1]
averageRSSValue=$[$sumRSSValue / ${tLen}]
averageRSSValue=$[$averageRSSValue / 1048576] # result in MB as natural number

sudo docker rm $containerId > /dev/null

echo $averageRSSValue

