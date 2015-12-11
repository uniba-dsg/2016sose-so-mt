#!bin/bash


rm odejarwithdeps --recursive
mkdir --parents odejarwithdeps

odeDir="../../toLoadEmbeddedOde/"

#copy ode-jar from odeDir if only one .jar in the odeDir directory
if [ `find $odeDir -maxdepth 1 -name "*.jar" | grep --count "jar"` -eq 1 ]; then
	jarFile=`find $odeDir -maxdepth 1 -name "*.jar"`
	cp $jarFile ./odejarwithdeps/embeddedOde.jar #to odejarwithdeps
else
	echo "######## Error: Not exactly one file with .jar file-ending in the toLoadEmbeddedOde folder! ########"
fi

#copy libs directory from odeDir if only one libs is in the odeDir directory
if [ `find $odeDir -maxdepth 1 -name "libs" | grep --count "libs"` -eq 1 ]; then
	libsDir=`find $odeDir -maxdepth 1 -name "libs"`
	cp $libsDir ./odejarwithdeps/libs --recursive
else
	echo "######## Error: Not exactly one libs directory in the toLoadEmbeddedOde folder! ########"
fi

sudo docker build --tag="api-only-management-tomcatembedded-ode" . #1> ./dockerBuild.log 2>./dockerBuildErr.log

rm odejarwithdeps --recursive
