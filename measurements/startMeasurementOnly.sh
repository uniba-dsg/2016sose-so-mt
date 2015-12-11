#!/bin/bash

#run in a root shell!

if [ $# -ne 1 ]; then
runCount=1
else
runCount=$1
fi
echo "executing $runCount times"

i=0
while [ $i -lt $runCount ]; do
	`bash complete-measure.sh`
	i=$(($i+1))
done

docker images > completeMeasurementfiles/docker-images_$(date +%Y-%m-%d_%H:%M:%S).txt

