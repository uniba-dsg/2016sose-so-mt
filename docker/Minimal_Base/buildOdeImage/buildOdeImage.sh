#!bin/bash

# chmod ggf
#cp ./war/ode-axis2-war-1.3.7-SNAPSHOT.war ./war/ode.war

rm extractedwar --recursive
mkdir --parents extractedwar

#unzip ode-war from odeDir if only one .war in the odeDir directory
odeDir="../../toLoadOde/"
if [ `find $odeDir -name "*.war" | grep --count "war"` -eq 1 ]; then
	warFile=`find $odeDir -name "*.war"`
	unzip -q -d ./extractedwar/ $warFile #quiet, to extractedwar
else
	echo "######## Error: Not exactly one file with .war file-ending in the toLoadOde folder! ########"
fi

#unzip -d ./extractedwar/ ./war/ode-axis2-war-1.3.4-SNAPSHOT.war 
sudo docker build --tag="minimal-base-ode" . #1> ./dockerBuild.log 2>./dockerBuildErr.log

rm extractedwar --recursive
