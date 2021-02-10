#!/bin/bash

# TODO: SmartGit, autokey to autostart, remove KDE option just openbox

source /home/me/dev/projects/liferay-basic-training/dotfiles/_common.sh

PACKAGE_NAMES=(
	os
	#
	java
	#
	chrome
	docker
	slack
	smartgit
	sublime
	virtualbox
	vscode
	zoom
)

for PACKAGE_NAME in ${PACKAGE_NAMES[@]}
do
	echo ""
	echo "Restoring ${PACKAGE_NAME}."
	echo ""

	cd /home/me/dev/projects/liferay-basic-training/dotfiles/${PACKAGE_NAME}

	./restore.sh
done

rm -f ~/.bash_history
sudo rm -f /root/.bash_history

#sudo shutdown -r now