#!/bin/bash

IMAGE_TAG=ubuntu1804wine

CURR_FOLDER=${PWD}
ROOT_DIR="${CURR_FOLDER%/*}"
WORK_DIR=${HOME}

xhost +local:root
XSOCK=/tmp/.X11-unix

nvidia-docker run -it --rm \
--interactive \
--ipc=host \
 -e DISPLAY=$DISPLAY \
 -v $XSOCK:$XSOCK \
 --privileged \
 --volume=${ROOT_DIR}:/home/${USER}/host_folder \
 --net=host \
 -e NVIDIA_DRIVER_CAPABILITIES=all\
 -w /home/${USER}/host_folder \
 $IMAGE_TAG \
 bash
