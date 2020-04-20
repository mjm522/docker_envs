FROM ubuntu:18.04

ARG DOCKER_UID
ARG DOCKER_GID
ARG DOCKER_USER

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

RUN apt-get update && apt-get -y install sudo nano wget gnupg gnupg2 gnupg1 sudo software-properties-common
RUN groupadd --system --gid ${DOCKER_GID} ${DOCKER_USER} \
    && useradd --system --create-home --gid ${DOCKER_GID} --uid ${DOCKER_UID} ${DOCKER_USER} \
    && usermod -aG dialout ${DOCKER_USER} \
    && usermod -aG sudo ${DOCKER_USER} \
    && echo '%sudo ALL=NOPASSWD: ALL' > /etc/sudoers.d/sudo-nopasswd \
    && chmod 0440 /etc/sudoers.d/sudo-nopasswd

RUN sudo apt-get -y install libldap-common && sudo dpkg --add-architecture i386

RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DFA175A75104960E && sudo apt-get update && sudo apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./' && sudo apt update && sudo apt -y install --install-recommends winehq-stable

USER $DOCKER_USER

CMD /bin/bash
