#!/bin/bash

source ../_common.sh

#
# https://support.1password.com/install-linux/#centos-fedora-or-red-hat-enterprise-linux
#

sudo bash -c "echo \"[1password]\" > /etc/yum.repos.d/1password.repo"

sudo bash -c "echo \"name=1Password Stable Channel\" >> /etc/yum.repos.d/1password.repo"
sudo bash -c "echo \"baseurl=https://downloads.1password.com/linux/rpm/stable/\\\$basearch\" >> /etc/yum.repos.d/1password.repo"
sudo bash -c "echo \"enabled=1\" >> /etc/yum.repos.d/1password.repo"
sudo bash -c "echo \"gpgcheck=1\" >> /etc/yum.repos.d/1password.repo"
sudo bash -c "echo \"repo_gpgcheck=1\" >> /etc/yum.repos.d/1password.repo"
sudo bash -c "echo \"gpgkey=https://downloads.1password.com/linux/keys/1password.asc\" >> /etc/yum.repos.d/1password.repo"

sudo rpm --import https://downloads.1password.com/linux/keys/1password.asc

dnf_install 1password