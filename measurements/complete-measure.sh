#!/bin/bash

######################
### RUN WITH BASH! ###
######################


#starts the complete measurement process
#args: (runCount-for-average, parallelExecutedTasksNumber)

date=`date +%Y-%m-%d_%H:%M:%S`
resultFile="completeMeasurementfiles/measurment-$date.csv"
mkdir --parents completeMeasurementfiles
> "./$resultFile"

technology[0]="default"
technology[1]="docker-embedded"
technology[2]="minimal-base"
technology[3]="minimal-runtime"
technology[4]="api-only-management"

for i in "${technology[@]}"
do
	`bash allStrategies.sh $i`
	`cat "allStrategiesfiles/$i.csv" >> $resultFile`
done






