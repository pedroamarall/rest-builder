#!/bin/bash

source ../_common.sh

#
# https://docs.docker.com/engine/installation/linux/fedora/#install-docker-ce
# https://fedoramagazine.org/docker-and-fedora-32
#

dnf_install docker-compose moby-engine

sudo usermod -aG docker me

sudo systemctl enable docker

sudo systemctl stop docker

#
# https://github.com/docker/for-linux/issues/665#issuecomment-533998047
#

sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"

if [ -e /var/lib/docker ]
then
	if [ ! -e /home/docker ]
	then
		sudo mv /var/lib/docker /home

		sudo ln -s /home/docker /var/lib/docker
	fi
else
	sudo mkdir /home/docker

	sudo ln -s /home/docker /var/lib/docker
fi

#
# https://documentation.sisense.com/latest/linux/dockerlimits.htm
#

sudo_restore_from_original /etc/sysconfig/docker

sudo sed -i "s/--default-ulimit nofile=1024:1024/ --default-ulimit nofile=1024000:1024000/" /etc/sysconfig/docker

#sudo systemctl start docker