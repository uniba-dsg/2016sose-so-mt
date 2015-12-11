#!bin/bash

sudo docker build --tag="api-only-management-jdk" . #1> ./dockerBuild.log 2>./dockerBuildErr.log
