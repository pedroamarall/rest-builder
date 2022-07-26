#!/bin/bash

source ../_common.sh

wget https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo -O /etc/yum.repos.d/virtualbox.repo

dnf_install VirtualBox-6.1