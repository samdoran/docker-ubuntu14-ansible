FROM ubuntu:14.04

ENV CONTAINER=docker
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        aptitude \
        bash \
        ca-certificates \
        curl \
        python-apt \
        python-pip \
        python2.7 \
        software-properties-common \
        sudo \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN apt-add-repository ppa:ansible/ansible \
    && apt-get update \
    && apt-get upgrade -y --no-install-recommends \
    && apt-get install -y ansible \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && touch -m -t 201701010000 /var/lib/apt/lists/

RUN mkdir -p /etc/ansible \
    && echo '[local]\nlocalhost ansible_connection=local ansible_python_interpreter=/usr/bin/python' > /etc/ansible/hosts

VOLUME ["/sys/fs/cgroup"]
CMD ["/sbin/init"]
