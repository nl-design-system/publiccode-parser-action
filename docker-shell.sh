#!/bin/sh -e

DOCKER_TAG=publiccode

docker build . --tag "${DOCKER_TAG}"
docker run --interactive --tty --volume ".":"/working-dir/" --workdir "/working-dir/" --entrypoint "/bin/sh" "${DOCKER_TAG}"

