# Wise2C Yum Repo for Docker/K8S/Ceph/NFS installation
Wise2C Yum Repo for Docker/K8S/Ceph/NFS installation

使用方法

YUM Repo服务器安装好docker，直接运行命令：

docker run -d -p 2009:2009 --name=yum-repo wise2c/yum-repo:v1.17.17

在需要安装docker/k8s/ceph/nfs的其它主机上：

创建一个文件 wise2c.repo 并将其拷贝至 /etc/yum.repos.d/

###############################################

[wise2c]

name=wise2c

baseurl=http://repo-server-ip:2009/rpms

enabled=1

gpgcheck=0

###############################################

上面的 repo-server-ip 请写为上述服务器的真实IP地址

然后就可以直接用yum install命令命令安装相关软件了。例如：

yum install docker docker-python docker-compose

yum install rsync python-chardet jq nfs-utils
  
yum install kubernetes-cni kubectl kubelet kubeadm

yum install ceph-deploy ceph ceph-radosgw rbd-nbd rbd-mirror
