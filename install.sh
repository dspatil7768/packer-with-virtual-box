#!/bin/bash


############### seeting up hostname #############################
hostnamectl set-hostname  xcat-server


echo "Creating xCAT repo file:"
#####creating repo file and copy into /etc/yum.repos##########

cat <<EOT > xcat-core.repo
[xcat-core]
name=xCAT 2 Core packages
baseurl=http://xcat.org/files/xcat/repos/yum/latest/xcat-core
enabled=1
gpgcheck=1
gpgkey=http://xcat.org/files/xcat/repos/yum/latest/xcat-core/repodata/repomd.xml.key
EOT


cat <<EOT > xcat-dep.repo
[xcat-dep]
name=xCAT 2 depedencies
baseurl=http://xcat.org/files/xcat/repos/yum/xcat-dep/rh7/x86_64
enabled=1
gpgcheck=1
gpgkey=http://xcat.org/files/xcat/repos/yum/xcat-dep/rh7/x86_64/repodata/repomd.xml.key
EOT

cp xcat-core.repo xcat-dep.repo /etc/yum.repos.d/


#Installing xCAT on master node
yum -y install xCAT

