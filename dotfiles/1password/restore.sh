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

#
# Allow the 1Password SSH agent to use system authentication.
#
# https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html
#

policy_file="/usr/share/polkit-1/actions/com.1password.1Password.policy"

restore_from_original ${policy_file}

#
# Find the line number of "com.1password.1Password.authorizeSshAgent"
#

line_num_authorize=$(grep -Fn 'com.1password.1Password.authorizeSshAgent' ${policy_file} | cut -f1 -d":")

#
# Starting at the line number of "com.1password.1Password.authorizeSshAgent", find the line number of the first match of "allow_active"
#

line_num_allow_active=$(awk -v line=$line_num_authorize 'NR > line && /allow_active/{ print NR, $0 }' ${policy_file} | cut -f1 -d" ")

#
# Use sed on that line number to replace "auth_self" with "yes"
#

sed -i "${line_num_allow_active}s/auth_self/yes/" ${policy_file}