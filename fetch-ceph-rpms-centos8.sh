#!/bin/bash
yum install -y https://download.ceph.com/rpm-${BASH_CEPH_VERSION}/el8/noarch/ceph-release-1-1.el8.noarch.rpm 
yum clean all
mkdir -p /rpms/ceph/centos8
yum -y install ceph ceph-radosgw rbd-nbd rbd-mirror 
for i in `find /var/cache/dnf/ -name *.rpm`; do cp $i /rpms/ceph/centos8/; done
