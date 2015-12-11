#!/bin/bash

#starts the execution more times to calculate the average
#args: technology, strategy, (runCount-for-average, parallelExecutedTasksNumber)

runCount=1
#technology=docker
#strategy=startup-time
strategy=$2 #startup-time, memory, hdd
technology=$1 #docker, docker-embedded, local, vm
parallelExecutedTasksNumber=1

resultFile="averagefiles/$technology-$strategy.csv"
mkdir --parents averagefiles
> "./$resultFile"

#dockerNames=(exampleode-embedded exampleode)

i=0
while [ $i -lt $runCount ]; do
	`sh paralellStarts.sh $technology $strategy >>$resultFile`
	i=$(($i+1))
done


sum=$(awk -F"," '{x+=$1}END{print x}' $resultFile)
#avg=$(($sum/$runCount))
avg=$(awk 'BEGIN{printf "%.2f", ("'"$sum"'" / "'"$runCount"'")}')

#4 nanosek stellen
echo "$avg,$technology,$strategy,Average,$runCount,$parallelExecutedTasksNumber"

#seconds= $(sh startup-time/startuptime-poll.sh $port $name)

#echo $seconds


