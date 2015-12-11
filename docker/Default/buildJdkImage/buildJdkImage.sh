#!bin/bash

sudo docker build --tag="default-jdk" . #1> ./dockerBuild.log 2>./dockerBuildErr.log
