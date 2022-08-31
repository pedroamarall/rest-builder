#!/bin/bash

cd $(dirname "${0}")

source ../_common.sh

function main {

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
	# https://www.freedesktop.org/software/polkit/docs/latest/polkit.8.html
	#

	local policy_file="/usr/share/polkit-1/actions/com.1password.1Password.policy"

	restore_from_original ${policy_file}

	local line_number_authorize=$(grep -Fn "com.1password.1Password.authorizeSshAgent" ${policy_file} | cut -d ":" -f1)

	local line_number_allow_active=$(awk -v line=${line_number_authorize} 'NR > line && /allow_active/{print NR, $0}' ${policy_file} | cut -d " " -f1)

	sed -i "${line_number_allow_active}s/auth_self/yes/" ${policy_file}
}

main