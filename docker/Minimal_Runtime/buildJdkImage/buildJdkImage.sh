#!bin/bash

sudo docker build --tag="minimal-runtime-jdk" . #1> ./dockerBuild.log 2>./dockerBuildErr.log
