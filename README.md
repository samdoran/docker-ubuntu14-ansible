# Ubuntu 14 Ansible Test Image #
[![Docker Automated build](https://img.shields.io/docker/automated/samdoran/ubuntu14-ansible.svg?maxAge=2592000)](https://hub.docker.com/r/samdoran/ubuntu14-ansible/)

This is a container for testing Ansible roles.

## Build ##

    docker build -i -t [image tag] -f [dockefile] .

## Run ##

    docker run -e TERM=xterm --rm -i -t samdoran/ubuntu14 bash
