#!/bin/bash

mvn clean package
cd deployment
./deploy.sh
cd ..