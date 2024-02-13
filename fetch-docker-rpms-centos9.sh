#!/bin/bash
curl -L -o /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/centos/docker-ce.repo
mkdir -p /rpms/docker/centos9
yum -y install docker-ce-${BASH_DOCKER_VERSION}.el9 docker-ce-cli-${BASH_DOCKER_VERSION}.el9
for i in `find /var/cache/dnf/ -name *.rpm`; do cp $i /rpms/docker/centos9/; done
