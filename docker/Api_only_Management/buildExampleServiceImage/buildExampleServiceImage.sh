#!bin/bash

rm toLoadProcesses --recursive
cp --recursive ../../toLoadProcesses toLoadProcesses

sudo docker build --tag="api-only-management-service-helloworld2" . #1> ./dockerBuild.log 2>./dockerBuildErr.log

rm toLoadProcesses --recursive
