#!/bin/bash

# Replace with your instance name and key pair
INSTANCE_NAME="SlwAdminServer"
KEY_PAIR="deployment/slw-admin-server.key"

# Get the instance ID by name and state (running)
INSTANCE_ID=$(aws ec2 describe-instances \
  --filters "Name=tag:Name,Values=$INSTANCE_NAME" "Name=instance-state-name,Values=running" \
  --query "Reservations[].Instances[].InstanceId" \
  --output text)

# Check if the instance ID is empty (no running instance found)
if [ -z "$INSTANCE_ID" ]; then
  echo "No running instance found with name $INSTANCE_NAME."
  exit 1
fi

# Get the public IP address by instance ID
PUBLIC_IP=$(aws ec2 describe-instances \
  --instance-ids $INSTANCE_ID \
  --query "Reservations[].Instances[].PublicIpAddress" \
  --output text)

# Check if the public IP is empty (instance might not have a public IP)
if [ -z "$PUBLIC_IP" ]; then
  echo "Instance $INSTANCE_NAME does not have a public IP."
  exit 1
fi

# SSH into the instance
ssh -i $KEY_PAIR ec2-user@$PUBLIC_IP
