#!bin/bash

sudo docker build --tag="minimal-base-tomcat" . #1> ./dockerBuild.log 2>./dockerBuildErr.log
