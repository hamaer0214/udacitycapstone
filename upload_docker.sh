#!/usr/bin/env bash
# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`

# Step 1:
# Create dockerpath
# dockerpath=<your docker ID/path>
#script{dockerpath=alchemistbear/nginx-hello1.0}

# Step 2:  
# Authenticate & tag
#echo "Docker ID and Image: $dockerpath"
docker tag udacitycapstone alchemistbear/nginx-hello1.0
# Step 3:
# Push image to a docker repository
sudo docker push alchemistbear/nginx-hello1.0
