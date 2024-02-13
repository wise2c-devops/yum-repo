#!/bin/bash
yum remove -y tar
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
yum clean all
mkdir -p /rpms/k8s/centos9
yum -y install tar chrony audit rsync jq git tcpdump nc bind-utils net-tools ipvsadm graphviz open-vm-tools nfs-utils python3-docker python3-chardet python3-requests audit-libs-python3
yum -y install podman cri-o crun
yum -y install kubectl-${BASH_KUBE_VERSION} kubelet-${BASH_KUBE_VERSION} kubeadm-${BASH_KUBE_VERSION}
for i in $(find /var/cache/dnf/ -name *.rpm); do cp $i /rpms/k8s/centos9/; done
