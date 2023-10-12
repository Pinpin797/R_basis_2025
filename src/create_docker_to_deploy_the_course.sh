#!/bin/bash

set -euo pipefail +o nounset


TAG="v2023"

IMAGE_NAME="r_for_beginners"
DOCKERFILE_DIR="."

REPO=carinerey/$IMAGE_NAME

docker pull rocker/tidyverse

echo "## Build docker: $REPO:$TAG ##"
docker build -t $REPO:$TAG $DOCKERFILE_DIR
echo "## Build docker: $REPO ##"
docker build -t $REPO $DOCKERFILE_DIR

if [[ $1 == "push_yes" ]]
then
    echo "## Push docker ##"
    docker push $REPO:$TAG
    docker push $REPO
fi
