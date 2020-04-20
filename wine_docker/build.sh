#!/bin/bash

CURR_FOLDER=${PWD}
DOCKER_FILE_PATH=${CURR_FOLDER}/ubuntu
IMAGE_TAG=ubuntu1804wine
DOCKER_USER=${USER}
DOCKER_GID=$(eval "id -g ${USER}")
DOCKER_UID=$(eval "id -u ${USER}")


echo "======================="
echo " Building docker image "
echo " IMAGE_TAG:   ${IMAGE_TAG}"
echo " DOCKER_USER: ${DOCKER_USER}"
echo " DOCKER_GID:  ${DOCKER_GID}"
echo " DOCKER_UID:  ${DOCKER_UID}"

docker build ${DOCKER_FILE_PATH} --build-arg DOCKER_USER=${DOCKER_USER} \
                                 --build-arg DOCKER_GID=${DOCKER_GID} \
                                 --build-arg DOCKER_UID=${DOCKER_UID} \
                                 --tag=${IMAGE_TAG}