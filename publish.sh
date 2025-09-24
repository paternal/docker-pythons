#!/bin/bash

set -e

cd $(dirname $0)

# Build image
docker build --tag paternal/pythons --progress plain .

# Push image to Docker Hub
docker push paternal/pythons
