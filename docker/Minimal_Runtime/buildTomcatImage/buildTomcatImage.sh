#!bin/bash

rm embeddedTomcatJar --recursive
mkdir --parents embeddedTomcatJar

embeddedTomcatDir="../../toLoadEmbeddedTomcat/"

#copy embeddedTomcat-jar from embeddedTomcatDir if only one .jar in the embeddedTomcatDir directory
if [ `find $embeddedTomcatDir -maxdepth 1 -name "*.jar" | grep --count "jar"` -eq 1 ]; then
	jarFile=`find $embeddedTomcatDir -maxdepth 1 -name "*.jar"`
	cp $jarFile ./embeddedTomcatJar/embeddedTomcat.jar #to embeddedTomcatJar
else
	echo "######## Error: Not exactly one file with .jar file-ending in the toLoadEmbeddedTomcat folder! ########"
fi

sudo docker build --tag="minimal-runtime-tomcatembedded" . #1> ./dockerBuild.log 2>./dockerBuildErr.log

rm embeddedTomcatJar --recursive


