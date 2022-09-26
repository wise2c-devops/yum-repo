# Wise2C Yum Repo for Docker/K8S/Ceph/NFS installation
Wise2C Yum Repo for Docker/K8S/Ceph/NFS installation

使用方法

YUM Repo服务器安装好docker，直接运行命令：

docker run -d -p 2009:2009 --name=yum-repo wise2c/yum-repo:v1.22.15

在需要安装docker/k8s/ceph/nfs的其它主机上：

创建一个文件 wise2c.repo 并将其拷贝至 /etc/yum.repos.d/

###############################################

[wise2c-k8s]

name=wise2c-k8s

baseurl=http://repo-server-ip:2009/rpms/k8s/centos8

enabled=1

gpgcheck=0

[wise2c-crio]

name=wise2c-crio

baseurl=http://repo-server-ip:2009/rpms/crio/centos8

enabled=1

gpgcheck=0

###############################################

上面的 repo-server-ip 请写为上述服务器的真实IP地址，如果是7.x（RHEL/CentOS）的操作系统，请留意将其修改为centos7。

然后就可以直接用yum install命令命令安装相关软件了。例如：

yum --disablerepo=* --enablerepo=wise2c-k8s install docker-ce docker-ce-cli docker-python docker-compose

yum --disablerepo=* --enablerepo=wise2c-k8s install rsync python-chardet jq nfs-utils
  
yum --disablerepo=* --enablerepo=wise2c-k8s install kubernetes-cni kubectl kubelet kubeadm

yum --disablerepo=* --enablerepo=wise2c-k8s install ceph-deploy ceph ceph-radosgw rbd-nbd rbd-mirror

yum --disablerepo=* --enablerepo=wise2c-crio install crio podman
