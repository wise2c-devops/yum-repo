# Wise2C Yum Repo for Docker/K8S/Ceph/NFS installation
Wise2C Yum Repo for Docker/K8S/Ceph/NFS installation

使用方法

YUM Repo服务器安装好docker，直接运行命令：

docker run -d -p 2009:2009 --name=yum-repo wise2c/yum-repo:v1.29.4

在需要安装docker/k8s/ceph/nfs的其它主机上：

创建一个文件 wise2c.repo 并将其拷贝至 /etc/yum.repos.d/

###############################################

[wise2c-k8s]

name=wise2c-k8s

baseurl=http://repo-server-ip:2009/rpms/k8s/centos9

enabled=1

gpgcheck=0

[wise2c-docker]

name=wise2c-docker

baseurl=http://repo-server-ip:2009/rpms/docker/centos9

enabled=1

gpgcheck=0

[wise2c-ceph]

name=wise2c-ceph

baseurl=http://repo-server-ip:2009/rpms/ceph/centos9

enabled=1

gpgcheck=0

###############################################

上面的 repo-server-ip 请写为上述服务器的真实IP地址，如果是8.x（RHEL/CentOS/AlmaLinux/RockyLinux/OracleLinux）的操作系统，请留意将其修改为centos8。

然后就可以直接用yum install命令命令安装相关软件了。例如：

yum --disablerepo=* --enablerepo=wise2c-k8s install rsync python-chardet jq nfs-utils
  
yum --disablerepo=* --enablerepo=wise2c-k8s install kubernetes-cni kubectl kubelet kubeadm

yum --disablerepo=* --enablerepo=wise2c-k8s install cri-o podman crun

yum --disablerepo=* --enablerepo=wise2c-docker install docker-ce docker-ce-cli

yum --disablerepo=* --enablerepo=wise2c-ceph install ceph-deploy ceph ceph-radosgw rbd-nbd rbd-mirror
