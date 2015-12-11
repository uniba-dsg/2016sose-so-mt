#!/bin/bash

#run in a root shell!

echo "preparing - we advise to reboot after preparing"

locationOfScript=$(dirname "$(readlink --canonicalize-existing "$0")")

cd ../docker
cd HelperScripts/
sh deleteAllImageAndContainers.sh
cd ..

sh buildAllStacks.sh

cd $locationOfScript

sh cleanMeasurements.sh

echo "for better results: reboot now"

# now you should reboot ;)
