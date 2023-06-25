#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerPath=dienpp/prj4:ver1.0

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deploy uda-prj4-kube --image=$dockerPath --port=8000


# Step 3:
# List kubernetes pods
kubectl get pod

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/uda-prj4-kube 8000:80
