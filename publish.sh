#!/bin/bash

set -e

# Build image
docker build -t paternal/pythons .

# Push image to Docker Hub
docker push paternal/pythons
