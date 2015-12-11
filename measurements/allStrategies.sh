#!/bin/bash

######################
### RUN WITH BASH! ###
######################


#starts the execution of all strategies for one technology
#args: technology, (runCount-for-average, parallelExecutedTasksNumber)

#technology=docker
technology=$1

resultFile="allStrategiesfiles/$technology.csv"
mkdir --parents allStrategiesfiles
> "./$resultFile"

strategies[0]="startup-time"
strategies[1]="memory-max"
strategies[2]="memory-average"
strategies[3]="hdd"

for i in "${strategies[@]}"
do
	`sh nStartsForAverage.sh $technology $i >>$resultFile`
	echo "$technology $i finished" 1>&2
done


