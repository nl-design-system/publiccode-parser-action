#!/bin/sh -e

DOCKER_TAG=publiccode

docker build . --tag "${DOCKER_TAG}"
docker run --volume ".":"/working-dir/" --workdir "/working-dir/" "${DOCKER_TAG}" "$1"
