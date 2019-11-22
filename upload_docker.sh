# This file tags and uploads an image to Docker Hub

# Assumes that an image is built via `run_docker.sh`


# Step 2:  
# tag image

docker tag udacitycapstone alchemistbear/nginx-hello1.0

# Step 3:
# Push image to a docker repository
sudo docker push alchemistbear/nginx-hello1.0
