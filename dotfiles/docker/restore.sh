#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

#
# https://docs.docker.com/engine/installation/linux/fedora/#install-docker-ce
# https://fedoramagazine.org/docker-and-fedora-32
#

dnf_install docker-compose moby-engine

usermod -aG docker me

systemctl enable docker

systemctl stop docker

#
# https://github.com/docker/for-linux/issues/665#issuecomment-533998047
#

grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

if [ -e /var/lib/docker ]
then
	if [ ! -e /home/docker ]
	then
		mv /var/lib/docker /home

		ln -s /home/docker /var/lib/docker
	fi
else
	mkdir /home/docker

	ln -s /home/docker /var/lib/docker
fi

#
# https://documentation.sisense.com/latest/linux/dockerlimits.htm
#

restore_from_original /etc/sysconfig/docker

sed -i "s/--default-ulimit nofile=1024:1024/ --default-ulimit nofile=1024000:1024000/" /etc/sysconfig/docker

#systemctl start docker