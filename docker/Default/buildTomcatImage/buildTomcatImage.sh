#!bin/bash

sudo docker build --tag="default-tomcat" . #1> ./dockerBuild.log 2>./dockerBuildErr.log
