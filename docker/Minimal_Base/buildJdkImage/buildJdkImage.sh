#!bin/bash

sudo docker build --tag="minimal-base-jdk" . #1> ./dockerBuild.log 2>./dockerBuildErr.log
