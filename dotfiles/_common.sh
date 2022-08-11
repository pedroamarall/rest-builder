#!/bin/bash

function dnf_add_repo {
	repo_name=$(basename ${1})

	if [ ! -e /etc/yum.repos.d/${repo_name} ]
	then
		dnf config-manager --add-repo=${1}
	fi
}

function dnf_erase {
	for rpm_name in "$@"
	do

		#
		# https://serverfault.com/questions/654765/how-to-fix-a-function-in-bash-that-checks-if-an-rpm-package-is-installed
		#

		if ! rpm -q ${rpm_name} &> /dev/null
		then
			dnf erase -qy ${@}

			return 0
		fi
	done
}

function dnf_install {
	for rpm_name in "$@"
	do
		if ! rpm -q ${rpm_name} &> /dev/null
		then
			dnf install -qy ${@}

			return 0
		fi
	done
}

function download {
	if [[ ! "$(which wget)" ]]
	then
		fatal "Please install wget."
	fi

	local file_name=${1##*/}
	local file_url=$1

	if [ ! -e data/${file_name} ]
	then
		run_as_me mkdir -p data

		echo ""
		echo "Downloading ${file_url}."
		echo ""

		run_as_me wget -nv ${file_url} -O data/${file_name}
	fi
}

function me_restore_from_original {
	if [ -e ${1}.original ]
	then
		run_as_me cp ${1}.original ${1}
	else
		run_as_me cp ${1} ${1}.original
	fi
}

function restore_from_original {
	if [ -e ${1}.original ]
	then
		cp ${1}.original ${1}
	else
		cp ${1} ${1}.original
	fi
}

function rpm_install {
	if ! rpm -q ${1} &> /dev/null
	then
		download ${2}

		local file_name=${2##*/}

		local file_extension=${file_name##*.}

		if [ "${file_extension}" == "rpm" ]
		then
			rpm --install --nodigest data/${file_name}

			rm data/${file_name}
		fi
	fi
}

function run_as_me {
	sudo -g me -u me "$@"
}