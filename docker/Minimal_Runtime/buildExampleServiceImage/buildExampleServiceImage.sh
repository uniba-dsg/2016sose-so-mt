#!bin/bash

rm toLoadProcesses --recursive
cp --recursive ../../toLoadProcesses toLoadProcesses

sudo docker build --tag="minimal-runtime-service-helloworld2" . #1> ./dockerBuild.log 2>./dockerBuildErr.log

rm toLoadProcesses --recursive
