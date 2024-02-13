for i in $(find /var/cache/dnf/ -name *.rpm); do cp $i /rpms/k8s/centos9/; done;
