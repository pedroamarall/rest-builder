#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

dnf_add_repo https://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo

dnf remove -qy VirtualBox-*

dnf install -qy "kernel-devel-uname-r == $(uname -r)"

dnf_install VirtualBox akmod-VirtualBox

#
# https://www.tecmint.com/install-virtualbox-in-fedora-linux
#

#dnf_install kernel-devel qt5-qtbase qt5-qtbase-gui SDL

#
# https://forums.virtualbox.org/viewtopic.php?f=7&t=100418
#

#if [ ! -e /opt/VirtualBox ]
#then
#	download https://download.virtualbox.org/virtualbox/6.1.36/VirtualBox-6.1.36-152435-Linux_amd64.run

#	chmod u+x data/VirtualBox-6.1.36-152435-Linux_amd64.run

#	sudo ./data/VirtualBox-6.1.36-152435-Linux_amd64.run
#fi