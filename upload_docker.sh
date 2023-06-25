#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
dockerPath=dienpp/prj4

# Step 2:  
# Authenticate & tag
echo "Docker ID and Image: $dockerPath"
docker login -u dienpp
docker tag prj4:v1 $dockerPath:ver1.0

# Step 3:
# Push image to a docker repository
docker push $dockerPath:ver1.0