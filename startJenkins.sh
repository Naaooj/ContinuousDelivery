#!/bin/bash

JENKINS_VERSION=2.11
VOLUME_PATH=/home/naoj/volumes/jenkins-data

docker run -p 9090:8080 \
	   -p 50000:50000 \
	   -v $VOLUME_PATH:/var/jenkins_home \
	   --name jenkins \
	   -d jenkinsci/jenkins:$JENKINS_VERSION
