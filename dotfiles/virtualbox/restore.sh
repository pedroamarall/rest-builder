#!/bin/bash

source ../_common.sh

#
# https://www.tecmint.com/install-virtualbox-in-fedora-linux
#

#dnf_add_repo http://download.virtualbox.org/virtualbox/rpm/fedora/virtualbox.repo

dnf_install kernel-devel qt5-qtbase qt5-qtbase-gui SDL

#
# https://forums.virtualbox.org/viewtopic.php?f=7&t=100418
#

if [ ! -e /opt/VirtualBox ]
then
	download https://download.virtualbox.org/virtualbox/6.1.16/VirtualBox-6.1.16-140961-Linux_amd64.run

	chmod u+x data/VirtualBox-6.1.16-140961-Linux_amd64.run

	sudo ./data/VirtualBox-6.1.16-140961-Linux_amd64.run
fi