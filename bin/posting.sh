#!/bin/bash

IMAGE_TAG="noahjahn-posting"
CONTAINER_NAME="$IMAGE_TAG-$(date +%s)"

SCRIPT_DIR="$(dirname "$(dirname "$(readlink -f "$0")")")"

docker build -f "$SCRIPT_DIR/Dockerfile" -t $IMAGE_TAG . || exit 1;

docker run --rm -it --name $CONTAINER_NAME $IMAGE_TAG $@ || exit 1;
