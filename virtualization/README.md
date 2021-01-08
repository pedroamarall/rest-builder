# Virtualization

## Docker

1. Docker is already installed on your machine. Review /home/me/dev/projects/liferay-basic-training/dotfiles/docker/restore.sh to see how Docker was installed.

1. Launch Terminator.

1. Type ***docker --version***.

1. Type ***d --version***.

1. The program ***docker*** located at ***/usr/bin/docker*** is aliased to ***d*** in ***~/.bashrc***. Open ***~/.bashrc*** to verify this is true.

1. Follow the tutorial in https://docker-curriculum.com. Stop after you reach the section ***Docker on AWS***.

1. Start Liferay.

	1. Type ***d pull liferay/portal:7.3.5-ga6***.

	1. Type ***d run -it -p 8080:8080 liferay/portal:7.3.5-ga6***.

	1. The first step to pull the Docker image is not necessary. If you tell Docker to run an image, and it is not available locally, it will pull down the image automatically for you.

## VirtualBox

1. VirtualBox is already installed on your machine. Review /home/me/dev/projects/liferay-basic-training/dotfiles/virtualbox/restore.sh to see how VirtualBox was installed.

1. TODO