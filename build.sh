#!/usr/bin/env bash

docker build . -t baalajimaestro/pixelexp-ci:latest
docker tag baalajimaestro/pixelexp-ci:latest baalajimaestro/pixelexp-ci:latest
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
docker push baalajimaestro/pixelexp-ci
