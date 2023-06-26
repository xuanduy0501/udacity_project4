#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerPath=duy051995/udacity_project4:v1

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy udacity-duyblx-prj4-k8s --image=$dockerPath --port=8000


# Step 3:
# List kubernetes pods
kubectl get pod

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/udacity-duyblx-prj4-k8s 8000:80