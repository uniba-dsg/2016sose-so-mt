#!/bin/bash
# run with bash!
# run as sudo su
# change to folder to investigate

set -e

if [ $# -ne 1 ]; then
runCount=1
echo "usage: bash plotCompleteMeasuremts folderWithMeasurementFiles"
exit -1
fi

cd $1
i=1
echo "#This file is a file to be plotted by gnuplot" > ../values.dat
echo "#run normal-ttfr normal-ram-max normal-ram-avg normal-hdd reduced-ttfr reduced-ram-max reduced-ram-avg reduced-hdd normal-ttfr-alpine normal-ram-max-alpine normal-ram-avg-alpine normal-hdd-alpine dockerEmbeddedAlpine-ttfr dockerEmbeddedAlpine-ram-max dockerEmbeddedAlpine-ram-avg dockerEmbeddedAlpine-hdd reduced-ttfr-alpine reduced-ram-max-alpine reduced-ram-avg-alpine reduced-hdd-alpine" >> ../values.dat

echo "run Default Default Default Default reduced-ttfr reduced-ram-max reduced-ram-avg reduced-hdd Minimal-Base Minimal-Base Minimal-Base Minimal-Base Minimal-Runtime Minimal-Runtime Minimal-Runtime Minimal-Runtime Api-only-Management Api-only-Management Api-only-Management Api-only-Management" >> ../values.dat
for f in *.csv
do
	# change NR to line you need
	dockerstartuptime=$(awk -F"," 'NR==1 {print $1}' $f)
	dockermemorymax=$(awk -F"," 'NR==2 {print $1}' $f)
	dockermemoryaverage=$(awk -F"," 'NR==3 {print $1}' $f)
	dockerhdd=$(awk -F"," 'NR==4 {print $1}' $f)

	dockerembeddedstartuptime=$(awk -F"," 'NR==5 {print $1}' $f)
	dockerembeddedmemorymax=$(awk -F"," 'NR==6 {print $1}' $f)
	dockerembeddedmemoryaverage=$(awk -F"," 'NR==7 {print $1}' $f)
	dockerembeddedhdd=$(awk -F"," 'NR==8 {print $1}' $f)
	
	## Alpine:
	dockerstartuptimeAlpine=$(awk -F"," 'NR==9 {print $1}' $f)
	dockermemorymaxAlpine=$(awk -F"," 'NR==10 {print $1}' $f)
	dockermemoryaverageAlpine=$(awk -F"," 'NR==11 {print $1}' $f)
	dockerhddAlpine=$(awk -F"," 'NR==12 {print $1}' $f)

	dockertomcatembeddedstartuptimeAlpine=$(awk -F"," 'NR==17 {print $1}' $f)
	dockertomcatembeddedmemorymaxAlpine=$(awk -F"," 'NR==18 {print $1}' $f)
	dockertomcatembeddedmemoryaverageAlpine=$(awk -F"," 'NR==19 {print $1}' $f)
	dockertomcatembeddedhddAlpine=$(awk -F"," 'NR==20 {print $1}' $f)

	dockerembeddedstartuptimeAlpine=$(awk -F"," 'NR==13 {print $1}' $f)
	dockerembeddedmemorymaxAlpine=$(awk -F"," 'NR==14 {print $1}' $f)
	dockerembeddedmemoryaverageAlpine=$(awk -F"," 'NR==15 {print $1}' $f)
	dockerembeddedhddAlpine=$(awk -F"," 'NR==16 {print $1}' $f)



	echo "$i $dockerstartuptime $dockermemorymax $dockermemoryaverage $dockerhdd $dockerembeddedstartuptime $dockerembeddedmemorymax $dockerembeddedmemoryaverage $dockerembeddedhdd $dockerstartuptimeAlpine $dockermemorymaxAlpine $dockermemoryaverageAlpine $dockerhddAlpine $dockertomcatembeddedstartuptimeAlpine $dockertomcatembeddedmemorymaxAlpine $dockertomcatembeddedmemoryaverageAlpine $dockertomcatembeddedhddAlpine $dockerembeddedstartuptimeAlpine $dockerembeddedmemorymaxAlpine $dockerembeddedmemoryaverageAlpine $dockerembeddedhddAlpine" >> ../values.dat

	let "i += 1"
done

cd ..

gnuplot memory-max.gp
gnuplot memory-avg.gp
gnuplot hdd.gp
gnuplot timetofirstresponse.gp
