#!/bin/bash
# run with bash!
# run as sudo su
# change to folder to investigate
set -e

if [ $# -ne 1 ]; then
runCount=1
echo "usage: bash rename-experiments-for-windows-compability.sh folderWithMeasurementFiles"
exit -1
fi

cd $1
#cd measurment-2015-09-11-2000

files=`ls`

for x in *; do 
  newName=`echo $x | tr '\:' '_'`
  mv $x $newName
done


cd ..

