#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

#
# https://computingforgeeks.com/how-to-install-kvm-on-fedora
#

dnf_install \
	bridge-utils \
	guestfs-tools \
	libguestfs-tools \
	libvirt \
	libvirt-devel \
	qemu-kvm \
	virt-install \
	virt-manager \
	virt-top

systemctl enable libvirtd

systemctl start libvirtd

#
# https://blog.wikichoon.com/2016/01/polkit-password-less-access-for-libvirt.html
#

usermod --append --groups libvirt me