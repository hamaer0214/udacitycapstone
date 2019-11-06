#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=alchemistbear/nginx

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run --image=alchemistbear/nginx-hello nginx-hello --port=1234

# Step 3:
# List kubernetes pods
kubectl get pods


# Step 4:
# Forward the container port to a host

kubectl port-forward deployments/nginx-hello 8000:80
