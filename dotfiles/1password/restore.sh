#!/bin/bash

source ../_common.sh

#
# https://support.1password.com/install-linux/#centos-fedora-or-red-hat-enterprise-linux
#

echo "[1password]" > /etc/yum.repos.d/1password.repo

echo "name=1Password Stable Channel" >> /etc/yum.repos.d/1password.repo
echo "baseurl=https://downloads.1password.com/linux/rpm/stable/\$basearch" >> /etc/yum.repos.d/1password.repo
echo "enabled=1" >> /etc/yum.repos.d/1password.repo
echo "gpgcheck=1" >> /etc/yum.repos.d/1password.repo
echo "repo_gpgcheck=1" >> /etc/yum.repos.d/1password.repo
echo "gpgkey=https://downloads.1password.com/linux/keys/1password.asc" >> /etc/yum.repos.d/1password.repo

rpm --import https://downloads.1password.com/linux/keys/1password.asc

dnf_install 1password 1password-cli