#!/bin/bash
yum install -y https://download.ceph.com/rpm-${BASH_CEPH_VERSION}/el9/noarch/ceph-release-1-1.el9.noarch.rpm 
yum clean all 
mkdir -p /rpms/ceph/centos9
yum -y install ceph ceph-radosgw rbd-nbd rbd-mirror 
for i in `/usr/bin/find /var/cache/dnf/ -name *.rpm`; do cp $i /rpms/ceph/centos9/; done
