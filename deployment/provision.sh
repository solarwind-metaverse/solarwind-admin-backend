#!/bin/bash

# Create and configure security group
aws ec2 create-security-group --group-name SlwAdminServerSecurity --description "SSH and Web ports" --vpc-id vpc-0aed6c64839802cd3
aws ec2 authorize-security-group-ingress --group-id sg-0b5f643e65e676156 --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-egress --group-id sg-0b5f643e65e676156 --protocol tcp --port 22 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id sg-0b5f643e65e676156 --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-ingress --group-id sg-0b5f643e65e676156 --protocol tcp --port 80 --source-group sg-0b5f643e65e676156
aws ec2 authorize-security-group-egress --group-id sg-0b5f643e65e676156 --protocol tcp --port 80 --cidr 0.0.0.0/0
aws ec2 authorize-security-group-egress --group-id sg-0b5f643e65e676156 --protocol tcp --port 80 --source-group sg-0b5f643e65e676156

aws ec2 create-key-pair --key-name SlwAdminServerKeyPair

# Create and configure subnet
aws ec2 create-subnet --vpc-id vpc-0aed6c64839802cd3 --cidr-block 172.31.64.0/20
aws ec2 modify-subnet-attribute --subnet-id subnet-05c28aec47e4d0761 --map-public-ip-on-launch

# Create key pair
aws ec2 create-key-pair --key-name SlwAdminServerKeyPair

# SAVE THE PRIVATE KEY FROM THE OUTPUT TO slw-admin-server.key and set its permissions to 400
# chmod 400 slw-admin-server.key

# Create and configure instace IAM role
aws iam create-role --role-name EcrAccessRole --assume-role-policy-document file://trust-policy.json
aws iam create-policy --policy-name EcrAccessPolicy --policy-document file://ecr-access-policy.json
aws iam attach-role-policy --role-name EcrAccessRole --policy-arn arn:aws:iam::063525084510:policy/EcrAccessPolicy
aws iam create-instance-profile --instance-profile-name SlwAdminServerInstanceProfile
aws iam add-role-to-instance-profile --instance-profile-name SlwAdminServerInstanceProfile --role-name EcrAccessRole