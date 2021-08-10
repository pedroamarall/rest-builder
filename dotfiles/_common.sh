#!/bin/bash

function dnf_add_repo {
	repo_name=$(basename ${1})

	if [ ! -e /etc/yum.repos.d/${repo_name} ]
	then
		sudo dnf config-manager --add-repo=${1}
	fi
}

function dnf_erase {
	for rpm_name in "$@"
	do
		if [[ ! -z `rpm -aq ${rpm_name}` ]]
		then
			sudo dnf erase -y ${@}

			return 0
		fi
	done
}

function dnf_install {
	for rpm_name in "$@"
	do
		if [[ -z `rpm -aq ${rpm_name}` ]]
		then
			sudo dnf install -y ${@}

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
		mkdir -p data

		echo ""
		echo "Downloading ${file_url}."
		echo ""

		wget -nv ${file_url} -O data/${file_name}
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
	if [[ -z `rpm -aq ${1}` ]]
	then
		download ${2}

		local file_name=${2##*/}

		local file_extension=${file_name##*.}

		if [ "${file_extension}" == "rpm" ]
		then
			sudo rpm -i data/${file_name}

			rm data/${file_name}
		fi
	fi
}

function sudo {
	echo madeofdust | /usr/bin/sudo -S "${@}"
	#/usr/bin/sudo "${@}"
}

function sudo_restore_from_original {
	if [ -e ${1}.original ]
	then
		sudo cp ${1}.original ${1}
	else
		sudo cp ${1} ${1}.original
	fi
}