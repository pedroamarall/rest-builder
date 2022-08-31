#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

dnf_install openvpn

echo "ALL ALL=NOPASSWD: /usr/sbin/openvpn" > /etc/sudoers.d/openvpn