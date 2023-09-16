#!/bin/bash

cd ..
mvn clean package
cd deployment
# Login to ECR account if not already logged in
# aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 063525084510.dkr.ecr.eu-north-1.amazonaws.com
aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/z5f5d1o3

# docker rmi --force 063525084510.dkr.ecr.eu-north-1.amazonaws.com/slw-admin-backend
docker rmi --force public.ecr.aws/z5f5d1o3/solarwind-admin-backend
docker rmi --force vhalme/admin-backend

docker buildx build --platform=linux/x86_64 -t solarwind/admin-backend ../ --no-cache
docker tag solarwind/admin-backend public.ecr.aws/z5f5d1o3/solarwind-admin-backend

# aws ecr batch-delete-image --repository-name solarwind-admin-backend --image-ids imageTag=latest
docker push public.ecr.aws/z5f5d1o3/solarwind-admin-backend