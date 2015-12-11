#!/bin/bash

#starts the execution in parallel
#args: technology, strategy, (parallelExecutedTasksNumber)

parallelNumber=1
strategy=$2 #startup-time, memory, hdd
technology=$1 #docker, docker-embedded, local, vm
#strategy=startup-time #startup-time, memory, hdd
#technology=docker-embedded #docker, docker-embedded, local, vm

resultFile="measurementfiles/$technology-$strategy.csv"
mkdir --parents measurementfiles
 > "./$resultFile"

if [ $parallelNumber -gt 1 ]; then

	#parallel runs
	i=0
	while [ $i -lt $parallelNumber ]; do
		`sh $strategy/$technology.sh $i >>$resultFile &`
		i=$(($i+1))
	done

	#count lines in file to block until finished
	lineNr=0
	while [ $lineNr -lt $parallelNumber ]; do
		sleep 1
		lineNr=$(cat $resultFile | wc -l)
	done

	sum=$(awk -F"," '{x+=$1}END{print x}' $resultFile)
	#avg=$(($sum/$parallelNumber))
	avg=$(awk 'BEGIN{printf "%.2f", ("'"$sum"'" / "'"$parallelNumber"'")}')

	#4 nanosek stellen
	echo "$avg"

else
	# only one start
	sh $strategy/$technology.sh 0

fi

#debug output
echo "parallelStarts finished: tech:$technology strat:$strategy nmbrs:$parallelNumber" 1>&2




