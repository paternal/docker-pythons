#!/bin/bash

set -e

cd $(dirname $0)

# Build image
docker build -t paternal/pythons .

# Push image to Docker Hub
docker push paternal/pythons
