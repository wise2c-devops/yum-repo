#!/bin/bash
curl -L -o /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
mkdir -p /rpms/docker/centos8
yum -y install docker-ce-${BASH_DOCKER_VERSION}.el8 docker-ce-cli-${BASH_DOCKER_VERSION}.el8
for i in `find /var/cache/dnf/ -name *.rpm`; do cp $i /rpms/docker/centos8/; done
