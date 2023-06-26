#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerPath=duy051995/udacity_project4

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerPath"
docker login -u duy051995
docker tag udaduyblx:v1 $dockerPath:v1

# Step 3:
# Push image to a docker repository
docker push $dockerPath:v1