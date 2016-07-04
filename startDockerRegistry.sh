#!/bin/bash

# Defines some variables for the container
PORT=5000
VOLUME_PATH=/home/naoj/volumes/docker-registry

# Creates the docker registry used to store different images
docker run -p $PORT:5000 \
	   --restart=always \
	   --name registry \
	   -v $VOLUME_PATH:/var/lib/registry \
	   -d registry:2  

