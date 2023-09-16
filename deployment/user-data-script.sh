#!/bin/bash

sudo dnf update
sudo dnf install --assumeyes docker
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
newgrp docker

aws ecr get-login-password --region eu-north-1 | docker login --username AWS --password-stdin 063525084510.dkr.ecr.eu-north-1.amazonaws.com

# Pull and run Docker image
docker pull 063525084510.dkr.ecr.eu-north-1.amazonaws.com/slw-admin-server
docker run -d -p 80:80 --name slw-admin-server 063525084510.dkr.ecr.eu-north-1.amazonaws.com/slw-admin-server
