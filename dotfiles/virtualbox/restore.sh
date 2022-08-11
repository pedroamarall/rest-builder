#!/bin/bash

source ../_common.sh

if [ ! -e /etc/yum.repos.d/virtualbox.repo ]
then
	wget https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -O /etc/yum.repos.d/virtualbox.repo
fi

dnf_install VirtualBox-6.1