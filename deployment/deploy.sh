#!/bin/bash

# Get instance ID by name
instance_id=$(aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=SlwAdminServer" \
  --query "Reservations[].Instances[].InstanceId" \
  --output text)

# Terminate the instance
aws ec2 terminate-instances --instance-ids $instance_id

# Use 'aws ec2 describe-security-groups' and 'aws ec2 describe-subnets' to find the values for corresponding arguments
aws ec2 run-instances --image-id ami-0cea4844b980fe49e \
  --count 1 --instance-type t3.micro --key-name SlwAdminServerKeyPair \
  --security-group-ids sg-0b5f643e65e676156 --subnet-id subnet-05c28aec47e4d0761 \
  --iam-instance-profile Name=SlwAdminServerInstanceProfile \
  --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=SlwAdminServer}]' \
  --user-data file://user-data-script.sh